package cn.osworks.aos.core.dao.plugin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import javax.xml.bind.PropertyException;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.executor.statement.BaseStatementHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.ParameterMode;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlOptionsHandler;
import cn.osworks.aos.core.dao.asset.DBType;
import cn.osworks.aos.core.dao.asset.MybatisReflectUtils;
import cn.osworks.aos.core.dao.plugin.dialect.Dialect;
import cn.osworks.aos.core.dao.plugin.dialect.db.DefaultDialect;
import cn.osworks.aos.core.dao.plugin.dialect.db.OracleDialect;
import cn.osworks.aos.core.dao.plugin.dialect.db.SqlServerDialect;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;


/**
 * <b>StatementHandlerPlugin插件</b>
 * <p>
 * 1、实现分页。2、实现动态排序。
 * </p>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-08-10
 */
@Intercepts({ @Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class }) })
public class StatementHandlerPlugin implements Interceptor {

	
	@SuppressWarnings("unused")
	private static Log log = LogFactory.getLog(StatementHandlerPlugin.class);

	// SQL语句匹配表达式
	private static String SQLID = "";

	@Override
	public Object intercept( Invocation pInvocation) throws Throwable {
		RoutingStatementHandler statementHandler = (RoutingStatementHandler) pInvocation.getTarget();
		BaseStatementHandler delegate = (BaseStatementHandler) MybatisReflectUtils.getValueByFieldName(statementHandler,
				"delegate");
		MappedStatement mappedStatement = (MappedStatement) MybatisReflectUtils.getValueByFieldName(delegate,
				"mappedStatement");
		BoundSql boundSql = delegate.getBoundSql();
		String rawSql = boundSql.getSql();
		
		//分流update相关操作
		boolean update = false;
		if (StringUtils.startsWithIgnoreCase(rawSql, "UPDATE")) {
			update = true;
		}
		if (StringUtils.startsWithIgnoreCase(rawSql, "INSERT")) {
			update = true;
		}
		if (StringUtils.startsWithIgnoreCase(rawSql, "DELETE")) {
			update = true;
		}
		if (StringUtils.startsWithIgnoreCase(rawSql, "CALL")) {
			update = true;
		}
		//如果是update相关操作则退出拦截继续执行代码
		if (update) {
			//实现一个辅助的小功能：如果配置jdbc_execute为只读模式的话，则不允许执行update操作
			if (StringUtils.equals(AOSCons.JDBC_EXECUTE_ONLYREAD, AOSXmlOptionsHandler.getValue("jdbc_execute"))) {
				throw new AOSException(13);
			}
		}		
		//从现在开始只剩下Select语句了
		Object parameterObject = boundSql.getParameterObject();
		//处理排序
		// 参数对象不为空且为Dto
		if (AOSUtils.isNotEmpty(parameterObject) && parameterObject instanceof Dto) {
			Dto paramDto = (Dto) parameterObject;
			//参数对象含有排序参数，则进行排序运算
			String orderString = paramDto.getOrder();
			if (AOSUtils.isNotEmpty(orderString)) {
				//不需要方言，排序语法都是通用的
				//对于字符串型的数值，在PGSQL中不能自动转换，导致不能正确排序的问题，再此就不做方言处理了。
				//性价比太低。其他数据库的字符串型数值都能自动转换，正确排序的。
				Dialect dialect = new DefaultDialect();
				String orderSql = dialect.getOrderSql(rawSql, orderString);
				// 将排序sql语句反射回BoundSql
				MybatisReflectUtils.setValueByFieldName(boundSql, "sql", orderSql);
			}
		}
		
		//处理分页
		// 匹配不到的需要分页的SQL直接返回(出现Page标志)
		if (!(mappedStatement.getId().matches(SQLID))) {
			return pInvocation.proceed();
		}
		// 参数对象为空时
		if (parameterObject == null) {
			throw new AOSException("分页查询参数对象不能为空");
		}
		Dto paramDto = null;
		// 参数对象为非Dto实例时
		if (!(parameterObject instanceof Dto)) {
			throw new AOSException("分页查询只能以Dto作为查询参数对象");
		}
		paramDto = (Dto) parameterObject;
		Integer startInteger = paramDto.getPageStart();
		Integer limitInteger = paramDto.getPageLimit();
		if (AOSUtils.isEmpty(startInteger) || AOSUtils.isEmpty(limitInteger)) {
			throw new AOSException("分页查询参数[start,limit]不能为空");
		}
		Boolean pageEnable = paramDto.getPageEnable();
		// 缺省当作分页处理
		pageEnable = pageEnable == null ? new Boolean(true) : pageEnable;
		// 有分页参数,但被显式指明不分页时
		if (!pageEnable) {
			return pInvocation.proceed();
		}
		//根据不同的数据库产品，启用不同的分页方言
		String dataBaseId =mappedStatement.getConfiguration().getDatabaseId();
		Dialect dialect = null;
		if (StringUtils.equalsIgnoreCase(dataBaseId, DBType.ORACLE)) {
			dialect = new OracleDialect();
		} else if(StringUtils.equalsIgnoreCase(dataBaseId, DBType.SQLSERVER)){
			dialect = new SqlServerDialect();
		} else {
			//大部分是通用的
			dialect = new DefaultDialect();
		}
		Connection connection = (Connection) pInvocation.getArgs()[0];
		count(dialect, boundSql, rawSql, connection, mappedStatement, paramDto);
		String pageSql = dialect.getPageSql(boundSql.getSql(), paramDto);
		// 将分页sql语句反射回BoundSql
		MybatisReflectUtils.setValueByFieldName(boundSql, "sql", pageSql);
		return pInvocation.proceed();
	}

	/**
	 * 查询记录总数
	 * 
	 * @param pDialect
	 * @param boundSql
	 * @param rawSql  不从boundSql中获取是考虑到在count的时候不需要增加Order
	 * @param connection
	 * @param mappedStatement
	 * @param paramDto
	 * @return
	 * @throws SQLException
	 */
	private void count(Dialect pDialect, BoundSql boundSql, String rawSql, Connection connection, MappedStatement mappedStatement,
			Dto paramDto) throws SQLException {
		String countSql = pDialect.getCountSql(rawSql);
		PreparedStatement countStmt = connection.prepareStatement(countSql);
		BoundSql countBSql = new BoundSql(mappedStatement.getConfiguration(), countSql,
				boundSql.getParameterMappings(), paramDto);
		setParameters(countStmt, mappedStatement, countBSql, paramDto);
		ResultSet rs = countStmt.executeQuery();
		int count = -1;
		if (rs.next()) {
			count = rs.getInt(1);
		}
		rs.close();
		countStmt.close();
		paramDto.setPageTotal(count);
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties p) {
		SQLID = p.getProperty("sqlid");
		if (AOSUtils.isEmpty(SQLID)) {
			try {
				throw new PropertyException("分页插件未设置SQLID拦截表达式属性");
			} catch (PropertyException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 对查询记录总数的SQL进行参数(?)设值,参考org.apache.ibatis.executor.parameter.
	 * DefaultParameterHandler
	 * 
	 * @param ps
	 * @param mappedStatement
	 * @param boundSql
	 * @param parameterObject
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	private void setParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql,
			Object parameterObject) throws SQLException {
		ErrorContext.instance().activity("setting parameters").object(mappedStatement.getParameterMap().getId());
		List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
		if (parameterMappings != null) {
			Configuration configuration = mappedStatement.getConfiguration();
			TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
			MetaObject metaObject = parameterObject == null ? null : configuration.newMetaObject(parameterObject);
			for (int i = 0; i < parameterMappings.size(); i++) {
				ParameterMapping parameterMapping = parameterMappings.get(i);
				if (parameterMapping.getMode() != ParameterMode.OUT) {
					Object value;
					String propertyName = parameterMapping.getProperty();
					PropertyTokenizer prop = new PropertyTokenizer(propertyName);
					if (parameterObject == null) {
						value = null;
					} else if (typeHandlerRegistry.hasTypeHandler(parameterObject.getClass())) {
						value = parameterObject;
					} else if (boundSql.hasAdditionalParameter(propertyName)) {
						value = boundSql.getAdditionalParameter(propertyName);
					} else if (propertyName.startsWith(ForEachSqlNode.ITEM_PREFIX)
							&& boundSql.hasAdditionalParameter(prop.getName())) {
						value = boundSql.getAdditionalParameter(prop.getName());
						if (value != null) {
							value = configuration.newMetaObject(value).getValue(
									propertyName.substring(prop.getName().length()));
						}
					} else {
						value = metaObject == null ? null : metaObject.getValue(propertyName);
					}
					@SuppressWarnings("rawtypes")
					TypeHandler typeHandler = parameterMapping.getTypeHandler();
					if (typeHandler == null) {
						throw new ExecutorException("There was no TypeHandler found for parameter " + propertyName
								+ " of statement " + mappedStatement.getId());
					}
					typeHandler.setParameter(ps, i + 1, value, parameterMapping.getJdbcType());
				}
			}
		}
	}

}

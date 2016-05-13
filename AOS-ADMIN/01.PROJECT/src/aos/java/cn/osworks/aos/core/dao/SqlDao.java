package cn.osworks.aos.core.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.SqlSessionUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.exception.ProcedureException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;

/**
 * <b>数据访问通用实现</b>
 * 
 * @author OSWorks-XC
 * @date 2013-10-06
 */
public class SqlDao extends SqlSessionDaoSupport {
	/**
	 * 查询单条记录
	 * 
	 * @param pSqlId
	 *            SQL语句ID号
	 * @param pObject
	 *            查询条件对象,可以是常规JavaBean、PO、Dto等。无参传null。
	 * @return Object 返回*Mapper.xml配置的返回类型对象
	 */
	public Object selectOne(String pSqlId, Object pObject) {
		Object resultObject = getSqlSession().selectOne(pSqlId, pObject);
		return resultObject;
	}

	/**
	 * 查询单条记录
	 * 
	 * @param pSqlId
	 *            SQL语句ID号
	 * @param pObject
	 *            查询条件对象,可以是常规JavaBean、PO、Dto等。无参传null。
	 * @return Object 返回Dto对象,如果*Mapper.xml的返回类型配置为PO,则将被内部转换为Dto.
	 */
	public Dto selectDto(String pSqlId, Object pObject) {
		Object resultObject = getSqlSession().selectOne(pSqlId, pObject);
		if (resultObject instanceof Dto) {
			return (Dto) resultObject;
		} else {
			Dto outDto = new HashDto();
			AOSUtils.copyProperties(resultObject, outDto);
			return outDto;
		}
	}

	/**
	 * 查询集合记录
	 * 
	 * @param pSqlId
	 *            SQL语句ID号
	 * @param pObject
	 *            查询条件对象 ,可以是常规JavaBean、PO、Dto等。无参传null。
	 */
	@SuppressWarnings("unchecked")
	public <T> T list(String pSqlId, Object pObject) {
		List<?> resultList = getSqlSession().selectList(pSqlId, pObject);
		return (T) resultList;
	}

	/**
	 * 插入记录
	 * 
	 * @param pSqlId
	 *            SQL语句ID号
	 * @param pObject
	 *            插入对象,可以是常规JavaBean、PO、Dto等。无参传null。
	 * @return 影响行数
	 */
	public int insert(String pSqlId, Object pObject) {
		int rows = getSqlSession().insert(pSqlId, pObject);
		return rows;
	}

	/**
	 * 更新记录
	 * 
	 * @param pSqlId
	 *            SQL语句ID号
	 * @param pObject
	 *            插入对象,可以是常规JavaBean、PO、Dto等。无参传null。
	 * @return 影响行数
	 */
	public int update(String pSqlId, Object pObject) {
		int rows = getSqlSession().update(pSqlId, pObject);
		return rows;
	}

	/**
	 * 删除记录
	 * 
	 * @param pSqlId
	 *            SQL语句ID号
	 * @param pObject
	 *            插入对象,可以是常规JavaBean、PO、Dto等。无参传null。
	 * @return 影响行数
	 */
	public int delete(String pSqlId, Object pObject) {
		int rows = getSqlSession().delete(pSqlId, pObject);
		return rows;
	}
	
	/**
	 * 调用存储过程
	 * 
	 * @param sqlId
	 * @param dto
	 */
	public void call(String sqlId, Dto procDto){
		getSqlSession().update(sqlId, procDto);
		if (AOSUtils.isNotEmpty(procDto.getAppCode())) {
			if (procDto.getAppCode() != AOSCons.PROC_SUCCESS) {
				throw new ProcedureException(sqlId, procDto.getAppCode(), procDto.getAppMsg());
			}
		}
	}

	/**
	 * 获取Connection对象
	 * 
	 * 此连接受Spring事务框架的管理
	 * 
	 * @return
	 */
	public Connection getConnection() {
		SqlSessionTemplate sqlSessionTemplate = (SqlSessionTemplate) getSqlSession();
		Connection connection = SqlSessionUtils.getSqlSession(sqlSessionTemplate.getSqlSessionFactory(),
				sqlSessionTemplate.getExecutorType(), sqlSessionTemplate.getPersistenceExceptionTranslator())
				.getConnection();
		return connection;
	}

	/**
	 * 获取Connection对象
	 * 
	 * 此连接已脱离Spring事务框架
	 * 
	 * @return
	 * @throws SQLException 
	 */
	public Connection getConnection2() throws SQLException {
		return getSqlSession().getConfiguration().getEnvironment().getDataSource().getConnection();
	}
	
	/**
	 * 获取当前SqlDao对应的数据库产品类型
	 * 
	 * @see cn.osworks.aos.core.dao.asset.DBType
	 * @return
	 */
	public  String getDatabaseId() {
		String dataBaseID = getSqlSession().getConfiguration().getDatabaseId();
		return dataBaseID;
	}
	
	/**
	 * 返回SqlSession对象
	 */
	public SqlSession getSqlSession() {
		return super.getSqlSession();
	}

}

package org.g4studio.common.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.common.dao.Reader;
import org.g4studio.core.exception.G4Exception;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.orm.xibatis.support.bridge.SqlMapClientDaoSupport;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;

/**
 * 数据读取器<br>
 * 基于iBatis实现,只有query权限,提供在Action中使用
 * 
 * @author OSWorks-XC
 * @since 2009-07-23
 */
public class ReaderImpl extends SqlMapClientDaoSupport implements Reader {

	private static Log log = LogFactory.getLog(ReaderImpl.class);

	/**
	 * 查询一条记录
	 * 
	 * @param SQL语句ID号
	 * @param parameterObject
	 *            查询条件对象(map javaBean)
	 */
	public Object queryForObject(String statementName, Object parameterObject) {
		return super.getSqlMapClientTemplate().queryForObject(statementName, parameterObject);
	}

	/**
	 * 查询一条记录
	 * 
	 * @param SQL语句ID号
	 */
	public Object queryForObject(String statementName) {
		return super.getSqlMapClientTemplate().queryForObject(statementName, new BaseDto());
	}

	/**
	 * 查询记录集合
	 * 
	 * @param SQL语句ID号
	 * @param parameterObject
	 *            查询条件对象(map javaBean)
	 */
	public List queryForList(String statementName, Object parameterObject) {
		return super.getSqlMapClientTemplate().queryForList(statementName, parameterObject);
	}

	/**
	 * 按分页查询
	 * 
	 * @param SQL语句ID号
	 * @param parameterObject
	 *            查询条件对象(map javaBean)
	 * @throws SQLException
	 */
	public List queryForPage(String statementName, Dto qDto) throws SQLException {
		Connection connection = getConnection();
		String dbNameString = connection.getMetaData().getDatabaseProductName().toLowerCase();
		try {
			connection.close();
		} catch (Exception e) {
			log.error(G4Constants.Exception_Head + "未正常关闭数据库连接");
			e.printStackTrace();
		}
		String start = qDto.getAsString("start");
		String limit = qDto.getAsString("limit");
		int startInt = 0;
		if (G4Utils.isNotEmpty(start)) {
			startInt = Integer.parseInt(start);
			if (dbNameString.indexOf("ora") > -1) {
				qDto.put("start", startInt + 1);
			} else if (dbNameString.indexOf("mysql") > -1) {
				qDto.put("start", startInt);
			} else {
				qDto.put("start", startInt);
			}
		} else {
			qDto.put("start", 0);
			log.warn("缺失分页起始参数,后台已经为你自动赋值，但建议您参照标准范例，如果不是分页查询请使用queryForList()方法");
		}
		
		if (G4Utils.isNotEmpty(limit)) {
			int limitInt = Integer.parseInt(limit);
			if (dbNameString.indexOf("ora") > -1) {
				qDto.put("end", limitInt + startInt);
			} else if (dbNameString.indexOf("mysql") > -1) {
				qDto.put("end", limitInt);
			} else {
				qDto.put("end", limitInt);
			}
		} else {
			qDto.put("end", 999999);
			log.warn("缺失分页终止参数,后台已经为你自动赋值，但建议您参照标准范例，如果不是分页查询请使用queryForList()方法");
		}
		Integer intStart = qDto.getAsInteger("start");
		Integer end = qDto.getAsInteger("end");
		return getSqlMapClientTemplate().queryForList(statementName, qDto, intStart.intValue(), end.intValue());
	}

	/**
	 * 查询记录集合
	 * 
	 * @param SQL语句ID号
	 */
	public List queryForList(String statementName) {
		return super.getSqlMapClientTemplate().queryForList(statementName, new BaseDto());
	}

	/**
	 * 获取Connection对象<br>
	 * 说明：虽然向Dao消费端暴露了获取Connection对象的方法但不建议直接获取Connection对象进行JDBC操作
	 * 
	 * @return 返回Connection对象
	 * @throws SQLException
	 */
	public Connection getConnection() throws SQLException {
		return getSqlMapClientTemplate().getDataSource().getConnection();
	}

	/**
	 * 获取DataSource对象<br>
	 * 说明：虽然向Dao消费端暴露了获取DataSource对象的方法但不建议直接获取DataSource对象进行JDBC操作
	 * 
	 * @return 返回DataSource对象
	 */
	public DataSource getDataSourceFromSqlMap() throws SQLException {
		return getSqlMapClientTemplate().getDataSource();
	}
}

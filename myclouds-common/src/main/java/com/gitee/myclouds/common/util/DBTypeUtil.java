package com.gitee.myclouds.common.util;

import java.sql.DatabaseMetaData;
import java.sql.SQLException;

import org.apache.commons.lang3.StringUtils;

/**
 * 数据库类型
 * 
 * @author xiongchun
 * @date 2015-10-25
 */
public class DBTypeUtil {

	public static final String ORACLE = "oracle";

	public static final String MYSQL = "mysql";

	public static final String SQLSERVER = "microsoft sql server";

	public static final String POSTGRESQL = "postgresql";

	public static final String H2 = "h2";

	/**
	 * 获取数据库产品类型标识
	 * 
	 * @param sqlDao
	 * @return
	 * @throws SQLException
	 */
	public static String getDatabaseId(DatabaseMetaData databaseMetaData) throws SQLException {
		String dataBaseID = null;
		String databaseProductName = databaseMetaData.getDatabaseProductName();
		// 是否需要处理?
		dataBaseID = databaseProductName;
		return dataBaseID;
	}

	/**
	 * 判断是否为Oracle
	 * 
	 * @param databaseMetaData
	 * @return
	 * @throws SQLException
	 */
	public static Boolean isOracle(DatabaseMetaData databaseMetaData) throws SQLException {
		Boolean flag = false;
		if (StringUtils.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), ORACLE)) {
			flag = true;
		}
		return flag;
	}

	/**
	 * 判断是否为SqlServer
	 * 
	 * @param databaseMetaData
	 * @return
	 * @throws SQLException
	 */
	public static Boolean isSqlServer(DatabaseMetaData databaseMetaData) throws SQLException {
		Boolean flag = false;
		if (StringUtils.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), SQLSERVER)) {
			flag = true;
		}
		return flag;
	}
}

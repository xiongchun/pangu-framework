package com.gitee.myclouds.builder.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;

import com.gitee.myclouds.builder.vo.ColumnVO;
import com.gitee.myclouds.builder.vo.DriverManagerOptVO;
import com.gitee.myclouds.builder.vo.IndexVO;
import com.gitee.myclouds.builder.vo.TableVO;
import com.gitee.myclouds.common.util.DBTypeUtil;
import com.gitee.myclouds.common.util.MyListUtil;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.google.common.collect.Lists;

/**
 * 获取数据库元数据的工具类
 * 
 * @author xiongchun
 * 
 */
public class DBMetaInfoUtil {

	/**
	 * 创建连接
	 * 
	 * 元数据操作，每次都需要新的连接对象。
	 * 
	 * @return
	 * @throws ClassNotFoundException
	 */
	public static Connection newConnection(DriverManagerOptVO driverOpt) {
		try {
			if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBTypeUtil.MYSQL)) {
				Class.forName("com.mysql.jdbc.Driver");
			} else if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBTypeUtil.POSTGRESQL)) {
				Class.forName("org.postgresql.Driver");
			} else if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBTypeUtil.ORACLE)) {
				Class.forName("oracle.jdbc.OracleDriver");
			} else if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBTypeUtil.SQLSERVER)) {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			} else if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBTypeUtil.H2)) {
				Class.forName("org.h2.Driver");
			} else {
				throw new UnsupportedOperationException(
						"你使用的数据库[" + driverOpt.getDataBaseType() + "]不被支持，请选择其他数据库产品或和我们联系。");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		try {
			Properties props = new Properties();
			props.setProperty("user", driverOpt.getUserName());
			props.setProperty("password", driverOpt.getPassword());
			String urlString = "";
			if (StringUtils.equalsIgnoreCase(DBTypeUtil.MYSQL, driverOpt.getDataBaseType())) {
				props.setProperty("remarks", "true"); // 获取元数据注释
				props.setProperty("useInformationSchema", "true"); // 获取元数据注释
				urlString = "jdbc:mysql://" + driverOpt.getIp() + ":" + driverOpt.getPort() + "/"
						+ driverOpt.getCatalog() + "?useUnicode=true&characterEncoding=utf-8";
			} else if (StringUtils.equalsIgnoreCase(DBTypeUtil.POSTGRESQL, driverOpt.getDataBaseType())) {
				urlString = "jdbc:postgresql://" + driverOpt.getIp() + ":" + driverOpt.getPort() + "/"
						+ driverOpt.getCatalog();
			} else if (StringUtils.equalsIgnoreCase(DBTypeUtil.ORACLE, driverOpt.getDataBaseType())) {
				props.setProperty("remarksReporting", "true"); // 获取元数据注释
				urlString = "jdbc:oracle:thin:@" + driverOpt.getIp() + ":" + driverOpt.getPort() + ":"
						+ driverOpt.getCatalog();
			} else if (StringUtils.equalsIgnoreCase(DBTypeUtil.SQLSERVER, driverOpt.getDataBaseType())) {
				urlString = "jdbc:sqlserver://" + driverOpt.getIp() + ":" + driverOpt.getPort() + ";database="
						+ driverOpt.getCatalog();
			} else if (StringUtils.equalsIgnoreCase(DBTypeUtil.H2, driverOpt.getDataBaseType())) {
				urlString = "jdbc:h2:" + driverOpt.getCatalog();
			}
			connection = DriverManager.getConnection(urlString, props);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	/**
	 * 获取表对象集合
	 * 
	 * @param databaseMetaData
	 * @param like
	 *            表名模糊匹配字符串
	 * @return
	 */
	public static List<TableVO> listTableVOs(DatabaseMetaData databaseMetaData, String likeTableName) {
		List<TableVO> tableVOs = Lists.newArrayList();
		try {
			ResultSet rs = null;
			String dataBaseID = databaseMetaData.getDatabaseProductName();
			if (StringUtils.equalsIgnoreCase(dataBaseID, DBTypeUtil.ORACLE)) {
				rs = databaseMetaData.getTables(null, StringUtils.upperCase(databaseMetaData.getUserName()), null,
						new String[] { "TABLE" });
			} else {
				rs = databaseMetaData.getTables(null, null, null, new String[] { "TABLE" });
			}
			while (rs.next()) {
				TableVO tableVO = new TableVO();
				if (StringUtils.equalsIgnoreCase(dataBaseID, DBTypeUtil.ORACLE)) {
					tableVO.setOwner(rs.getString("TABLE_SCHEM"));
				} else {
					tableVO.setOwner(rs.getString("TABLE_CAT"));
				}
				tableVO.setName(rs.getString("TABLE_NAME"));
				// 排除Oracle的回收站中垃圾表
				if (StringUtils.contains(tableVO.getName(), "$")) {
					continue;
				}
				tableVO.setComment(rs.getString("REMARKS"));
				tableVOs.add(tableVO);
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (MyUtil.isNotEmpty(likeTableName)) {
			String jql = "SELECT * FROM :MyList WHERE name LIKE :name";
			Dto dto = Dtos.newDto("name", "%" + likeTableName + "%");
			tableVOs = MyListUtil.list(tableVOs, TableVO.class, jql, dto);
		}

		return tableVOs;
	}

	/**
	 * 获取指定表
	 * 
	 * @param databaseMetaData
	 * @param tableName
	 * @return
	 */
	public static TableVO getTableVO(DatabaseMetaData databaseMetaData, String tableName) {
		List<TableVO> tableVOs = listTableVOs(databaseMetaData, tableName);
		String jql = "SELECT * FROM :MyList WHERE name = :name";
		Dto dto = Dtos.newDto("name", tableName);
		tableVOs = MyListUtil.list(tableVOs, TableVO.class, jql, dto);
		TableVO tableVO = null;
		if (MyUtil.isNotEmpty(tableVOs)) {
			tableVO = tableVOs.get(0);
			if (MyUtil.isEmpty(tableVO.getComment())
					|| StringUtils.startsWithIgnoreCase(tableVO.getComment(), "InnoDB")) {
				tableVO.setComment(tableVO.getName());
			}
		}
		return tableVO;
	}

	/**
	 * 获取表字段集合
	 * 
	 * @param databaseMetaData
	 * @param tableName
	 *            表名精确匹配
	 * @return
	 */
	public static List<ColumnVO> listColumnVOs(DatabaseMetaData databaseMetaData, String equalTableName) {
		List<ColumnVO> columnVOs = Lists.newArrayList();
		try {
			ResultSet rs = databaseMetaData.getColumns(null, StringUtils.upperCase(databaseMetaData.getUserName()),
					equalTableName, null);
			while (rs.next()) {
				ColumnVO columnVO = new ColumnVO();
				columnVO.setName(rs.getString("COLUMN_NAME"));
				columnVO.setComment(rs.getString("REMARKS"));
				columnVO.setDefaultValue(rs.getString("COLUMN_DEF"));
				String type = rs.getString("TYPE_NAME");
				columnVO.setType(type);
				if (StringUtils.equalsIgnoreCase(type, "varchar") || StringUtils.equalsIgnoreCase(type, "char")) {
					columnVO.setLength(rs.getInt("CHAR_OCTET_LENGTH"));
				} else {
					columnVO.setLength(rs.getInt("COLUMN_SIZE"));
				}

				String nullable = rs.getString("IS_NULLABLE");
				if (StringUtils.equalsIgnoreCase("YES", nullable)) {
					columnVO.setNullAble(true);
				} else {
					columnVO.setNullAble(false);
				}
				columnVO.setNumber(rs.getInt("ORDINAL_POSITION"));
				columnVO.setScale(rs.getInt("DECIMAL_DIGITS"));
				columnVO.setTablename(rs.getString("TABLE_NAME"));
				// oracle 没有 IS_AUTOINCREMENT 列
				if (DBTypeUtil.isOracle(databaseMetaData)) {
					columnVO.setIsAutoincrement(false);
				} else if (DBTypeUtil.isSqlServer(databaseMetaData)) {
					if (StringUtils.equalsIgnoreCase(rs.getString("IS_AUTOINCREMENT"), "YES")) {
						columnVO.setIsAutoincrement(true);
					} else {
						columnVO.setIsAutoincrement(false);
					}
				} else {
					columnVO.setIsAutoincrement(rs.getBoolean("IS_AUTOINCREMENT"));
				}
				columnVOs.add(columnVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 标识表主键字段
		List<ColumnVO> pkColumnVOs = listPKColumnVOs(databaseMetaData, equalTableName);
		for (ColumnVO columnVO : columnVOs) {
			List<ColumnVO> tempList = Lists.newArrayList();
			String jql = "SELECT * FROM :MyList WHERE name = :name";
			Dto dto = Dtos.newDto("name", columnVO.getName());
			tempList = MyListUtil.list(pkColumnVOs, ColumnVO.class, jql, dto);
			if (MyUtil.isNotEmpty(tempList)) {
				columnVO.setIsPkey(true);
			} else {
				columnVO.setIsPkey(false);
			}
		}
		return columnVOs;
	}

	/**
	 * 获取表唯一索引集合
	 * 
	 * @param databaseMetaData
	 * @param tableName
	 *            表名精确匹配
	 * @return
	 */
	public static List<IndexVO> listIndexVOs(DatabaseMetaData databaseMetaData, String tableName) {
		List<ColumnVO> columnVOs = listColumnVOs(databaseMetaData, tableName);
		List<IndexVO> indexVOs = Lists.newArrayList();
		try {
			// 包含主键索引和唯一索引
			ResultSet rs = databaseMetaData.getIndexInfo(null, null, tableName, true, false);
			List<String> rawIndexList = Lists.newArrayList();
			while (rs.next()) {
				String indexName = StringUtils.lowerCase(rs.getString("INDEX_NAME"));
				if (!StringUtils.equalsIgnoreCase(indexName, "PRIMARY")) {
					rawIndexList.add(indexName);
				}
			}
			//去重
			List<String> indexList = new ArrayList<String>(new HashSet<String>(rawIndexList));
		    for (String indexName : indexList) {
				IndexVO indexVO = new IndexVO();
				indexVO.setName(indexName);
				indexVO.setType("uk");
				ResultSet rs2 = databaseMetaData.getIndexInfo(null, null, tableName, true, false);
				while (rs2.next()) {
					if (StringUtils.equalsIgnoreCase(indexName, rs2.getString("INDEX_NAME"))) {
						String jql = "SELECT * FROM :MyList WHERE name = :name";
						ColumnVO columnVO = (ColumnVO)MyListUtil.selectOne(columnVOs, ColumnVO.class, jql, Dtos.newDto("name", rs2.getString("COLUMN_NAME")));
						indexVO.addColumnVO(columnVO);
					}
				}
				indexVOs.add(indexVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return indexVOs;
	}

	/**
	 * 获取表主键字段集合
	 * 
	 * @param databaseMetaData
	 * @param tableName
	 *            表名精确匹配
	 * @return
	 */
	private static List<ColumnVO> listPKColumnVOs(DatabaseMetaData databaseMetaData, String tableName) {
		List<ColumnVO> columnVOs = Lists.newArrayList();
		try {
			ResultSet rs = databaseMetaData.getPrimaryKeys(null, null, tableName);
			while (rs.next()) {
				ColumnVO columnVO = new ColumnVO();
				columnVO.setName(rs.getString("COLUMN_NAME"));
				columnVOs.add(columnVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return columnVOs;
	}

	/**
	 * 获取主键集合
	 * 
	 * @param columnVOs
	 * @return
	 */
	public static List<ColumnVO> getPKColumnVOs(List<ColumnVO> columnVOs) {
		String jql = "SELECT * FROM :MyList WHERE isPkey = :isPkey";
		Dto dto = Dtos.newDto("isPkey", true);
		columnVOs = MyListUtil.list(columnVOs, ColumnVO.class, jql, dto);
		return columnVOs;
	}

	/**
	 * 获取指定表字段
	 * 
	 * @param databaseMetaData
	 * @param tableName
	 * @param columnName
	 * @return
	 */
	public static ColumnVO getColumnVO(DatabaseMetaData databaseMetaData, String tableName, String columnName) {
		List<ColumnVO> columnVOs = listColumnVOs(databaseMetaData, tableName);
		String jql = "SELECT * FROM :MyList WHERE tablename = :tablename AND name = :name";
		Dto dto = Dtos.newDto("tablename", tableName);
		dto.put("name", columnName);
		columnVOs = MyListUtil.list(columnVOs, ColumnVO.class, jql, dto);
		ColumnVO columnVO = null;
		if (MyUtil.isNotEmpty(columnVOs)) {
			columnVO = columnVOs.get(0);
		}
		return columnVO;
	}

}
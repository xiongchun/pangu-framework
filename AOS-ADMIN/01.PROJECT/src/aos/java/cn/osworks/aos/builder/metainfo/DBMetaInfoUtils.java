package cn.osworks.aos.builder.metainfo;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.builder.asset.DriverManagerOpt;
import cn.osworks.aos.builder.metainfo.vo.ColumnVO;
import cn.osworks.aos.builder.metainfo.vo.TableVO;
import cn.osworks.aos.core.asset.AOSListUtils;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.dao.asset.DBType;
import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;

import com.google.common.collect.Lists;

/**
 * 获取数据库元数据的工具类
 * 
 * @author OSWorks-XC
 * 
 */
public class DBMetaInfoUtils {
	
	/**
	 * 获取元数据
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static DatabaseMetaData getDatabaseMetaData() throws SQLException{
		Connection connection = newConnection();
		if (connection == null) {
			throw new AOSException(10);
		}
		return newConnection().getMetaData();
	}
	
	/**
	 * 创建连接
	 * 
	 * 元数据操作，每次都需要新的连接对象。
	 * 
	 * @return
	 * @throws ClassNotFoundException
	 */
	public static Connection newConnection() {
		DriverManagerOpt driverOpt = new DriverManagerOpt();
		driverOpt.setDataBaseType(WebCxt.getDicCodeDesc("webide_jdbc", "dataBaseType")); 
		driverOpt.setIp(WebCxt.getDicCodeDesc("webide_jdbc", "ip"));
		driverOpt.setPort(WebCxt.getDicCodeDesc("webide_jdbc", "port"));
		driverOpt.setCatalog(WebCxt.getDicCodeDesc("webide_jdbc", "catalog"));
		driverOpt.setUserName(WebCxt.getDicCodeDesc("webide_jdbc", "userName"));
		driverOpt.setPassword(WebCxt.getDicCodeDesc("webide_jdbc", "password"));
		return newConnection(driverOpt);
	}

	/**
	 * 创建连接
	 * 
	 * 元数据操作，每次都需要新的连接对象。
	 * 
	 * @return
	 * @throws ClassNotFoundException
	 */
	public static Connection newConnection(DriverManagerOpt driverOpt) {
		try {
			if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBType.MYSQL)) {
				Class.forName("com.mysql.jdbc.Driver");
			} else if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBType.POSTGRESQL)) {
				Class.forName("org.postgresql.Driver");
			} else if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBType.ORACLE)) {
				Class.forName("oracle.jdbc.OracleDriver");
			}else if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBType.SQLSERVER)) {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			}else if (StringUtils.equalsIgnoreCase(driverOpt.getDataBaseType(), DBType.H2)) {
				Class.forName("org.h2.Driver");
			} else {
				throw new UnsupportedOperationException("你使用的数据库[" + driverOpt.getDataBaseType()
						+ "]不被支持，请选择其他数据库产品或和我们联系。");
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
			if (StringUtils.equalsIgnoreCase(DBType.MYSQL, driverOpt.getDataBaseType())) {
				props.setProperty("remarks", "true"); //获取元数据注释
				props.setProperty("useInformationSchema", "true");  //获取元数据注释
				urlString = "jdbc:mysql://" + driverOpt.getIp() + ":" + driverOpt.getPort() + "/"
						+ driverOpt.getCatalog() + "?useUnicode=true&characterEncoding=utf-8";
			} else if (StringUtils.equalsIgnoreCase(DBType.POSTGRESQL, driverOpt.getDataBaseType())) {
				urlString = "jdbc:postgresql://" + driverOpt.getIp() + ":" + driverOpt.getPort() + "/"
						+ driverOpt.getCatalog();
			} else if (StringUtils.equalsIgnoreCase(DBType.ORACLE, driverOpt.getDataBaseType())) {
				props.setProperty("remarksReporting", "true");  //获取元数据注释
				urlString = "jdbc:oracle:thin:@" + driverOpt.getIp() + ":" + driverOpt.getPort() + ":"
						+ driverOpt.getCatalog();
			}else if (StringUtils.equalsIgnoreCase(DBType.SQLSERVER, driverOpt.getDataBaseType())) {
				urlString = "jdbc:sqlserver://" + driverOpt.getIp() + ":" + driverOpt.getPort() + ";database="
						+ driverOpt.getCatalog();
			}else if (StringUtils.equalsIgnoreCase(DBType.H2, driverOpt.getDataBaseType())) {
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
			String dataBaseID =  databaseMetaData.getDatabaseProductName();
			if (StringUtils.equalsIgnoreCase(dataBaseID, DBType.ORACLE)) {
				rs = databaseMetaData.getTables(null, StringUtils.upperCase(databaseMetaData.getUserName()), null, new String[] { "TABLE" });
			}else {
				rs = databaseMetaData.getTables(null, null, null, new String[] { "TABLE" });
			}
			while (rs.next()) {
				TableVO tableVO = new TableVO();
				if (StringUtils.equalsIgnoreCase(dataBaseID, DBType.ORACLE)) {
					tableVO.setOwner(rs.getString("TABLE_SCHEM"));
				}else {
					tableVO.setOwner(rs.getString("TABLE_CAT"));
				}
				tableVO.setName(rs.getString("TABLE_NAME"));
				String comment = rs.getString("REMARKS");
				// mysql的表注释会跟上一些其他信息。用户基本信息表; InnoDB free: 9216 kB
				if (StringUtils.equalsIgnoreCase(DBType.getDatabaseId(databaseMetaData), DBType.MYSQL)) {
					if (StringUtils.contains(comment, ";")) {
						comment = StringUtils.substringBefore(comment, ";");
					} else {
						comment = StringUtils.EMPTY;
					}
				}
				//排除Oracle的回收站中垃圾表
				if (StringUtils.contains(tableVO.getName(), "$")) {
					continue;
				}
				tableVO.setComment(comment);
				tableVOs.add(tableVO);
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (AOSUtils.isNotEmpty(likeTableName)) {
			String jql = "SELECT * FROM :AOSList WHERE name LIKE :name";
			Dto dto = Dtos.newDto("name", "%" + likeTableName + "%");
			tableVOs = AOSListUtils.select(tableVOs, TableVO.class, jql, dto);
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
		String jql = "SELECT * FROM :AOSList WHERE name = :name";
		Dto dto = Dtos.newDto("name", tableName);
		tableVOs = AOSListUtils.select(tableVOs, TableVO.class, jql, dto);
		TableVO tableVO = null;
		if (AOSUtils.isNotEmpty(tableVOs)) {
			tableVO = tableVOs.get(0);
		}
		if (AOSUtils.isEmpty(tableVO.getComment()) || StringUtils.startsWithIgnoreCase(tableVO.getComment(), "InnoDB")) {
			tableVO.setComment(tableVO.getName());
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
			ResultSet rs = databaseMetaData.getColumns(null, StringUtils.upperCase(databaseMetaData.getUserName()), equalTableName, null);
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
				//oracle 没有 IS_AUTOINCREMENT 列
				if (DBType.isOracle(databaseMetaData)) {
					columnVO.setIsAutoincrement(false);
				}else if (DBType.isSqlServer(databaseMetaData)) {
					if (StringUtils.equalsIgnoreCase(rs.getString("IS_AUTOINCREMENT"), "YES")) {
						columnVO.setIsAutoincrement(true);
					}else {
						columnVO.setIsAutoincrement(false);
					}
				}else {
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
			String jql = "SELECT * FROM :AOSList WHERE name = :name";
			Dto dto = Dtos.newDto("name", columnVO.getName());
			tempList = AOSListUtils.select(pkColumnVOs, ColumnVO.class, jql, dto);
			if (AOSUtils.isNotEmpty(tempList)) {
				columnVO.setIsPkey(true);
			} else {
				columnVO.setIsPkey(false);
			}
		}
		return columnVOs;
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
	public  static List<ColumnVO> getPKColumnVOs(List<ColumnVO> columnVOs){
		String jql = "SELECT * FROM :AOSList WHERE isPkey = :isPkey";
		Dto dto = Dtos.newDto("isPkey", true);
		columnVOs = AOSListUtils.select(columnVOs, ColumnVO.class, jql, dto);
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
		String jql = "SELECT * FROM :AOSList WHERE tablename = :tablename AND name = :name";
		Dto dto = Dtos.newDto("tablename", tableName);
		dto.put("name", columnName);
		columnVOs = AOSListUtils.select(columnVOs, ColumnVO.class, jql, dto);
		ColumnVO columnVO = null;
		if (AOSUtils.isNotEmpty(columnVOs)) {
			columnVO = columnVOs.get(0);
		}
		return columnVO;
	}

}
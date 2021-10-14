package com.gitee.pulanos.pangu.framework.generator.utils;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.generator.pojo.Column;
import com.gitee.pulanos.pangu.framework.generator.pojo.Table;
import com.gitee.pulanos.pangu.framework.generator.utils.CommonUtil;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collectors;

/**
 * 数据库元数据信息获取工具
 */
@Slf4j
public class DbMetaInfoUtil {

    /**
     * 数据库类型标识
     */
    public final static class DbType {
        public final static String MYSQL = "MYSQL";
        public final static String POSTGRESQL = "POSTGRESQL";
        public final static String ORACLE = "ORACLE";
        public final static String H2 = "H2";
        public static final String SQLSERVER = "MICROSOFT SQL SERVER";

        @SneakyThrows
        public static boolean isMySql(DatabaseMetaData databaseMetaData) {
            return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), MYSQL);
        }

        @SneakyThrows
        public static boolean isOracle(DatabaseMetaData databaseMetaData) {
            return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), ORACLE);
        }

        @SneakyThrows
        public static boolean isPostgreSql(DatabaseMetaData databaseMetaData) {
            return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), POSTGRESQL);
        }

        @SneakyThrows
        public static boolean isH2(DatabaseMetaData databaseMetaData) {
            return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), H2);
        }

        @SneakyThrows
        public static boolean isSqlServer(DatabaseMetaData databaseMetaData) {
            return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), SQLSERVER);
        }
    }

    @SneakyThrows
    public static Connection createConnect(String url, String user, String password){
        Validator.validateNotEmpty(url, "url参数不能为空");
        Validator.validateNotEmpty(user, "user参数不能为空");
        Validator.validateNotEmpty(password, "password参数不能为空");
        Properties properties = new Properties();
        properties.setProperty("user", user);
        properties.setProperty("password", password);
        if (StrUtil.containsIgnoreCase(url, DbType.MYSQL)){
            // 获取元数据注释（老版本的mysql驱动需要）
            properties.setProperty("remarks", "true");
            properties.setProperty("useInformationSchema", "true");
        }else if (StrUtil.containsIgnoreCase(url, DbType.ORACLE)){
            // 获取元数据注释
            properties.setProperty("remarksReporting", "true");
        }
        return DriverManager.getConnection(url, properties);
    }

    /**
     * 获取表信息集合
     * @param connection
     * @return
     */
    @SneakyThrows
    public static List<Table> listTables(Connection connection) {
        List<Table> tables = new ArrayList<>();
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        ResultSet rs = null;
        if (DbType.isOracle(databaseMetaData)) {
            rs = databaseMetaData.getTables(connection.getCatalog(), StringUtils.upperCase(databaseMetaData.getUserName()), null,
                    new String[]{"TABLE"});
        } else {
            String url = databaseMetaData.getURL();
            String catalog = StrUtil.subAfter(url, "/", true);
            rs = databaseMetaData.getTables(catalog, null, null, new String[]{"TABLE"});
        }
        while (rs.next()) {
            Table table = new Table();
            if (DbType.isOracle(databaseMetaData)) {
                table.setOwner(rs.getString("TABLE_SCHEM"));
            } else {
                table.setOwner(rs.getString("TABLE_CAT"));
            }
            table.setName(rs.getString("TABLE_NAME"));
            String comment = rs.getString("REMARKS");
            // 老版本的mysql驱动在mysql的表注释会跟上一些其他信息。用户基本信息表; InnoDB free: 9216 kB
            if (DbType.isMySql(databaseMetaData)) {
                if (StrUtil.contains(comment, ";")) {
                    comment = StrUtil.subBefore(comment, ";", false);
                }
            }
            // 排除Oracle的回收站中垃圾表
            if (StrUtil.contains(table.getName(), "$")) {
                continue;
            }
            table.setComment(comment);
            tables.add(table);
        }
        if (rs != null) {
            rs.close();
        }
        return tables;
    }

    /**
     * 获取指定表信息
     * @param tables
     * @param tableName
     * @return
     */
    public static Table findTableInfo(List<Table> tables, String tableName) {
        Table table = CollUtil.findOneByField(tables, "name", tableName);
        if (table == null) {
            log.error("表{}不存在, 忽略代码生成步骤。", tableName);
        }
        return table;
    }

    /**
     * 获取指定表字段集合
     *
     * @param connection
     * @param tableName
     * @return
     */
    @SneakyThrows
    public static List<Column> listTableColumns(Connection connection, String tableName) {
        List<Column> columns = new ArrayList<>();
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        ResultSet rs = databaseMetaData.getColumns(connection.getCatalog(), StringUtils.upperCase(databaseMetaData.getUserName()),
                tableName, null);
        while (rs.next()) {
            Column column = new Column();
            column.setName(rs.getString("COLUMN_NAME"));
            column.setComment(rs.getString("REMARKS"));
            column.setDefaultValue(rs.getString("COLUMN_DEF"));
            String type = rs.getString("TYPE_NAME");
            column.setType(type);
            if (StringUtils.equalsIgnoreCase(type, "varchar") || StringUtils.equalsIgnoreCase(type, "char")) {
                column.setLength(rs.getInt("CHAR_OCTET_LENGTH"));
            } else {
                column.setLength(rs.getInt("COLUMN_SIZE"));
            }

            String nullable = rs.getString("IS_NULLABLE");
            if (StringUtils.equalsIgnoreCase("YES", nullable)) {
                column.setNullAble(true);
            } else {
                column.setNullAble(false);
            }
            column.setNumber(rs.getInt("ORDINAL_POSITION"));
            column.setScale(rs.getInt("DECIMAL_DIGITS"));
            column.setTablename(rs.getString("TABLE_NAME"));
            // oracle 没有 IS_AUTOINCREMENT 列
            if (DbType.isOracle(databaseMetaData)) {
                column.setIsAutoincrement(false);
            } else {
                String isAutoincrement = rs.getString("IS_AUTOINCREMENT");
                if (StringUtils.equalsIgnoreCase(isAutoincrement, "YES") || StringUtils.equalsIgnoreCase(isAutoincrement, "TRUE")) {
                    column.setIsAutoincrement(true);
                } else {
                    column.setIsAutoincrement(false);
                }
            }
            columns.add(column);
        }

        // 标识表主键字段
        List<Column> pkColumns = listPKColumns(connection, tableName);
        List<String> pkColumnNames = pkColumns.stream().map(Column::getName).collect(Collectors.toList());
        for (Column column : columns) {
            if (CollUtil.contains(pkColumnNames, column.getName())){
                column.setIsPkey(true);
            }else {
                column.setIsPkey(false);
            }
        }

        // 标识表字段的Java类型
        for (Column column : columns) {
            column.setJavaType(CommonUtil.toJavaType(column.getType()));
        }
        return columns;
    }

    /**
     * 获取表主键字段集合
     *
     * @param connection
     * @param tableName
     * @return
     */
    @SneakyThrows
    private static List<Column> listPKColumns(Connection connection, String tableName) {
        List<Column> columns = new ArrayList<>();
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        ResultSet rs = databaseMetaData.getPrimaryKeys(connection.getCatalog(), StringUtils.upperCase(databaseMetaData.getUserName()), tableName);
        while (rs.next()) {
            Column column = new Column();
            column.setName(rs.getString("COLUMN_NAME"));
            columns.add(column);
        }
        return columns;
    }

}

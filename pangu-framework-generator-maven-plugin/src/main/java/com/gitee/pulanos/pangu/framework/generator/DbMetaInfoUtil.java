package com.gitee.pulanos.pangu.framework.generator;

import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.meta.TableType;
import com.gitee.pulanos.pangu.framework.generator.pojo.Table;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * 数据库元数据信息获取工具
 */
public class DbMetaInfoUtil {

    /**
     * 数据库类型标识
     */
    public final static class DbType{
        public final static String MYSQL = "MYSQL";
        public final static String POSTGRESQL = "POSTGRESQL";
        public final static String ORACLE = "ORACLE";
        public final static String H2 = "H2";
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
        String dataBaseID = databaseMetaData.getDatabaseProductName();
        if (StrUtil.equalsIgnoreCase(dataBaseID, DbType.ORACLE)) {
            rs = databaseMetaData.getTables(null, databaseMetaData.getUserName().toUpperCase(), null,
                    new String[] { "TABLE" });
        } else {
            String url = databaseMetaData.getURL();
            String catalog = StrUtil.subAfter(url, "/", true);
            rs = databaseMetaData.getTables(catalog, null, null, new String[] {"TABLE"});
        }
        while (rs.next()) {
            Table table = new Table();
            if (StrUtil.equalsIgnoreCase(dataBaseID, DbType.ORACLE)) {
                table.setOwner(rs.getString("TABLE_SCHEM"));
            } else {
                table.setOwner(rs.getString("TABLE_CAT"));
            }
            table.setName(rs.getString("TABLE_NAME"));
            String comment = rs.getString("REMARKS");
            // 老版本的mysql驱动在mysql的表注释会跟上一些其他信息。用户基本信息表; InnoDB free: 9216 kB
            if (StrUtil.equalsIgnoreCase(dataBaseID, DbType.MYSQL)) {
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
        return null;
    }

}

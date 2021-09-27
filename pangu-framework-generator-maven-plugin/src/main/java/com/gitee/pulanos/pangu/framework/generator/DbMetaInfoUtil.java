package com.gitee.pulanos.pangu.framework.generator;

import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Db;
import lombok.SneakyThrows;
import org.apache.commons.dbutils.DbUtils;

import java.sql.Connection;
import java.sql.DriverManager;
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
    private static Connection createConnect(String url, String user, String password){
        Validator.validateNotEmpty(url, "url参数不能为空");
        Validator.validateNotEmpty(url, "user参数不能为空");
        Validator.validateNotEmpty(url, "password参数不能为空");
        Properties properties = new Properties();
        properties.setProperty("user", user);
        properties.setProperty("password", password);
        if (StrUtil.containsIgnoreCase(url, DbType.MYSQL)){
            // 获取元数据注释
            properties.setProperty("remarks", "true");
            properties.setProperty("useInformationSchema", "true");
        }else if (StrUtil.containsIgnoreCase(url, DbType.ORACLE)){
            // 获取元数据注释
            properties.setProperty("remarksReporting", "true");
        }
        return DriverManager.getConnection(url, properties);
    }

}

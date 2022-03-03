/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.gitee.pulanos.pangu.framework.generator.utils;

import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.generator.Constants;
import lombok.SneakyThrows;
import org.apache.commons.lang3.StringUtils;

import java.sql.DatabaseMetaData;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 工具类
 * @author xiongchun
 */
public class CommonUtil {

    /**
     * 其它关键字可以继续补充
     */
    public static final List TABLE_KEYWORDS = Arrays.asList("order");

    /**
     * 数据库字段类型和Java类型的映射关系
     * @param colDbType 数据库字段类型
     * @return Java类型
     */
    public static String toJavaType(String colDbType) {
        String javaType = "String";
        if (Constants.DbColType.DATE.equalsIgnoreCase(colDbType)) {
            javaType = Constants.JavaType.DATE;
        }
        if (Constants.DbColType.DATETIME.equalsIgnoreCase(colDbType)) {
            javaType = Constants.JavaType.DATE;
        }
        if (Constants.DbColType.TIMESTAMP.equalsIgnoreCase(colDbType)) {
            javaType = Constants.JavaType.DATE;
        }
        if (Constants.DbColType.NUMERIC.equalsIgnoreCase(colDbType)) {
            javaType = Constants.JavaType.BIGDECIMAL;
        }
        if (Constants.DbColType.NUMBER.equalsIgnoreCase(colDbType)) {
            javaType = Constants.JavaType.BIGDECIMAL;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, Constants.DbColType.DECIMAL) != -1) {
            javaType = Constants.JavaType.BIGDECIMAL;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, Constants.DbColType.INT) != -1) {
            javaType = Constants.JavaType.INTEGER;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, Constants.DbColType.BIGINT) != -1) {
            javaType = Constants.JavaType.LONG;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, Constants.DbColType.BYTE) != -1) {
            javaType = Constants.JavaType.BYTE;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, Constants.DbColType.BLOB) != -1) {
            javaType = Constants.JavaType.BYTE;
        }
        if (StringUtils.indexOfIgnoreCase(colDbType, Constants.DbColType.BINARY) != -1) {
            javaType = Constants.JavaType.BYTE;
        }
        return javaType;
    }

    @SneakyThrows
    public static boolean isMySql(DatabaseMetaData databaseMetaData) {
        return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), Constants.DbType.MYSQL);
    }

    @SneakyThrows
    public static boolean isOracle(DatabaseMetaData databaseMetaData) {
        return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), Constants.DbType.ORACLE);
    }

    @SneakyThrows
    public static boolean isPostgreSql(DatabaseMetaData databaseMetaData) {
        return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), Constants.DbType.POSTGRESQL);
    }

    @SneakyThrows
    public static boolean isH2(DatabaseMetaData databaseMetaData) {
        return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), Constants.DbType.H2);
    }

    @SneakyThrows
    public static boolean isSqlServer(DatabaseMetaData databaseMetaData) {
        return StrUtil.containsIgnoreCase(databaseMetaData.getDatabaseProductName(), Constants.DbType.SQLSERVER);
    }

    /**
     * 检查业务表名是否含有数据库关键字
     * @param name
     * @return
     */
    public static void checkTableKeywords(String name) {
        if (TABLE_KEYWORDS.contains(name.toLowerCase())){
            throw new IllegalArgumentException(StrUtil.format("表名: {} 是数据库关键字，为避免后续不必要的麻烦请修改表名。", name));
        }
    }
}

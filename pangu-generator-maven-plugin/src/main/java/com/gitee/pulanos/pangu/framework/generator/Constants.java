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

package com.gitee.pulanos.pangu.framework.generator;

/**
 * 常量表
 * @author xiongchun
 */
public class Constants {

    /**
     * Java数据类型
     */
    public final static class JavaType {
        public final static String STRING = "String";
        public final static String DATE = "Date";
        public final static String BIGDECIMAL = "BigDecimal";
        public final static String LONG = "Long";
        public final static String INTEGER = "Integer";
        public final static String BYTE = "byte[]";
    }

    /**
     * 数据库类型标识
     */
    public final static class DbType {
        public final static String MYSQL = "MYSQL";
        public final static String POSTGRESQL = "POSTGRESQL";
        public final static String ORACLE = "ORACLE";
        public final static String H2 = "H2";
        public static final String SQLSERVER = "MICROSOFT SQL SERVER";
    }

    /**
     * 数据库字段类型标识
     */
    public final static class DbColType {
        public final static String DATE = "date";
        public final static String DATETIME = "datetime";
        public final static String TIMESTAMP = "timestamp";
        public final static String NUMERIC = "numeric";
        public static final String NUMBER = "number";
        public static final String DECIMAL = "decimal";
        public static final String INT = "int";
        public static final String BIGINT = "bigint";
        public static final String BYTE = "byte";
        public static final String BLOB = "blob";
        public static final String BINARY = "binary";
    }
}

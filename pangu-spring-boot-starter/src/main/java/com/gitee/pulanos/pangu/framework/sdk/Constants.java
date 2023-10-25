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

package com.gitee.pulanos.pangu.framework.sdk;

/**
 * 通用常量表
 *
 * @author xiongchun
 * @since 1.0.0
 */
public final class Constants {

    /**
     * 接口请求返回状态码
     */
    public final static class Code {

        /**
         * 接口调用成功，调用结果请参考具体API对应的业务返回参数。
         */
        public final static String SUCCESS = "200";

        /**
         * 业务失败
         */
        public final static String BIZ_FAILED = "3000";

        /**
         * 参数校验非法
         */
        public final static String ILLEGAL_ARGUMENT = "3001";

        /**
         * 数据库 SQL 异常
         */
        public final static String SQL_EXCEPTION = "3002";

        /**
         * 系统失败
         */
        public final static String SYSTEM_FAILED = "4000";

    }

    /**
     * 框架提示信息
     */
    public final static class Msg {
        /**
         * 应用开始启动
         */
        public final static String APP_START = "(ô‿ô) PanGu Dev Framework is Starting.... ㊥ 盘古开发框架开始启动...";
        /**
         * 应用启动失败
         */
        public final static String APP_START_ERROR = "(ô‿ô) PanGu Dev Framework Failed to Start ㊥ 盘古开发框架启动失败";
        /**
         * 应用启动成功
         */
        public final static String APP_START_SUCCESS = "(ô‿ô) PanGu Dev Framework Started successfully ㊥ 盘古开发框架启动成功";
        /**
         * 应用退出
         */
        public final static String APP_EXIT = "(ô‿ô) PanGu Dev Framework Stopped ㊥ 盘古开发框架已停止";
        /**
         * OK消息
         */
        public final static String OK = "[OK] ";
    }

    /**
     * Nacos配置
     */
    public final static class Nacos {
        /**
         * 缺省组
         */
        public final static String DEFAULT_GROUP = "DEFAULT_GROUP";

    }

    /**
     * profileActive
     */
    public final static class profilesActive{
        public final static String DEV = "dev";
        public final static String TEST = "test";
        public final static String PROD = "prod";
        public final static String DEMO = "demo";
    }

}

package com.gitee.pulanos.pangu.framework;

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
        public final static String SUCCESS = "10000";
        /**
         * 服务暂不可用（网关异常错误）
         */
        public final static String ERROR_GATEWAY = "40000";
        /**
         * 服务暂不可用（业务服务异常错误）
         */
        public final static String ERROR_SERVICE = "40001";
        /**
         * 授权错误或权限不足
         */
        public final static String FAIL_AUTH = "40002";
        /**
         * 缺少必选参数
         */
        public final static String FAIL_MISSING_ARG = "40002";
        /**
         * 非法的参数
         */
        public final static String FAIL_INVALID_ARG = "40003";
        /**
         * 接口限流（调用次数或调用频率超限）
         */
        public final static String FAIL_CALL_LIMITED = "40003";

    }

    /**
     * 框架提示信息
     */
    public final static class Msg {
        /**
         * 应用开始启动
         */
        public final static String START = "(ô‿ô) PanGu Dev Framework is Starting.... ㊥ 盘古开发框架开始启动...";
        /**
         * 应用启动失败
         */
        public final static String START_ERROR = "(ô‿ô) PanGu Dev Framework Failed to Start ㊥ 盘古开发框架启动失败";
        /**
         * 应用启动成功
         */
        public final static String START_SUCCESS = "(ô‿ô) PanGu Dev Framework Started successfully ㊥ 盘古开发框架启动成功";
    }

}

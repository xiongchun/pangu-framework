package com.gitee.pulanos.pangu.framework.constants;

/**
 * 平台通用常量表
 *
 * @author xiongchun
 * @since 1.0.0
 */
public class Constants {

    /**
     * 接口请求返回状态码
     */
    public static class Code {
        /**
         * 接口调用成功，调用结果请参考具体API对应的业务返回参数。
         */
        public static final String SUCCESS = "10000";
        /**
         * 服务暂不可用（网关异常错误）
         */
        public static final String ERROR_GATEWAY = "40000";
        /**
         * 服务暂不可用（业务服务异常错误）
         */
        public static final String ERROR_SERVICE = "40001";
        /**
         * 授权错误或权限不足
         */
        public static final String FAIL_AUTH = "40002";
        /**
         * 缺少必选参数
         */
        public static final String FAIL_MISSING_ARG = "40002";
        /**
         * 非法的参数
         */
        public static final String FAIL_INVALID_ARG = "40003";
        /**
         * 接口限流（调用次数或调用频率超限）
         */
        public static final String FAIL_CALL_LIMITED = "40003";

    }

}

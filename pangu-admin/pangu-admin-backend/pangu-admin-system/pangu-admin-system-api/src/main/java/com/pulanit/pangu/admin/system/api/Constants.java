package com.pulanit.pangu.admin.system.api;

/**
 * 常量表
 */
public class Constants {

    /**
     * 根节点ID
     */
    public final static Long ROOT_NODE_ID = 0L;

    /**
     * 性别
     * 1:男 2:女 9:未知
     */
    public final static class Sex {
        //男
        public final static String MALE = "1";
        //女
        public final static String FEMALE = "2";
        //未知
        public final static String UNKNOWN = "9";
    }

    /**
     * 用户状态
     * 1:启用 9:停用
     */
    public final static class UserStatus {
        public final static String ENABLED = "1";
        public final static String DISABLED = "9";
    }

    /**
     * 用户类型
     * 1:缺省
     */
    public final static class UserType {
        public final static String DEFAULT = "1";
    }

    /**
     * 资源类型
     */
    public final static class ResourceType {
        public final static String MENU = "menu";
        public final static String BUTTON = "button";
        public final static String IFRAME = "iframe";
        public final static String LINK = "link";
    }
}

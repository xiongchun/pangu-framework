package com.pulanit.pangu.admin.common.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * 用户对象
 */
@Data
@Accessors(chain = true)
public class UserInfo implements Serializable {

    private static final long serialVersionUID = 8318897826240866795L;

    /**
     * 流水号
     */
    private Long id;

    /**
     * 登录帐号
     */
    private String userName;

    /**
     * 姓名
     */
    private String name;

    /**
     * 绑定邮箱
     */
    private String mail;

    /**
     * 性别
     */
    private String sex;

    /**
     * 用户状态
     */
    private String status;

    /**
     * 用户类型
     */
    private String type;

    /**
     * 所属部门
     */
    private Long deptId;

    /**
     * 业务扩展码
     */
    private String bizCode;

    /**
     * 头像URL
     */
    private String avatar;

    /**
     * 绑定手机
     */
    private String mobileNumber;

    /**
     * 首页控制台类型(0/1)
     */
    private String dashboard;

    /**
     * 用户所属角色列表
     */
    private List<String> role;

}

package com.pulanit.pangu.admin.system.api.param;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 用户新增入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class UserAddIn implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 流水号
     */
    private Long id;

    /**
     * 登录帐号
     */
    private String userName;

    /**
     * 帐号密码
     */
    private String password;

    /**
     * 姓名
     */
    private String name;

    /**
     * 电子邮件
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
     * 备注
     */
    private String remark;

    /**
     * 所属角色集合
     */
    private long[] roleIds;

}

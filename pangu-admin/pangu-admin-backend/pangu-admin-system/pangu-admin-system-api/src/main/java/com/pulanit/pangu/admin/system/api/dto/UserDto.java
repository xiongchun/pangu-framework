package com.pulanit.pangu.admin.system.api.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 登录用户对象
 */
@Data
@Accessors(chain = true)
public class UserDto implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 流水号
     */
    private Integer id;

    /**
     * 用户姓名
     */
    private String name;

    /**
     * 登录账号
     */
    private String account;

    /**
     * 登录手机号
     */
    private String mobile;

    /**
     * 用户状态
     */
    @TableField(value = "status")
    private String status;

    /**
     * 用户类型
     */
    private String type;

    /**
     * 所属部门
     */
    private Integer orgId;

    /**
     * 扩展码
     */
    private String bizCode;

    /**
     * 扩展JSON
     */
    private String ext;

    /**
     * 首页控制台类型(0/1)
     */
    private String dashboard;

}

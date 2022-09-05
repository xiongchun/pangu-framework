package com.pulanit.pangu.admin.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 用户表
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-09-05 22:37:03
 */
@Data
@Accessors(chain = true)
@TableName("user")
public class UserEntity implements Serializable {

   private static final long serialVersionUID=1L;

   /**
    * 流水号
    */
   @TableId(value = "id", type = IdType.AUTO)
   private Integer id;

   /**
    * 登录帐号
    */
   @TableField(value = "account")
   private String account;

   /**
    * 帐号密码
    */
   @TableField(value = "password")
   private String password;

   /**
    * 登录手机号
    */
   @TableField(value = "mobile")
   private String mobile;

   /**
    * 用户姓名
    */
   @TableField(value = "name")
   private String name;

   /**
    * 用户状态
    */
   @TableField(value = "status")
   private String status;

   /**
    * 用户类型
    */
   @TableField(value = "type")
   private String type;

   /**
    * 所属部门
    */
   @TableField(value = "org_id")
   private Integer orgId;

   /**
    * 扩展码
    */
   @TableField(value = "biz_code")
   private String bizCode;

   /**
    * 扩展JSON
    */
   @TableField(value = "ext")
   private String ext;

   /**
    * 创建时间
    */
   @TableField(value = "gmt_created")
   @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
   private Date gmtCreated;

   /**
    * 创建人
    */
   @TableField(value = "created_by")
   private String createdBy;

   /**
    * 修改时间
    */
   @TableField(value = "gmt_modified")
   @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
   private Date gmtModified;

   /**
    * 修改人
    */
   @TableField(value = "modified_by")
   private String modifiedBy;

}

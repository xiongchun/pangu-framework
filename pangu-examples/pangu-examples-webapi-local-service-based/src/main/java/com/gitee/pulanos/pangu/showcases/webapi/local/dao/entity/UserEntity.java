package com.gitee.pulanos.pangu.showcases.webapi.local.dao.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;
import java.util.Date;

/**
 * 用户信息表
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2021-12-06 23:21:27
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
   private Long id;

   /**
    * 姓名
    */
   @TableField(value = "name")
   private String name;

   /**
    * 生日
    */
   @JsonFormat(pattern="yyyy-MM-dd")
   @TableField(value = "birthday")
   private Date birthday;

   /**
    * 年龄
    */
   @TableField(value = "age")
   private Integer age;

   /**
    * 用户类型
    */
   @TableField(value = "user_type")
   private String userType;

   /**
    * 创建时间
    */
   @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
   @TableField(value = "gmt_create")
   private Date gmtCreate;

   /**
    * 更新时间
    */
   @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
   @TableField(value = "gmt_update")
   private Date gmtUpdate;

}

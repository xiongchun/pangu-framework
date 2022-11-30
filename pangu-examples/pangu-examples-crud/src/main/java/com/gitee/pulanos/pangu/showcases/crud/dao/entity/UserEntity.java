package com.gitee.pulanos.pangu.showcases.crud.dao.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 用户信息表
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-04-21 18:49:36
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
   @TableField(value = "birthday")
   @JsonFormat(pattern="yyyy-MM-dd")
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
   @TableField(value = "gmt_create")
   @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
   private Date gmtCreate;

   /**
    * 更新时间
    */
   @TableField(value = "gmt_update")
   @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
   private Date gmtUpdate;

}

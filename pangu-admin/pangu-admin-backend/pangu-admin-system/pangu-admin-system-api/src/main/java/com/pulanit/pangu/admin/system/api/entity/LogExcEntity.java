package com.pulanit.pangu.admin.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 异常日志表
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-11-07 14:13:43
 */
@Data
@Accessors(chain = true)
@TableName("log_exc")
public class LogExcEntity implements Serializable {

   private static final long serialVersionUID=1L;

   /**
    *  流水号
    */
   @TableId(value = "id", type = IdType.AUTO)
   private Long id;

   /**
    * 应用名称标识
    */
   @TableField(value = "appName")
   private String appName;

   /**
    * 异常编码
    */
   @TableField(value = "code")
   private String code;

   /**
    * 异常内容
    */
   @TableField(value = "message")
   private String message;

   /**
    * 异常发生时间
    */
   @TableField(value = "gmt_throwed")
   @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
   private Date gmtThrowed;

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
    * 逻辑删除标志
    */
   @TableField(value = "deleted")
   private Long deleted;

}

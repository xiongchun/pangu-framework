package com.pulanit.pangu.admin.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 操作日志表(失败)
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-11-10 15:11:34
 */
@Data
@Accessors(chain = true)
@TableName("log_fail")
public class LogFailEntity implements Serializable {

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
    * 路径入口标识
    */
   @TableField(value = "path")
   private String path;

   /**
    * 标签标识
    */
   @TableField(value = "tag")
   private String tag;

   /**
    * 业务耗时
    */
   @TableField(value = "time_elapsed")
   private Integer timeElapsed;

   /**
    * 经办时间
    */
   @TableField(value = "gmt_executed")
   @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
   private Date gmtExecuted;

   /**
    * 经办人
    */
   @TableField(value = "created_by")
   private Long createdBy;

   /**
    * 经办人姓名
    */
   @TableField(value = "created_by_name")
   private String createdByName;

   /**
    * 创建时间
    */
   @TableField(value = "gmt_created")
   @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
   private Date gmtCreated;

   /**
    * 输入
    */
   @TableField(value = "input")
   private String input;

   /**
    * 输出
    */
   @TableField(value = "output")
   private String output;

   /**
    * 逻辑删除标志
    */
   @TableField(value = "deleted")
   private Long deleted;

}

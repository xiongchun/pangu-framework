package com.pulanit.pangu.admin.system.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 资源-API接口表
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-10-04 21:19:53
 */
@Data
@Accessors(chain = true)
@TableName("resource_api")
public class ResourceApiEntity implements Serializable {

   private static final long serialVersionUID=1L;

   /**
    * 流水号
    */
   @TableId(value = "id", type = IdType.AUTO)
   private Long id;

   /**
    * 资源流水号
    */
   @TableField(value = "resource_id")
   private Long resourceId;

   /**
    * API定义
    */
   @TableField(value = "api_url")
   private String apiUrl;

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

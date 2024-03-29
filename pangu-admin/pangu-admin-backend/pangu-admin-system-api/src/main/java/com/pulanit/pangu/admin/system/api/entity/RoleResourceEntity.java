package com.pulanit.pangu.admin.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 角色-资源表
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-11-10 15:11:34
 */
@Data
@Accessors(chain = true)
@TableName("role_resource")
public class RoleResourceEntity implements Serializable {

   private static final long serialVersionUID=1L;

   /**
    * 流水号
    */
   @TableId(value = "id", type = IdType.AUTO)
   private Long id;

   /**
    * 角色ID
    */
   @TableField(value = "role_id")
   private Long roleId;

   /**
    * 资源ID
    */
   @TableField(value = "resource_id")
   private Long resourceId;

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

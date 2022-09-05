package com.pulanit.pangu.admin.system.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 菜单资源表
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-09-05 22:37:03
 */
@Data
@Accessors(chain = true)
@TableName("menu")
public class MenuEntity implements Serializable {

   private static final long serialVersionUID=1L;

   /**
    * 流水号
    */
   @TableId(value = "id", type = IdType.AUTO)
   private Integer id;

   /**
    * 所属上级
    */
   @TableField(value = "parent_id")
   private Integer parentId;

   /**
    * 名称
    */
   @TableField(value = "name")
   private String name;

   /**
    * 路由地址
    */
   @TableField(value = "route_path")
   private String routePath;

   /**
    * 类型
    */
   @TableField(value = "type")
   private String type;

   /**
    * 图标
    */
   @TableField(value = "icon")
   private String icon;

   /**
    * 是否启用
    */
   @TableField(value = "enabled")
   private String enabled;

   /**
    * 排序号
    */
   @TableField(value = "sort_no")
   private Integer sortNo;

   /**
    * 接口权限列表（JSON格式）
    */
   @TableField(value = "apis")
   private String apis;

   /**
    * 隐藏菜单
    */
   @TableField(value = "hidden")
   private String hidden;

   /**
    * 隐藏面包屑
    */
   @TableField(value = "crumbs_hidden")
   private String crumbsHidden;

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

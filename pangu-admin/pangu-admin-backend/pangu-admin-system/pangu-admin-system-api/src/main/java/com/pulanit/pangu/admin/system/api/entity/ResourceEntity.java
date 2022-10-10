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
 * 资源表
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-10-04 21:19:53
 */
@Data
@Accessors(chain = true)
@TableName("resource")
public class ResourceEntity implements Serializable {

   private static final long serialVersionUID=1L;

   /**
    * 流水号
    */
   @TableId(value = "id", type = IdType.AUTO)
   private Long id;

   /**
    * 所属上级
    */
   @TableField(value = "parent_id")
   private Long parentId;

   /**
    * 资源名称
    */
   @TableField(value = "title")
   private String title;

   /**
    * 资源标识
    */
   @TableField(value = "resource_key")
   private String resourceKey;

   /**
    * 类型
    */
   @TableField(value = "type")
   private String type;

   /**
    * 路由地址
    */
   @TableField(value = "path")
   private String path;

   /**
    * 视图组件位置
    */
   @TableField(value = "component")
   private String component;

   /**
    * 图标
    */
   @TableField(value = "icon")
   private String icon;

   /**
    * 是否隐藏菜单(详情页等)
    */
   @TableField(value = "hidden")
   private String hidden;

   /**
    * 是否整页打开路由
    */
   @TableField(value = "fullpage")
   private String fullpage;

   /**
    * 是否固定(标签卡片没有关闭按钮)
    */
   @TableField(value = "affix")
   private String affix;

   /**
    * 排序号
    */
   @TableField(value = "sort_no")
   private Integer sortNo;

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

   /**
    * 逻辑删除标志
    */
   @TableField(value = "deleted")
   private Long deleted;

}

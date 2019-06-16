package com.gitee.myclouds.system.domain.mymodule;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

/**
 * <b>资源模块事件注册表[my_module]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2019-06-10 22:02:02
 */
@Data
@ToString
// @Accessors(chain = true) 此注解和BeanUtils的属性复制冲突，暂时不适用链式编程注解
public class MyModuleEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	//流水号
	private Integer id;	

	//所属上级
	private Integer parent_id;	

	//名称
	private String name;	

	//URL
	private String url;	

	//类型
	private String type;	

	//图标
	private String icon;	

	//是否启用
	private String is_enable;	

	//排序号
	private Integer sort_no;	

	//备注
	private String remark;	

}
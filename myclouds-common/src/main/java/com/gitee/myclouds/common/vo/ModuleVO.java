package com.gitee.myclouds.common.vo;

import com.gitee.myclouds.common.wrapper.VO;

import lombok.Getter;
import lombok.Setter;

/**
 * 资源模块VO对象
 * 
 * @author xiongchun
 *
 */
@Getter
@Setter
public class ModuleVO extends VO{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 流水号
	 */
	private Integer id;	
	/**
	 * 所属上级
	 */
	private Integer parent_id;	
	/**
	 * 名称
	 */
	private String name;	
	/**
	 * URL
	 */
	private String url;	
	/**
	 * 类型
	 */
	private String type;	
	/**
	 * 图标
	 */
	private String icon;	
	/**
	 * 是否启用
	 */
	private String is_enable;	
	/**
	 * 排序号
	 */
	private Integer sort_no;	
	/**
	 * 备注
	 */
	private String remark;

}

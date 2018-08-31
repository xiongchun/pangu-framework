package com.gitee.myclouds.common.vo;

import java.util.List;

import com.gitee.myclouds.common.wrapper.VO;

import lombok.Getter;
import lombok.Setter;

/**
 * 功能菜单简单值对象(配合前端使用的数据结构)
 * 
 * @author xiongchun
 *
 */
@Getter
@Setter
public class MenuVO extends VO{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 菜单ID
	 */
	private Integer id;
	
	/**
	 * 父节点ID
	 */
	private Integer parent_id;
	
	/**
	 * 菜单名称
	 */
	private String name;
	
	/**
	 * 菜单访问路径
	 */
	private String url;
	
	/**
	 * 菜单图标
	 */
	private String icon;
	
	/**
	 * 子菜单
	 */
	private List<MenuVO> subMenus;
	
}

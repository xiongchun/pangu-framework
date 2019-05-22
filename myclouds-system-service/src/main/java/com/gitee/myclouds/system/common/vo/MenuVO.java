package com.gitee.myclouds.system.common.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 功能菜单简单值对象(配合前端使用的数据结构)
 * 
 * @author xiongchun
 *
 */
@Data
@ToString
@Accessors(chain = true)
public class MenuVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//菜单ID
	private Integer id;
	
	//父节点ID
	private Integer parent_id;
	
	//菜单名称
	private String name;
	
	//菜单访问路径
	private String url;
	
	//菜单图标
	private String icon;
	
	//子菜单
	private List<MenuVO> subMenus;
	
}

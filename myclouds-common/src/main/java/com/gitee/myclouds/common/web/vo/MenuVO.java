package com.gitee.myclouds.common.web.vo;

import java.util.List;

import com.gitee.myclouds.toolbox.wrap.VO;

/**
 * 功能菜单简单值对象
 * 
 * @author xiongchun
 *
 */
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
	 * 展开菜单的CSS类名(menu-open)
	 */
	private String openClass;
	
	/**
	 * 子菜单
	 */
	private List<MenuVO> subMenus;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParent_id() {
		return parent_id;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public List<MenuVO> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<MenuVO> subMenus) {
		this.subMenus = subMenus;
	}

	public String getOpenClass() {
		return openClass;
	}

	public void setOpenClass(String openClass) {
		this.openClass = openClass;
	}
	
}

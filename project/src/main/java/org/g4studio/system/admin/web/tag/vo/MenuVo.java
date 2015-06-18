package org.g4studio.system.admin.web.tag.vo;

import org.g4studio.core.metatype.BaseVo;

/**
 * 菜单值对象
 * 
 * @author XiongChun
 * @since 2010-01-22
 */
public class MenuVo extends BaseVo {

	private String menuid;
	private String menuname;
	private String iconcls;
	private String parentid;
	private String request;
	private String leaf;
	private String isNotLast;
	private String isRoot;
	private String expanded;
	private String menupath;
	private String icon;
	private String checked;
	private String shortcut;
	private Integer width;
	private Integer height;
	private String scrollbar;
	private String maxed;

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public String getScrollbar() {
		return scrollbar;
	}

	public void setScrollbar(String scrollbar) {
		this.scrollbar = scrollbar;
	}

	public String getMenuid() {
		return menuid;
	}

	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public String getIsNotLast() {
		return isNotLast;
	}

	public void setIsNotLast(String isNotLast) {
		this.isNotLast = isNotLast;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public void setLeaf(String leaf) {
		this.leaf = leaf;
	}

	public String getParentid() {
		return parentid;
	}

	public String getRequest() {
		return request;
	}

	public String getIsRoot() {
		return isRoot;
	}

	public void setIsRoot(String isRoot) {
		this.isRoot = isRoot;
	}

	public String getIconcls() {
		return iconcls;
	}

	public void setIconcls(String iconcls) {
		this.iconcls = iconcls;
	}

	public String getLeaf() {
		return leaf;
	}

	public String getExpanded() {
		return expanded;
	}

	public void setExpanded(String expanded) {
		this.expanded = expanded;
	}

	public String getMenupath() {
		return menupath;
	}

	public void setMenupath(String menupath) {
		this.menupath = menupath;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getShortcut() {
		return shortcut;
	}

	public void setShortcut(String shortcut) {
		this.shortcut = shortcut;
	}

	public String getMaxed() {
		return maxed;
	}

	public void setMaxed(String maxed) {
		this.maxed = maxed;
	}

}

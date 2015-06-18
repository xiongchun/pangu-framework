package org.g4studio.system.admin.web.tag.vo;

import org.g4studio.core.metatype.BaseVo;

/**
 * 部门值对象
 * @author XiongChun
 * @since 2010-05-22
 */
public class DeptVo extends BaseVo{
	private String deptid;
	private String deptname;
	private String parentid;
	private String icon;
	private String isroot;
	public String getDeptid() {
		return deptid;
	}
	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getParentid() {
		return parentid;
	}
	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getIsroot() {
		return isroot;
	}
	public void setIsroot(String isroot) {
		this.isroot = isroot;
	}

}

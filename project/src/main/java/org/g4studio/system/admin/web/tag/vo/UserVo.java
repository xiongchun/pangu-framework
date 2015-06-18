package org.g4studio.system.admin.web.tag.vo;

import org.g4studio.core.metatype.BaseVo;

/**
 * 人员值对象
 * 
 * @author XiongChun
 * @since 2010-05-22
 */
public class UserVo extends BaseVo {
	private String userid;
	private String username;
	private String deptid;
	private String iconcls;
	private String account;
	private String usertype;
	private String checked;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDeptid() {
		return deptid;
	}

	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}

	public String getIconcls() {
		return iconcls;
	}

	public void setIconcls(String iconcls) {
		this.iconcls = iconcls;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}
}

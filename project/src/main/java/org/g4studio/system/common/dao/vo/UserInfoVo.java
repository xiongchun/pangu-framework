package org.g4studio.system.common.dao.vo;

import org.g4studio.core.metatype.BaseVo;

/**
 * 和用户相关的字段,用于存储到Session容器中的值对象
 * 
 * @author XiongChun
 * @since 2010-01-13
 */
public class UserInfoVo extends BaseVo {

	/**
	 * 用户编号：varchar2(8) <Primary Key>
	 */
	private String userid;

	/**
	 * 用户名：varchar2(20)
	 */
	private String username;

	/**
	 * 登陆帐户：varchar2(20)
	 */
	private String account;

	/**
	 * 密码：varchar2(20)
	 */
	private String password;

	/**
	 * 性别(0:未知;1:男;2:女)：varchar2(2)
	 */
	private String sex;

	/**
	 * 部门编号：varchar2(8)
	 */
	private String deptid;

	/**
	 * 锁定标志(0:锁定;1:激活)：varchar2(2)
	 */
	private String lock;

	/**
	 * 自定部门编号
	 */
	private String customId;
	
	/**
	 * 自定义主题
	 */
	private String theme;
	
	/**
	 * 会话ID
	 */
	private String sessionID;
	
	/**
	 * 会话创建时间
	 */
	private String sessionCreatedTime;
	
	/**
	 * 登录IP
	 */
	private String loginIP;
	
	/**
	 * 浏览器
	 */
	private String explorer;
	
	/**
	 * 部门名称
	 */
	private String deptname;
	
	/**
	 * 自定义布局方案
	 */
	private String layout;

	/**
	 * Constractor
	 */
	public UserInfoVo() {
	}

	/**
	 * Constractor
	 * 
	 * @param <code>userid</code>
	 */
	public UserInfoVo(String userid) {
		this.userid = userid;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDeptid() {
		return this.deptid;
	}

	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}

	public String getLock() {
		return this.lock;
	}

	public void setLock(String lock) {
		this.lock = lock;
	}

	public String getCustomId() {
		return customId;
	}

	public void setCustomId(String customId) {
		this.customId = customId;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getSessionID() {
		return sessionID;
	}

	public void setSessionID(String sessionID) {
		this.sessionID = sessionID;
	}

	public String getLoginIP() {
		return loginIP;
	}

	public void setLoginIP(String loginIP) {
		this.loginIP = loginIP;
	}

	public String getSessionCreatedTime() {
		return sessionCreatedTime;
	}

	public void setSessionCreatedTime(String sessionCreatedTime) {
		this.sessionCreatedTime = sessionCreatedTime;
	}

	public String getExplorer() {
		return explorer;
	}

	public void setExplorer(String explorer) {
		this.explorer = explorer;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	
	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

}

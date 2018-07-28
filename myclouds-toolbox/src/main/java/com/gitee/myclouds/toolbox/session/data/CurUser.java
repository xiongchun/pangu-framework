package com.gitee.myclouds.toolbox.session.data;

import java.io.Serializable;
import java.util.List;

/**
 * 当前会话用户数据对象
 * 
 * @author xiongchun
 *
 */
// TODO 需要增加更多配置信息和权限信息
public class CurUser implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 用户ID
	 */
	private Integer id;
	
	/**
	 * 当前会话ID
	 */
	private String sessionId;
	
	/**
	 * 所属部门ID
	 */
	private Integer orgId;

	/**
	 * 用户登录帐号
	 */
	private String account;

	/**
	 * 用户姓名
	 */
	private String name;
	
	/**
	 * 角色ID集合
	 */
	private List<String> roleIds;

	public List<String> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<String> roleIds) {
		this.roleIds = roleIds;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}
	

}

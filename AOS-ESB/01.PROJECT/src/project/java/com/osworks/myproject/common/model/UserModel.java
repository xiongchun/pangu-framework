package com.osworks.myproject.common.model;

import java.io.Serializable;

/**
 * 
 * 用户模型（业务系统可根据自己的需求调整用户模型）
 * 
 * @author xiongchun
 *
 */
public class UserModel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//登录帐号
	private String account;
	
	//密码
	private String password;
	
	//姓名
	private String name;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}

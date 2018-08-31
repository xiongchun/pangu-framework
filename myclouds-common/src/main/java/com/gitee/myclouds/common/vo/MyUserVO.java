package com.gitee.myclouds.common.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

/**
 * 当前会话用户数据对象
 * 
 * @author xiongchun
 *
 */
// TODO 需要增加更多配置信息和权限信息
@Getter
@Setter
public class MyUserVO implements Serializable {

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

}

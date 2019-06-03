package com.gitee.myclouds.base.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 当前会话用户数据对象（用于后端操作用户，非C端客户）
 * 
 * @author xiongchun
 *
 */
@Data
@ToString
@Accessors(chain = true)
public class UserVO implements Serializable {

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

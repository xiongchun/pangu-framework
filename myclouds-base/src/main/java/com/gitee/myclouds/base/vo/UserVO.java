package com.gitee.myclouds.base.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

/**
 * 当前会话用户值对象
 * 
 * @author xiongchun
 *
 */
@Data
@ToString
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
	 * 扩展码
	 */
	private String biz_code;	

    /**
     * 扩展JSON
     */
	private String ext;	
	
	/**
	 * 用户类型
	 */
	private String type;	
	
	/**
	 * Token
	 */
	private String token;

	/**
	 * 组织值对象
	 */
	private OrgVO orgVO;
	
}

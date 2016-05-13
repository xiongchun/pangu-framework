package cn.osworks.aos.system.modules.dao.vo;

import cn.osworks.aos.core.typewrap.VO;

/**
 * <b>页面元素授权信息</b>
 * 
 * @author OSWorks-XC
 * @date 2014-10-13
 */
public class ElementVO extends VO{
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * 授权流水号
	 */
	private String id_;
	
	/**
	 * 页面元素流水号
	 */
	private String el_id_;
	
	/**
	 * 页面元素DOM ID
	 */
	private String dom_id_;
	
	/**
	 * 页面元素名称
	 */
	private String name_;
	
	/**
	 * 页面元素类型
	 */
	private String type_;
	
	/**
	 * 所属功能模块流水号
	 */
	private String module_id_;
	
	/**
	 * 功能模块名称
	 */
	private String module_name_;
	
	/**
	 * 所属页面流水号
	 */
	private String page_id_;
	
	/**
	 * 功能页面名称
	 */
	private String page_name_;
		
	/**
	 * 用户流水号
	 */
	private String user_id_;
	
	/**
	 * 角色流水号
	 */
	private String role_id_;
	
	/**
	 * 岗位流水号
	 */
	private String post_id_;
	
	/**
	 * 授权类型
	 */
	private String grant_type_;

	public String getId_() {
		return id_;
	}

	public void setId_(String id_) {
		this.id_ = id_;
	}

	public String getDom_id_() {
		return dom_id_;
	}

	public void setDom_id_(String dom_id_) {
		this.dom_id_ = dom_id_;
	}

	public String getName_() {
		return name_;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public String getModule_id_() {
		return module_id_;
	}

	public void setModule_id_(String module_id_) {
		this.module_id_ = module_id_;
	}

	public String getModule_name_() {
		return module_name_;
	}

	public void setModule_name_(String module_name_) {
		this.module_name_ = module_name_;
	}

	public String getUser_id_() {
		return user_id_;
	}

	public void setUser_id_(String user_id_) {
		this.user_id_ = user_id_;
	}

	public String getRole_id_() {
		return role_id_;
	}

	public void setRole_id_(String role_id_) {
		this.role_id_ = role_id_;
	}

	public String getPost_id_() {
		return post_id_;
	}

	public void setPost_id_(String post_id_) {
		this.post_id_ = post_id_;
	}

	public String getGrant_type_() {
		return grant_type_;
	}

	public void setGrant_type_(String grant_type_) {
		this.grant_type_ = grant_type_;
	}

	public String getType_() {
		return type_;
	}

	public void setType_(String type_) {
		this.type_ = type_;
	}

	public String getEl_id_() {
		return el_id_;
	}

	public void setEl_id_(String el_id_) {
		this.el_id_ = el_id_;
	}

	public String getPage_id_() {
		return page_id_;
	}

	public void setPage_id_(String page_id_) {
		this.page_id_ = page_id_;
	}

	public String getPage_name_() {
		return page_name_;
	}

	public void setPage_name_(String page_name_) {
		this.page_name_ = page_name_;
	}

}

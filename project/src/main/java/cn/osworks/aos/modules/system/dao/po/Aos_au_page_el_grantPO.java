package cn.osworks.aos.modules.system.dao.po;

import cn.osworks.aos.base.typewrap.PO;

/**
 * <b>页面元素授权表[aos_au_page_el_grant]数据持久化对象</b>
 * <p>
 * 注意:此类代码自动生成-禁止手工修改。
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2015-02-22 23:04:09
 */
public class Aos_au_page_el_grantPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 页面元素流水号
	 */
	private String el_id_;
	
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
	 * 权限类型
	 */
	private String grant_type_;
	

	/**
	 * 流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 页面元素流水号
	 * 
	 * @return el_id_
	 */
	public String getEl_id_() {
		return el_id_;
	}
	
	/**
	 * 用户流水号
	 * 
	 * @return user_id_
	 */
	public String getUser_id_() {
		return user_id_;
	}
	
	/**
	 * 角色流水号
	 * 
	 * @return role_id_
	 */
	public String getRole_id_() {
		return role_id_;
	}
	
	/**
	 * 岗位流水号
	 * 
	 * @return post_id_
	 */
	public String getPost_id_() {
		return post_id_;
	}
	
	/**
	 * 权限类型
	 * 
	 * @return grant_type_
	 */
	public String getGrant_type_() {
		return grant_type_;
	}
	

	/**
	 * 流水号
	 * 
	 * @param id_
	 */
	public void setId_(String id_) {
		this.id_ = id_;
	}
	
	/**
	 * 页面元素流水号
	 * 
	 * @param el_id_
	 */
	public void setEl_id_(String el_id_) {
		this.el_id_ = el_id_;
	}
	
	/**
	 * 用户流水号
	 * 
	 * @param user_id_
	 */
	public void setUser_id_(String user_id_) {
		this.user_id_ = user_id_;
	}
	
	/**
	 * 角色流水号
	 * 
	 * @param role_id_
	 */
	public void setRole_id_(String role_id_) {
		this.role_id_ = role_id_;
	}
	
	/**
	 * 岗位流水号
	 * 
	 * @param post_id_
	 */
	public void setPost_id_(String post_id_) {
		this.post_id_ = post_id_;
	}
	
	/**
	 * 权限类型
	 * 
	 * @param grant_type_
	 */
	public void setGrant_type_(String grant_type_) {
		this.grant_type_ = grant_type_;
	}
	

}
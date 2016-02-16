package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>用户-岗位关联表[aos_sys_user_post]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
public class Aos_sys_user_postPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 用户流水号
	 */
	private String user_id_;
	
	/**
	 * 岗位流水号
	 */
	private String post_id_;
	
	/**
	 * 授权时间
	 */
	private String operate_time_;
	
	/**
	 * 授权人流水号
	 */
	private String operator_id_;
	

	/**
	 * 流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
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
	 * 岗位流水号
	 * 
	 * @return post_id_
	 */
	public String getPost_id_() {
		return post_id_;
	}
	
	/**
	 * 授权时间
	 * 
	 * @return operate_time_
	 */
	public String getOperate_time_() {
		return operate_time_;
	}
	
	/**
	 * 授权人流水号
	 * 
	 * @return operator_id_
	 */
	public String getOperator_id_() {
		return operator_id_;
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
	 * 用户流水号
	 * 
	 * @param user_id_
	 */
	public void setUser_id_(String user_id_) {
		this.user_id_ = user_id_;
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
	 * 授权时间
	 * 
	 * @param operate_time_
	 */
	public void setOperate_time_(String operate_time_) {
		this.operate_time_ = operate_time_;
	}
	
	/**
	 * 授权人流水号
	 * 
	 * @param operator_id_
	 */
	public void setOperator_id_(String operator_id_) {
		this.operator_id_ = operator_id_;
	}
	

}
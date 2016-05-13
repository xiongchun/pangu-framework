package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>用户基本信息表[aos_sys_user]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2016-01-11 09:41:00
 */
public class Aos_sys_userPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 用户登录帐号
	 */
	private String account_;
	
	/**
	 * 密码
	 */
	private String password_;
	
	/**
	 * 用户姓名
	 */
	private String name_;
	
	/**
	 * 性别
	 */
	private String sex_;
	
	/**
	 * 所属主部门流水号
	 */
	private String org_id_;
	
	/**
	 * 用户状态
	 */
	private String status_;
	
	/**
	 * 用户类型
	 */
	private String type_;
	
	/**
	 * 业务对照码
	 */
	private String biz_code_;
	
	/**
	 *  经办时间
	 */
	private String create_time_;
	
	/**
	 * 经办人流水号
	 */
	private String creater_id_;
	
	/**
	 * 所属部门节点语义ID
	 */
	private String org_cascade_id_;
	
	/**
	 * 逻辑删除标识
	 */
	private String delete_flag_;
	

	/**
	 * 流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 用户登录帐号
	 * 
	 * @return account_
	 */
	public String getAccount_() {
		return account_;
	}
	
	/**
	 * 密码
	 * 
	 * @return password_
	 */
	public String getPassword_() {
		return password_;
	}
	
	/**
	 * 用户姓名
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 性别
	 * 
	 * @return sex_
	 */
	public String getSex_() {
		return sex_;
	}
	
	/**
	 * 所属主部门流水号
	 * 
	 * @return org_id_
	 */
	public String getOrg_id_() {
		return org_id_;
	}
	
	/**
	 * 用户状态
	 * 
	 * @return status_
	 */
	public String getStatus_() {
		return status_;
	}
	
	/**
	 * 用户类型
	 * 
	 * @return type_
	 */
	public String getType_() {
		return type_;
	}
	
	/**
	 * 业务对照码
	 * 
	 * @return biz_code_
	 */
	public String getBiz_code_() {
		return biz_code_;
	}
	
	/**
	 *  经办时间
	 * 
	 * @return create_time_
	 */
	public String getCreate_time_() {
		return create_time_;
	}
	
	/**
	 * 经办人流水号
	 * 
	 * @return creater_id_
	 */
	public String getCreater_id_() {
		return creater_id_;
	}
	
	/**
	 * 所属部门节点语义ID
	 * 
	 * @return org_cascade_id_
	 */
	public String getOrg_cascade_id_() {
		return org_cascade_id_;
	}
	
	/**
	 * 逻辑删除标识
	 * 
	 * @return delete_flag_
	 */
	public String getDelete_flag_() {
		return delete_flag_;
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
	 * 用户登录帐号
	 * 
	 * @param account_
	 */
	public void setAccount_(String account_) {
		this.account_ = account_;
	}
	
	/**
	 * 密码
	 * 
	 * @param password_
	 */
	public void setPassword_(String password_) {
		this.password_ = password_;
	}
	
	/**
	 * 用户姓名
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 性别
	 * 
	 * @param sex_
	 */
	public void setSex_(String sex_) {
		this.sex_ = sex_;
	}
	
	/**
	 * 所属主部门流水号
	 * 
	 * @param org_id_
	 */
	public void setOrg_id_(String org_id_) {
		this.org_id_ = org_id_;
	}
	
	/**
	 * 用户状态
	 * 
	 * @param status_
	 */
	public void setStatus_(String status_) {
		this.status_ = status_;
	}
	
	/**
	 * 用户类型
	 * 
	 * @param type_
	 */
	public void setType_(String type_) {
		this.type_ = type_;
	}
	
	/**
	 * 业务对照码
	 * 
	 * @param biz_code_
	 */
	public void setBiz_code_(String biz_code_) {
		this.biz_code_ = biz_code_;
	}
	
	/**
	 *  经办时间
	 * 
	 * @param create_time_
	 */
	public void setCreate_time_(String create_time_) {
		this.create_time_ = create_time_;
	}
	
	/**
	 * 经办人流水号
	 * 
	 * @param creater_id_
	 */
	public void setCreater_id_(String creater_id_) {
		this.creater_id_ = creater_id_;
	}
	
	/**
	 * 所属部门节点语义ID
	 * 
	 * @param org_cascade_id_
	 */
	public void setOrg_cascade_id_(String org_cascade_id_) {
		this.org_cascade_id_ = org_cascade_id_;
	}
	
	/**
	 * 逻辑删除标识
	 * 
	 * @param delete_flag_
	 */
	public void setDelete_flag_(String delete_flag_) {
		this.delete_flag_ = delete_flag_;
	}
	

}
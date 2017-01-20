package aos.system.common.model;

import java.io.Serializable;

import aos.system.dao.po.AosOrgPO;

/**
 * 
 * 用户模型（业务系统可根据自己的需求新建或调整用户模型）
 * 
 * @author xiongchun
 *
 */
public class UserModel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 用户JUID
	 */
	private String juid;
	
	/**
	 * 用户登录帐号
	 */
	private String account_;
	
	/**
	 * 用户姓名
	 */
	private String name_;
	
	/**
	 * 性别
	 */
	private String sex_;
	
	/**
	 * 用户状态
	 */
	private String status_;
	
	/**
	 * 用户类型
	 */
	private String type_;
	
	/**
	 * 所属主部门流水号
	 */
	private String org_id_;
	
	/**
	 * 业务对照码
	 */
	private String biz_code_;
	
	/**
	 * 客户端IP
	 */
	private String client_ip_;
	
	/**
	 * 客户端指纹
	 */
	private String client_key_;
	
	/**
	 * 登录时间
	 */
	private String login_time_;
	
	/**
	 * 所属组织
	 */
	private AosOrgPO aosOrgPO;

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
	 * 所属主部门流水号
	 * 
	 * @return org_id_
	 */
	public String getOrg_id_() {
		return org_id_;
	}
	
	/**
	 * 用户界面皮肤
	 */
	private String skin_;
	
	/**
	 * 业务对照码
	 * 
	 * @return biz_code_
	 */
	public String getBiz_code_() {
		return biz_code_;
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
	 * 所属主部门流水号
	 * 
	 * @param org_id_
	 */
	public void setOrg_id_(String org_id_) {
		this.org_id_ = org_id_;
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
	 * 系统皮肤
	 * 
	 * @return
	 */
	public String getSkin_() {
		return skin_;
	}

	/**
	 * 系统皮肤
	 * 
	 * @param skin_
	 */
	public void setSkin_(String skin_) {
		this.skin_ = skin_;
	}

	/**
	 * 所属组织
	 * 
	 * @return
	 */
	public AosOrgPO getAosOrgPO() {
		return aosOrgPO;
	}

	/**
	 * 所属组织
	 * 
	 * @param aosOrgPO
	 */
	public void setAosOrgPO(AosOrgPO aosOrgPO) {
		this.aosOrgPO = aosOrgPO;
	}

	/**
	 * JUID
	 * 
	 * @return
	 */
	public String getJuid() {
		return juid;
	}

	/**
	 * JUID
	 * 
	 * @param juid
	 */
	public void setJuid(String juid) {
		this.juid = juid;
	}

	/**
	 * 客户端IP
	 * 
	 * @return
	 */
	public String getClient_ip_() {
		return client_ip_;
	}

	/**
	 * 客户端IP
	 * 
	 * @param client_ip_
	 */
	public void setClient_ip_(String client_ip_) {
		this.client_ip_ = client_ip_;
	}

	/**
	 * 客户端指纹
	 * 
	 * @return
	 */
	public String getClient_key_() {
		return client_key_;
	}

	/**
	 * 客户端指纹
	 * 
	 * @param client_key_
	 */
	public void setClient_key_(String client_key_) {
		this.client_key_ = client_key_;
	}

	/**
	 * 登录时间
	 * 
	 * @return
	 */
	public String getLogin_time_() {
		return login_time_;
	}

	/**
	 * 登录时间
	 * 
	 * @param login_time_
	 */
	public void setLogin_time_(String login_time_) {
		this.login_time_ = login_time_;
	}
	
	
}

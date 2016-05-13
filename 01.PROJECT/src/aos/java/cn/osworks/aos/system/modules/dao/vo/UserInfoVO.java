package cn.osworks.aos.system.modules.dao.vo;

import cn.osworks.aos.core.typewrap.VO;
import cn.osworks.aos.system.dao.po.Aos_sys_orgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_cfgPO;
import cn.osworks.aos.system.dao.po.Aos_sys_user_extPO;

/**
 * <b>用户信息</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-13
 */
public class UserInfoVO extends VO {

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
	 * 状态
	 */
	private String status_;
	
	/**
	 * 用户类型
	 */
	private String type_;
	
	/**
	 * 用户扩展信息
	 */
	private Aos_sys_user_extPO extInfo;
	
	/**
	 * 用户配置信息
	 */
	private Aos_sys_user_cfgPO cfgInfo;
	
	/**
	 * 用户所属主部门信息
	 */
	private Aos_sys_orgPO orgInfo;

	public String getId_() {
		return id_;
	}

	public void setId_(String id_) {
		this.id_ = id_;
	}

	public String getAccount_() {
		return account_;
	}

	public void setAccount_(String account_) {
		this.account_ = account_;
	}

	public String getName_() {
		return name_;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public String getSex_() {
		return sex_;
	}

	public void setSex_(String sex_) {
		this.sex_ = sex_;
	}

	public String getOrg_id_() {
		return org_id_;
	}

	public void setOrg_id_(String org_id_) {
		this.org_id_ = org_id_;
	}

	public String getStatus_() {
		return status_;
	}

	public void setStatus_(String status_) {
		this.status_ = status_;
	}

	public String getType_() {
		return type_;
	}

	public void setType_(String type_) {
		this.type_ = type_;
	}

	public Aos_sys_user_cfgPO getCfgInfo() {
		return cfgInfo;
	}

	public void setCfgInfo(Aos_sys_user_cfgPO cfgInfo) {
		this.cfgInfo = cfgInfo;
	}

	public Aos_sys_orgPO getOrgInfo() {
		return orgInfo;
	}

	public void setOrgInfo(Aos_sys_orgPO orgInfo) {
		this.orgInfo = orgInfo;
	}

	public Aos_sys_user_extPO getExtInfo() {
		return extInfo;
	}

	public void setExtInfo(Aos_sys_user_extPO extInfo) {
		this.extInfo = extInfo;
	}

}

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
	private Integer id;
	
	/**
	 * 用户JUID
	 */
	private String juid;
	
	/**
	 * 用户登录帐号
	 */
	private String account;
	
	/**
	 * 用户姓名
	 */
	private String name;
	
	/**
	 * 性别
	 */
	private String sex;
	
	/**
	 * 用户状态
	 */
	private String status;
	
	/**
	 * 用户类型
	 */
	private String type;
	
	/**
	 * 所属主部门流水号
	 */
	private Integer org_id;
	
	/**
	 * 业务对照码
	 */
	private String biz_code;
	
	/**
	 * 客户端IP
	 */
	private String client_ip;
	
	/**
	 * 客户端指纹
	 */
	private String client_key;
	
	/**
	 * 登录时间
	 */
	private String login_time;
	
	/**
	 * 用户界面皮肤
	 */
	private String skin;
	
	/**
	 * 所属组织
	 */
	private AosOrgPO aosOrgPO;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getJuid() {
		return juid;
	}

	public void setJuid(String juid) {
		this.juid = juid;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getOrg_id() {
		return org_id;
	}

	public void setOrg_id(Integer org_id) {
		this.org_id = org_id;
	}

	public String getBiz_code() {
		return biz_code;
	}

	public void setBiz_code(String biz_code) {
		this.biz_code = biz_code;
	}

	public String getClient_ip() {
		return client_ip;
	}

	public void setClient_ip(String client_ip) {
		this.client_ip = client_ip;
	}

	public String getClient_key() {
		return client_key;
	}

	public void setClient_key(String client_key) {
		this.client_key = client_key;
	}

	public String getLogin_time() {
		return login_time;
	}

	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}

	public AosOrgPO getAosOrgPO() {
		return aosOrgPO;
	}

	public void setAosOrgPO(AosOrgPO aosOrgPO) {
		this.aosOrgPO = aosOrgPO;
	}

	public String getSkin() {
		return skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

}

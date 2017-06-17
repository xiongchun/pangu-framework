package aos.framework.dao.po;

import aos.framework.core.typewrap.PO;
import java.util.Date;

/**
 * <b>aos_user[aos_user]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-03-23 17:57:02
 */
public class AosUserPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;
	
	/**
	 * 用户登录帐号
	 */
	private String account;
	
	/**
	 * 密码
	 */
	private String password;
	
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
	 * 所属部门流水号
	 */
	private Integer org_id;
	
	/**
	 * 电子邮件
	 */
	private String email;
	
	/**
	 * 联系电话
	 */
	private String mobile;
	
	/**
	 * 身份证号
	 */
	private String idno;
	
	/**
	 * 用户界面皮肤
	 */
	private String skin;
	
	/**
	 * 业务对照码
	 */
	private String biz_code;
	
	/**
	 * 联系地址
	 */
	private String address;
	
	/**
	 * 备注
	 */
	private String remark;
	
	/**
	 * 是否已删除
	 */
	private String is_del;
	
	/**
	 * 创建时间
	 */
	private Date create_time;
	
	/**
	 * 创建人ID
	 */
	private Integer create_by;
	

	/**
	 * 流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 用户登录帐号
	 * 
	 * @return account
	 */
	public String getAccount() {
		return account;
	}
	
	/**
	 * 密码
	 * 
	 * @return password
	 */
	public String getPassword() {
		return password;
	}
	
	/**
	 * 用户姓名
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 性别
	 * 
	 * @return sex
	 */
	public String getSex() {
		return sex;
	}
	
	/**
	 * 用户状态
	 * 
	 * @return status
	 */
	public String getStatus() {
		return status;
	}
	
	/**
	 * 用户类型
	 * 
	 * @return type
	 */
	public String getType() {
		return type;
	}
	
	/**
	 * 所属部门流水号
	 * 
	 * @return org_id
	 */
	public Integer getOrg_id() {
		return org_id;
	}
	
	/**
	 * 电子邮件
	 * 
	 * @return email
	 */
	public String getEmail() {
		return email;
	}
	
	/**
	 * 联系电话
	 * 
	 * @return mobile
	 */
	public String getMobile() {
		return mobile;
	}
	
	/**
	 * 身份证号
	 * 
	 * @return idno
	 */
	public String getIdno() {
		return idno;
	}
	
	/**
	 * 用户界面皮肤
	 * 
	 * @return skin
	 */
	public String getSkin() {
		return skin;
	}
	
	/**
	 * 业务对照码
	 * 
	 * @return biz_code
	 */
	public String getBiz_code() {
		return biz_code;
	}
	
	/**
	 * 联系地址
	 * 
	 * @return address
	 */
	public String getAddress() {
		return address;
	}
	
	/**
	 * 备注
	 * 
	 * @return remark
	 */
	public String getRemark() {
		return remark;
	}
	
	/**
	 * 是否已删除
	 * 
	 * @return is_del
	 */
	public String getIs_del() {
		return is_del;
	}
	
	/**
	 * 创建时间
	 * 
	 * @return create_time
	 */
	public Date getCreate_time() {
		return create_time;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @return create_by
	 */
	public Integer getCreate_by() {
		return create_by;
	}
	

	/**
	 * 流水号
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 用户登录帐号
	 * 
	 * @param account
	 */
	public void setAccount(String account) {
		this.account = account;
	}
	
	/**
	 * 密码
	 * 
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * 用户姓名
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 性别
	 * 
	 * @param sex
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	/**
	 * 用户状态
	 * 
	 * @param status
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	
	/**
	 * 用户类型
	 * 
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * 所属部门流水号
	 * 
	 * @param org_id
	 */
	public void setOrg_id(Integer org_id) {
		this.org_id = org_id;
	}
	
	/**
	 * 电子邮件
	 * 
	 * @param email
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	
	/**
	 * 联系电话
	 * 
	 * @param mobile
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	/**
	 * 身份证号
	 * 
	 * @param idno
	 */
	public void setIdno(String idno) {
		this.idno = idno;
	}
	
	/**
	 * 用户界面皮肤
	 * 
	 * @param skin
	 */
	public void setSkin(String skin) {
		this.skin = skin;
	}
	
	/**
	 * 业务对照码
	 * 
	 * @param biz_code
	 */
	public void setBiz_code(String biz_code) {
		this.biz_code = biz_code;
	}
	
	/**
	 * 联系地址
	 * 
	 * @param address
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	
	/**
	 * 备注
	 * 
	 * @param remark
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	/**
	 * 是否已删除
	 * 
	 * @param is_del
	 */
	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}
	
	/**
	 * 创建时间
	 * 
	 * @param create_time
	 */
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @param create_by
	 */
	public void setCreate_by(Integer create_by) {
		this.create_by = create_by;
	}
	

}
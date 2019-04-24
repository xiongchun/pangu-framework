package com.gitee.myclouds.admin.domain.myuser;

import com.alibaba.fastjson.annotation.JSONField;
import com.gitee.myclouds.common.wrapper.Entity;

import java.util.Date;

/**
 * <b>后台用户基本信息表[my_user]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2018-08-04 17:44:42
 */
public class MyUserEntity extends Entity {

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
	 * 扩展码
	 */
	private String biz_code;	
	/**
	 * 扩展JSON
	 */
	private String ext;	
	/**
	 * 创建时间
	 */
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date create_time;	
	/**
	 * 创建人ID
	 */
	private Integer create_by_id;	
	/**
	 * 创建人
	 */
	private String create_by;	
	/**
	 * 备注
	 */
	private String remark;	

	/**
	 * 将参数对象中的属性复制到当前对象中
	 * 
	 * @param inObj 参数对象
	 * @return
	 */
	public MyUserEntity copyFrom(Object inObj) {
		super.copyProperties(inObj);
		return this;
	}
	
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
	 * 扩展码
	 * 
	 * @return biz_code
	 */
	public String getBiz_code() {
		return biz_code;
	}
	
	/**
	 * 扩展JSON
	 * 
	 * @return ext
	 */
	public String getExt() {
		return ext;
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
	 * @return create_by_id
	 */
	public Integer getCreate_by_id() {
		return create_by_id;
	}
	
	/**
	 * 创建人
	 * 
	 * @return create_by
	 */
	public String getCreate_by() {
		return create_by;
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
	 * 扩展码
	 * 
	 * @param biz_code
	 */
	public void setBiz_code(String biz_code) {
		this.biz_code = biz_code;
	}
	
	/**
	 * 扩展JSON
	 * 
	 * @param ext
	 */
	public void setExt(String ext) {
		this.ext = ext;
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
	 * @param create_by_id
	 */
	public void setCreate_by_id(Integer create_by_id) {
		this.create_by_id = create_by_id;
	}
	
	/**
	 * 创建人
	 * 
	 * @param create_by
	 */
	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}
	
	/**
	 * 备注
	 * 
	 * @param remark
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	

}
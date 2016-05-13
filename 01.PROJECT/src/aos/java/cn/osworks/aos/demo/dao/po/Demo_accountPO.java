package cn.osworks.aos.demo.dao.po;

import cn.osworks.aos.core.typewrap.PO;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <b>银行信用卡账户表[demo_account]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台开发插件自动生成-禁止手工修改。
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2015-07-24 19:31:13
 */
public class Demo_accountPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 姓名
	 */
	private String name_;
	
	/**
	 * 卡号
	 */
	private String card_id_;
	
	/**
	 * 卡类型
	 */
	private String card_type_;
	
	/**
	 * 可用余额
	 */
	private BigDecimal balance_;
	
	/**
	 * 信用额度
	 */
	private BigDecimal credit_line_;
	
	/**
	 * 所属银行机构ID
	 */
	private String org_id_;
	
	/**
	 * 身份证号
	 */
	private String id_no_;
	
	/**
	 * 性别
	 */
	private String sex_;
	
	/**
	 * 生日
	 */
	private Date birthday_;
	
	/**
	 * 年龄
	 */
	private Integer age_;
	
	/**
	 * 地址
	 */
	private String address_;
	
	/**
	 * 创建人ID
	 */
	private String create_user_id_;
	
	/**
	 * 创建时间
	 */
	private Date create_time_;
	

	/**
	 * 流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 姓名
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 卡号
	 * 
	 * @return card_id_
	 */
	public String getCard_id_() {
		return card_id_;
	}
	
	/**
	 * 卡类型
	 * 
	 * @return card_type_
	 */
	public String getCard_type_() {
		return card_type_;
	}
	
	/**
	 * 可用余额
	 * 
	 * @return balance_
	 */
	public BigDecimal getBalance_() {
		return balance_;
	}
	
	/**
	 * 信用额度
	 * 
	 * @return credit_line_
	 */
	public BigDecimal getCredit_line_() {
		return credit_line_;
	}
	
	/**
	 * 所属银行机构ID
	 * 
	 * @return org_id_
	 */
	public String getOrg_id_() {
		return org_id_;
	}
	
	/**
	 * 身份证号
	 * 
	 * @return id_no_
	 */
	public String getId_no_() {
		return id_no_;
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
	 * 生日
	 * 
	 * @return birthday_
	 */
	public Date getBirthday_() {
		return birthday_;
	}
	
	/**
	 * 年龄
	 * 
	 * @return age_
	 */
	public Integer getAge_() {
		return age_;
	}
	
	/**
	 * 地址
	 * 
	 * @return address_
	 */
	public String getAddress_() {
		return address_;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @return create_user_id_
	 */
	public String getCreate_user_id_() {
		return create_user_id_;
	}
	
	/**
	 * 创建时间
	 * 
	 * @return create_time_
	 */
	public Date getCreate_time_() {
		return create_time_;
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
	 * 姓名
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 卡号
	 * 
	 * @param card_id_
	 */
	public void setCard_id_(String card_id_) {
		this.card_id_ = card_id_;
	}
	
	/**
	 * 卡类型
	 * 
	 * @param card_type_
	 */
	public void setCard_type_(String card_type_) {
		this.card_type_ = card_type_;
	}
	
	/**
	 * 可用余额
	 * 
	 * @param balance_
	 */
	public void setBalance_(BigDecimal balance_) {
		this.balance_ = balance_;
	}
	
	/**
	 * 信用额度
	 * 
	 * @param credit_line_
	 */
	public void setCredit_line_(BigDecimal credit_line_) {
		this.credit_line_ = credit_line_;
	}
	
	/**
	 * 所属银行机构ID
	 * 
	 * @param org_id_
	 */
	public void setOrg_id_(String org_id_) {
		this.org_id_ = org_id_;
	}
	
	/**
	 * 身份证号
	 * 
	 * @param id_no_
	 */
	public void setId_no_(String id_no_) {
		this.id_no_ = id_no_;
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
	 * 生日
	 * 
	 * @param birthday_
	 */
	public void setBirthday_(Date birthday_) {
		this.birthday_ = birthday_;
	}
	
	/**
	 * 年龄
	 * 
	 * @param age_
	 */
	public void setAge_(Integer age_) {
		this.age_ = age_;
	}
	
	/**
	 * 地址
	 * 
	 * @param address_
	 */
	public void setAddress_(String address_) {
		this.address_ = address_;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @param create_user_id_
	 */
	public void setCreate_user_id_(String create_user_id_) {
		this.create_user_id_ = create_user_id_;
	}
	
	/**
	 * 创建时间
	 * 
	 * @param create_time_
	 */
	public void setCreate_time_(Date create_time_) {
		this.create_time_ = create_time_;
	}
	

}
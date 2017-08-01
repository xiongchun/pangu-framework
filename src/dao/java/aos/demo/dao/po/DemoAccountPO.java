package aos.demo.dao.po;

import aos.framework.core.typewrap.PO;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <b>demo_account[demo_account]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-06-04 01:32:55
 */
public class DemoAccountPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;
	
	/**
	 * 姓名
	 */
	private String name;
	
	/**
	 * 卡号
	 */
	private String card_id;
	
	/**
	 * 卡类型
	 */
	private String card_type;
	
	/**
	 * 可用余额
	 */
	private BigDecimal balance;
	
	/**
	 * 信用额度
	 */
	private BigDecimal credit_line;
	
	/**
	 * 所属银行机构ID
	 */
	private String org_id;
	
	/**
	 * 身份证号
	 */
	private String id_no;
	
	/**
	 * 性别
	 */
	private String sex;
	
	/**
	 * 生日
	 */
	private Date birthday;
	
	/**
	 * 年龄
	 */
	private Integer age;
	
	/**
	 * 地址
	 */
	private String address;
	
	/**
	 * 创建时间
	 */
	private Date create_time;
	
	/**
	 * 创建人ID
	 */
	private String create_user_id;
	

	/**
	 * 流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 姓名
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 卡号
	 * 
	 * @return card_id
	 */
	public String getCard_id() {
		return card_id;
	}
	
	/**
	 * 卡类型
	 * 
	 * @return card_type
	 */
	public String getCard_type() {
		return card_type;
	}
	
	/**
	 * 可用余额
	 * 
	 * @return balance
	 */
	public BigDecimal getBalance() {
		return balance;
	}
	
	/**
	 * 信用额度
	 * 
	 * @return credit_line
	 */
	public BigDecimal getCredit_line() {
		return credit_line;
	}
	
	/**
	 * 所属银行机构ID
	 * 
	 * @return org_id
	 */
	public String getOrg_id() {
		return org_id;
	}
	
	/**
	 * 身份证号
	 * 
	 * @return id_no
	 */
	public String getId_no() {
		return id_no;
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
	 * 生日
	 * 
	 * @return birthday
	 */
	public Date getBirthday() {
		return birthday;
	}
	
	/**
	 * 年龄
	 * 
	 * @return age
	 */
	public Integer getAge() {
		return age;
	}
	
	/**
	 * 地址
	 * 
	 * @return address
	 */
	public String getAddress() {
		return address;
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
	 * @return create_user_id
	 */
	public String getCreate_user_id() {
		return create_user_id;
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
	 * 姓名
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 卡号
	 * 
	 * @param card_id
	 */
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	
	/**
	 * 卡类型
	 * 
	 * @param card_type
	 */
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	
	/**
	 * 可用余额
	 * 
	 * @param balance
	 */
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
	
	/**
	 * 信用额度
	 * 
	 * @param credit_line
	 */
	public void setCredit_line(BigDecimal credit_line) {
		this.credit_line = credit_line;
	}
	
	/**
	 * 所属银行机构ID
	 * 
	 * @param org_id
	 */
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	
	/**
	 * 身份证号
	 * 
	 * @param id_no
	 */
	public void setId_no(String id_no) {
		this.id_no = id_no;
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
	 * 生日
	 * 
	 * @param birthday
	 */
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	/**
	 * 年龄
	 * 
	 * @param age
	 */
	public void setAge(Integer age) {
		this.age = age;
	}
	
	/**
	 * 地址
	 * 
	 * @param address
	 */
	public void setAddress(String address) {
		this.address = address;
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
	 * @param create_user_id
	 */
	public void setCreate_user_id(String create_user_id) {
		this.create_user_id = create_user_id;
	}
	

}
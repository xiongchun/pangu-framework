package cn.osworks.aos.testcase.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class PersonInfoVO {
	
	private String name;
	
	private Integer age;
	
	private BigDecimal balance;
	
	private Date birthday;
	
	private Timestamp createTime;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
	
}

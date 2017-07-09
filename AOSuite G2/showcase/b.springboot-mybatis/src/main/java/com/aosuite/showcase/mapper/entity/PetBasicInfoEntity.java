package com.aosuite.showcase.mapper.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 宠物基本信息实体
 * 
 * @author xiongchun
 *
 */
public class PetBasicInfoEntity implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String name;
	
	private Integer age;
	
	private Date birthday;
	
	private Date createTime;
	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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

	private Date create_time;
	
	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}

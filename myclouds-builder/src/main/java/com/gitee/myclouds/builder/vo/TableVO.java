package com.gitee.myclouds.builder.vo;

import com.gitee.myclouds.common.wrapper.VO;

/**
 * <b>数据表值对象</b>
 * 
 * @author xiongchun
 * @date 2013-06-06
 */
public class TableVO extends VO{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 表名
	 */
	private String name;
	
	/**
	 * 注释
	 */
	private String comment;
	
	/**
	 * 所有者
	 */
	private String owner;
	
	/**
	 * 自增列主键的名称(如果表是以自增列作为主键)
	 */
	private String autoincrementPkName;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getAutoincrementPkName() {
		return autoincrementPkName;
	}

	public void setAutoincrementPkName(String autoincrementPkName) {
		this.autoincrementPkName = autoincrementPkName;
	}

	
}

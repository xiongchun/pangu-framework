package com.gitee.pulanos.pangu.framework.generator.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * <b>数据表对象</b>
 * 
 * @author xiongchun
 * @date 2013-06-06
 */
@Data
public class Table implements Serializable {

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

	
}

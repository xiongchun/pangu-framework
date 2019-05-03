package com.gitee.myclouds.builder.vo;

import com.gitee.myclouds.common.wrapper.VO;

/**
 * <b>数据表字段值对象</b>
 * 
 * @author xiongchun
 * @date 2013-06-06
 */
public class ColumnVO extends VO{

	private static final long serialVersionUID = 1L;

	/**
	 * 字段名
	 */
	private String name;
	
	/**
	 * 字段原始DB类型
	 */
	private String type;
	
	/**
	 * 注释
	 */
	private String comment;
	
	/**
	 * 长度
	 */
	private Integer length;
	
	/**
	 * 浮点数的精度(小数点)
	 */
	private Integer scale;
	
	/**
	 * 是否可以为空
	 */
	private Boolean nullAble;
	
	/**
	 * 缺省值
	 */
	private String defaultValue;
	
	/**
	 * 是主键
	 */
	private Boolean isPkey;
	
	/**
	 * 是否为自增列(提示：自增列不一定是主键哦)
	 */
	private Boolean isAutoincrement;
	
	/**
	 * 所属表名
	 */
	private String tablename;
	
	/**
	 * @return the 字段名
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 字段顺序号
	 */
	private Integer number;

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * @param comment the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * @return the length
	 */
	public Integer getLength() {
		return length;
	}

	/**
	 * @param length the length to set
	 */
	public void setLength(Integer length) {
		this.length = length;
	}

	/**
	 * @return the scale
	 */
	public Integer getScale() {
		return scale;
	}

	/**
	 * @param scale the scale to set
	 */
	public void setScale(Integer scale) {
		this.scale = scale;
	}

	/**
	 * @return the defaultValue
	 */
	public String getDefaultValue() {
		return defaultValue;
	}

	/**
	 * @param defaultValue the defaultValue to set
	 */
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	/**
	 * @return the isPkey
	 */
	public Boolean getIsPkey() {
		return isPkey;
	}

	/**
	 * @param isPkey the isPkey to set
	 */
	public void setIsPkey(Boolean isPkey) {
		this.isPkey = isPkey;
	}

	/**
	 * @return the tablename
	 */
	public String getTablename() {
		return tablename;
	}

	/**
	 * @param tablename the tablename to set
	 */
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	/**
	 * @return the number
	 */
	public Integer getNumber() {
		return number;
	}

	/**
	 * @param number the number to set
	 */
	public void setNumber(Integer number) {
		this.number = number;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the nullAble
	 */
	public Boolean getNullAble() {
		return nullAble;
	}

	/**
	 * @param nullAble the nullAble to set
	 */
	public void setNullAble(Boolean nullAble) {
		this.nullAble = nullAble;
	}

	public Boolean getIsAutoincrement() {
		return isAutoincrement;
	}

	public void setIsAutoincrement(Boolean isAutoincrement) {
		this.isAutoincrement = isAutoincrement;
	}


	
}

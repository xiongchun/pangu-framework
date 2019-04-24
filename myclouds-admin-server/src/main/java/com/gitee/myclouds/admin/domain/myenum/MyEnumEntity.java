package com.gitee.myclouds.admin.domain.myenum;

import com.alibaba.fastjson.annotation.JSONField;
import com.gitee.myclouds.common.wrapper.Entity;

import java.util.Date;

/**
 * <b>枚举类型参数表[my_enum]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2018-03-09 18:25:06
 */
public class MyEnumEntity extends Entity {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;	
	/**
	 * 枚举类型KEY
	 */
	private String enum_key;	
	/**
	 * 枚举类型名称
	 */
	private String enum_name;	
	/**
	 * 枚举元素KEY
	 */
	private String element_key;	
	/**
	 * 枚举元素值
	 */
	private String element_value;	
	/**
	 * 是否启用
	 */
	private String is_enable;	
	/**
	 * 所属分类
	 */
	private String type;	
	/**
	 * 排序号
	 */
	private Integer sort_no;	
	/**
	 * 更新时间
	 */
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date update_time;	
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
	public MyEnumEntity copyFrom(Object inObj) {
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
	 * 枚举类型KEY
	 * 
	 * @return enum_key
	 */
	public String getEnum_key() {
		return enum_key;
	}
	
	/**
	 * 枚举类型名称
	 * 
	 * @return enum_name
	 */
	public String getEnum_name() {
		return enum_name;
	}
	
	/**
	 * 枚举元素KEY
	 * 
	 * @return element_key
	 */
	public String getElement_key() {
		return element_key;
	}
	
	/**
	 * 枚举元素值
	 * 
	 * @return element_value
	 */
	public String getElement_value() {
		return element_value;
	}
	
	/**
	 * 是否启用
	 * 
	 * @return is_enable
	 */
	public String getIs_enable() {
		return is_enable;
	}
	
	/**
	 * 所属分类
	 * 
	 * @return type
	 */
	public String getType() {
		return type;
	}
	
	/**
	 * 排序号
	 * 
	 * @return sort_no
	 */
	public Integer getSort_no() {
		return sort_no;
	}
	
	/**
	 * 更新时间
	 * 
	 * @return update_time
	 */
	public Date getUpdate_time() {
		return update_time;
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
	 * 枚举类型KEY
	 * 
	 * @param enum_key
	 */
	public void setEnum_key(String enum_key) {
		this.enum_key = enum_key;
	}
	
	/**
	 * 枚举类型名称
	 * 
	 * @param enum_name
	 */
	public void setEnum_name(String enum_name) {
		this.enum_name = enum_name;
	}
	
	/**
	 * 枚举元素KEY
	 * 
	 * @param element_key
	 */
	public void setElement_key(String element_key) {
		this.element_key = element_key;
	}
	
	/**
	 * 枚举元素值
	 * 
	 * @param element_value
	 */
	public void setElement_value(String element_value) {
		this.element_value = element_value;
	}
	
	/**
	 * 是否启用
	 * 
	 * @param is_enable
	 */
	public void setIs_enable(String is_enable) {
		this.is_enable = is_enable;
	}
	
	/**
	 * 所属分类
	 * 
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * 排序号
	 * 
	 * @param sort_no
	 */
	public void setSort_no(Integer sort_no) {
		this.sort_no = sort_no;
	}
	
	/**
	 * 更新时间
	 * 
	 * @param update_time
	 */
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
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
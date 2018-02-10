package com.gitee.myclouds.admin.domain.myparam;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.gitee.myclouds.toolbox.wrap.Entity;

/**
 * <b>键值参数表[my_param]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2018-01-31 15:08:12
 */
public class MyParamEntity extends Entity {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;
	
	/**
	 * 参数名称
	 */
	private String name;
	
	/**
	 * 参数键
	 */
	private String param_key;
	
	/**
	 * 参数值
	 */
	private String value;
	
	/**
	 * 所属系统识别码
	 */
	private String sys_key;
	
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
	 * 将参数对象中的属性复制到源对象中
	 * 
	 */
	public MyParamEntity copyFrom(Object inObj) {
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
	 * 参数名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 参数键
	 * 
	 * @return param_key
	 */
	public String getParam_key() {
		return param_key;
	}
	
	/**
	 * 参数值
	 * 
	 * @return value
	 */
	public String getValue() {
		return value;
	}
	
	/**
	 * 所属系统识别码
	 * 
	 * @return sys_key
	 */
	public String getSys_key() {
		return sys_key;
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
	 * 参数名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 参数键
	 * 
	 * @param param_key
	 */
	public void setParam_key(String param_key) {
		this.param_key = param_key;
	}
	
	/**
	 * 参数值
	 * 
	 * @param value
	 */
	public void setValue(String value) {
		this.value = value;
	}
	
	/**
	 * 所属系统识别码
	 * 
	 * @param sys_key
	 */
	public void setSys_key(String sys_key) {
		this.sys_key = sys_key;
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
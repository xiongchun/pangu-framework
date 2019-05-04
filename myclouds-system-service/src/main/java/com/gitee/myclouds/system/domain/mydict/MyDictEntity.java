package com.gitee.myclouds.system.domain.mydict;

import com.gitee.myclouds.common.wrapper.Entity;
import com.alibaba.fastjson.annotation.JSONField;
import java.util.Date;

/**
 * <b>数据字典表[my_dict]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2019-05-04 16:01:23
 */
public class MyDictEntity extends Entity {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;	
	/**
	 * 类型
	 */
	private String dict_type;	
	/**
	 * 名称
	 */
	private String dict_name;	
	/**
	 * 数据字典KEY
	 */
	private String dict_key;	
	/**
	 * 字典对照值
	 */
	private String dict_value;	
	/**
	 * 是否启用
	 */
	private String is_enable;	
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
	public MyDictEntity copyFrom(Object inObj) {
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
	 * 类型
	 * 
	 * @return dict_type
	 */
	public String getDict_type() {
		return dict_type;
	}
	
	/**
	 * 名称
	 * 
	 * @return dict_name
	 */
	public String getDict_name() {
		return dict_name;
	}
	
	/**
	 * 数据字典KEY
	 * 
	 * @return dict_key
	 */
	public String getDict_key() {
		return dict_key;
	}
	
	/**
	 * 字典对照值
	 * 
	 * @return dict_value
	 */
	public String getDict_value() {
		return dict_value;
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
	 * 类型
	 * 
	 * @param dict_type
	 */
	public void setDict_type(String dict_type) {
		this.dict_type = dict_type;
	}
	
	/**
	 * 名称
	 * 
	 * @param dict_name
	 */
	public void setDict_name(String dict_name) {
		this.dict_name = dict_name;
	}
	
	/**
	 * 数据字典KEY
	 * 
	 * @param dict_key
	 */
	public void setDict_key(String dict_key) {
		this.dict_key = dict_key;
	}
	
	/**
	 * 字典对照值
	 * 
	 * @param dict_value
	 */
	public void setDict_value(String dict_value) {
		this.dict_value = dict_value;
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
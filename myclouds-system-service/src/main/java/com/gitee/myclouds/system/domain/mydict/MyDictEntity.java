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
 * @date 2019-05-04 11:10:53
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
	private String dic_type;	
	/**
	 * 名称
	 */
	private String dic_name;	
	/**
	 * 数据字典KEY
	 */
	private String dic_key;	
	/**
	 * 字典对照值
	 */
	private String dic_value;	
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
	 * @return dic_type
	 */
	public String getDic_type() {
		return dic_type;
	}
	
	/**
	 * 名称
	 * 
	 * @return dic_name
	 */
	public String getDic_name() {
		return dic_name;
	}
	
	/**
	 * 数据字典KEY
	 * 
	 * @return dic_key
	 */
	public String getDic_key() {
		return dic_key;
	}
	
	/**
	 * 字典对照值
	 * 
	 * @return dic_value
	 */
	public String getDic_value() {
		return dic_value;
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
	 * @param dic_type
	 */
	public void setDic_type(String dic_type) {
		this.dic_type = dic_type;
	}
	
	/**
	 * 名称
	 * 
	 * @param dic_name
	 */
	public void setDic_name(String dic_name) {
		this.dic_name = dic_name;
	}
	
	/**
	 * 数据字典KEY
	 * 
	 * @param dic_key
	 */
	public void setDic_key(String dic_key) {
		this.dic_key = dic_key;
	}
	
	/**
	 * 字典对照值
	 * 
	 * @param dic_value
	 */
	public void setDic_value(String dic_value) {
		this.dic_value = dic_value;
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
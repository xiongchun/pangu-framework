package com.gitee.myclouds.admin.domain.myrole;

import com.alibaba.fastjson.annotation.JSONField;
import com.gitee.myclouds.common.wrapper.Entity;

import java.util.Date;

/**
 * <b>角色表[my_role]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2018-03-09 18:25:07
 */
public class MyRoleEntity extends Entity {

	private static final long serialVersionUID = 1L;

	/**
	 *  流水号
	 */
	private Integer id;	
	/**
	 * 角色名称
	 */
	private String name;	
	/**
	 * 是否启用
	 */
	private String is_enable;	
	/**
	 * 角色类型
	 */
	private String type;	
	/**
	 * 备注
	 */
	private String remark;	
	/**
	 * 扩展字段(JSON)
	 */
	private String ext;	
	/**
	 * 创建时间
	 */
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date create_time;	
	/**
	 * 创建人ID
	 */
	private Integer create_by_id;	
	/**
	 * 创建人
	 */
	private String create_by;	

	/**
	 * 将参数对象中的属性复制到当前对象中
	 * 
	 * @param inObj 参数对象
	 * @return
	 */
	public MyRoleEntity copyFrom(Object inObj) {
		super.copyProperties(inObj);
		return this;
	}
	
	/**
	 *  流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 角色名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
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
	 * 角色类型
	 * 
	 * @return type
	 */
	public String getType() {
		return type;
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
	 * 扩展字段(JSON)
	 * 
	 * @return ext
	 */
	public String getExt() {
		return ext;
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
	 * @return create_by_id
	 */
	public Integer getCreate_by_id() {
		return create_by_id;
	}
	
	/**
	 * 创建人
	 * 
	 * @return create_by
	 */
	public String getCreate_by() {
		return create_by;
	}
	

	/**
	 *  流水号
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 角色名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
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
	 * 角色类型
	 * 
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * 备注
	 * 
	 * @param remark
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	/**
	 * 扩展字段(JSON)
	 * 
	 * @param ext
	 */
	public void setExt(String ext) {
		this.ext = ext;
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
	 * @param create_by_id
	 */
	public void setCreate_by_id(Integer create_by_id) {
		this.create_by_id = create_by_id;
	}
	
	/**
	 * 创建人
	 * 
	 * @param create_by
	 */
	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}
	

}
package com.gitee.myclouds.admin.domain.myrolemodule;

import com.alibaba.fastjson.annotation.JSONField;
import com.gitee.myclouds.common.wrapper.Entity;

import java.util.Date;

/**
 * <b>功能模块-角色关联表[my_role_module]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2018-03-15 16:24:20
 */
public class MyRoleModuleEntity extends Entity {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;	
	/**
	 *  角色流水号
	 */
	private Integer role_id;	
	/**
	 * 功能模块流水号
	 */
	private Integer module_id;	
	/**
	 * 权限类型
	 */
	private String grant_type;	
	/**
	 * 创建时间
	 */
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date create_time;	
	/**
	 * 创建人ID
	 */
	private Integer create_by;	

	/**
	 * 将参数对象中的属性复制到当前对象中
	 * 
	 * @param inObj 参数对象
	 * @return
	 */
	public MyRoleModuleEntity copyFrom(Object inObj) {
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
	 *  角色流水号
	 * 
	 * @return role_id
	 */
	public Integer getRole_id() {
		return role_id;
	}
	
	/**
	 * 功能模块流水号
	 * 
	 * @return module_id
	 */
	public Integer getModule_id() {
		return module_id;
	}
	
	/**
	 * 权限类型
	 * 
	 * @return grant_type
	 */
	public String getGrant_type() {
		return grant_type;
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
	 * @return create_by
	 */
	public Integer getCreate_by() {
		return create_by;
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
	 *  角色流水号
	 * 
	 * @param role_id
	 */
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	
	/**
	 * 功能模块流水号
	 * 
	 * @param module_id
	 */
	public void setModule_id(Integer module_id) {
		this.module_id = module_id;
	}
	
	/**
	 * 权限类型
	 * 
	 * @param grant_type
	 */
	public void setGrant_type(String grant_type) {
		this.grant_type = grant_type;
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
	 * @param create_by
	 */
	public void setCreate_by(Integer create_by) {
		this.create_by = create_by;
	}
	

}
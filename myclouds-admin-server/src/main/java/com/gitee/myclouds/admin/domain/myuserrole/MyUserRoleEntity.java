package com.gitee.myclouds.admin.domain.myuserrole;

import com.alibaba.fastjson.annotation.JSONField;
import com.gitee.myclouds.common.wrapper.Entity;

import java.util.Date;

/**
 * <b>用户-角色关联表[my_user_role]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2018-03-09 18:25:07
 */
public class MyUserRoleEntity extends Entity {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;	
	/**
	 * 用户流水号
	 */
	private Integer user_id;	
	/**
	 * 角色流水号
	 */
	private Integer role_id;	
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
	public MyUserRoleEntity copyFrom(Object inObj) {
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
	 * 用户流水号
	 * 
	 * @return user_id
	 */
	public Integer getUser_id() {
		return user_id;
	}
	
	/**
	 * 角色流水号
	 * 
	 * @return role_id
	 */
	public Integer getRole_id() {
		return role_id;
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
	 * 流水号
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 用户流水号
	 * 
	 * @param user_id
	 */
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	
	/**
	 * 角色流水号
	 * 
	 * @param role_id
	 */
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
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
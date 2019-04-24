package com.gitee.myclouds.admin.domain.mymodule;

import com.gitee.myclouds.common.wrapper.Entity;

/**
 * <b>资源模块事件注册表[my_module]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2018-06-28 22:47:58
 */
public class MyModuleEntity extends Entity {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;	
	/**
	 * 所属上级
	 */
	private Integer parent_id;	
	/**
	 * 名称
	 */
	private String name;	
	/**
	 * URL
	 */
	private String url;	
	/**
	 * 类型
	 */
	private String type;	
	/**
	 * 图标
	 */
	private String icon;	
	/**
	 * 是否启用
	 */
	private String is_enable;	
	/**
	 * 排序号
	 */
	private Integer sort_no;	
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
	public MyModuleEntity copyFrom(Object inObj) {
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
	 * 所属上级
	 * 
	 * @return parent_id
	 */
	public Integer getParent_id() {
		return parent_id;
	}
	
	/**
	 * 名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * URL
	 * 
	 * @return url
	 */
	public String getUrl() {
		return url;
	}
	
	/**
	 * 类型
	 * 
	 * @return type
	 */
	public String getType() {
		return type;
	}
	
	/**
	 * 图标
	 * 
	 * @return icon
	 */
	public String getIcon() {
		return icon;
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
	 * 所属上级
	 * 
	 * @param parent_id
	 */
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	
	/**
	 * 名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * URL
	 * 
	 * @param url
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	
	/**
	 * 类型
	 * 
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * 图标
	 * 
	 * @param icon
	 */
	public void setIcon(String icon) {
		this.icon = icon;
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
	 * 备注
	 * 
	 * @param remark
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	

}
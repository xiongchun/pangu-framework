package com.gitee.myclouds.admin.domain.mymodule;

import com.gitee.myclouds.toolbox.wrap.Entity;

/**
 * <b>功能模块表[my_module]数据实体对象</b>
 * <p>
 * 注意:此文件由MyClouds平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author myclouds team
 * @date 2018-03-13 10:49:47
 */
public class MyModuleEntity extends Entity {

	private static final long serialVersionUID = 1L;

	/**
	 * 功能模块流水号
	 */
	private Integer id;	
	/**
	 * 父节点流水号
	 */
	private Integer parent_id;	
	/**
	 * 功能模块名称
	 */
	private String name;	
	/**
	 * 主页面URL
	 */
	private String url;	
	/**
	 * 是否为树枝节点
	 */
	private String is_folder;	
	/**
	 * 是否自动展开
	 */
	private String is_expanded;	
	/**
	 * 节点图标
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
	 * 功能模块流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 父节点流水号
	 * 
	 * @return parent_id
	 */
	public Integer getParent_id() {
		return parent_id;
	}
	
	/**
	 * 功能模块名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 主页面URL
	 * 
	 * @return url
	 */
	public String getUrl() {
		return url;
	}
	
	/**
	 * 是否为树枝节点
	 * 
	 * @return is_folder
	 */
	public String getIs_folder() {
		return is_folder;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @return is_expanded
	 */
	public String getIs_expanded() {
		return is_expanded;
	}
	
	/**
	 * 节点图标
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
	 * 功能模块流水号
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 父节点流水号
	 * 
	 * @param parent_id
	 */
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	
	/**
	 * 功能模块名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 主页面URL
	 * 
	 * @param url
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	
	/**
	 * 是否为树枝节点
	 * 
	 * @param is_folder
	 */
	public void setIs_folder(String is_folder) {
		this.is_folder = is_folder;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @param is_expanded
	 */
	public void setIs_expanded(String is_expanded) {
		this.is_expanded = is_expanded;
	}
	
	/**
	 * 节点图标
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
	

}
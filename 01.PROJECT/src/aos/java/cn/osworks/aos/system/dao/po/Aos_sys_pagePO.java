package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>模块页面表[aos_sys_page]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
public class Aos_sys_pagePO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 功能模块ID
	 */
	private String module_id_;
	
	/**
	 * 名称
	 */
	private String name_;
	
	/**
	 * 页面URL
	 */
	private String url_;
	
	/**
	 * 类型
	 */
	private String type_;
	
	/**
	 * 使能状态
	 */
	private String enabled_;
	
	/**
	 * 是否缺省子页面
	 */
	private String is_default_;
	
	/**
	 * 小图标
	 */
	private String icon_;
	
	/**
	 * 大图标
	 */
	private String icon_big_;
	
	/**
	 * 矢量图标
	 */
	private String vector_;
	
	/**
	 * 排序号
	 */
	private Integer sort_no_;
	

	/**
	 * 流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 功能模块ID
	 * 
	 * @return module_id_
	 */
	public String getModule_id_() {
		return module_id_;
	}
	
	/**
	 * 名称
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 页面URL
	 * 
	 * @return url_
	 */
	public String getUrl_() {
		return url_;
	}
	
	/**
	 * 类型
	 * 
	 * @return type_
	 */
	public String getType_() {
		return type_;
	}
	
	/**
	 * 使能状态
	 * 
	 * @return enabled_
	 */
	public String getEnabled_() {
		return enabled_;
	}
	
	/**
	 * 是否缺省子页面
	 * 
	 * @return is_default_
	 */
	public String getIs_default_() {
		return is_default_;
	}
	
	/**
	 * 小图标
	 * 
	 * @return icon_
	 */
	public String getIcon_() {
		return icon_;
	}
	
	/**
	 * 大图标
	 * 
	 * @return icon_big_
	 */
	public String getIcon_big_() {
		return icon_big_;
	}
	
	/**
	 * 矢量图标
	 * 
	 * @return vector_
	 */
	public String getVector_() {
		return vector_;
	}
	
	/**
	 * 排序号
	 * 
	 * @return sort_no_
	 */
	public Integer getSort_no_() {
		return sort_no_;
	}
	

	/**
	 * 流水号
	 * 
	 * @param id_
	 */
	public void setId_(String id_) {
		this.id_ = id_;
	}
	
	/**
	 * 功能模块ID
	 * 
	 * @param module_id_
	 */
	public void setModule_id_(String module_id_) {
		this.module_id_ = module_id_;
	}
	
	/**
	 * 名称
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 页面URL
	 * 
	 * @param url_
	 */
	public void setUrl_(String url_) {
		this.url_ = url_;
	}
	
	/**
	 * 类型
	 * 
	 * @param type_
	 */
	public void setType_(String type_) {
		this.type_ = type_;
	}
	
	/**
	 * 使能状态
	 * 
	 * @param enabled_
	 */
	public void setEnabled_(String enabled_) {
		this.enabled_ = enabled_;
	}
	
	/**
	 * 是否缺省子页面
	 * 
	 * @param is_default_
	 */
	public void setIs_default_(String is_default_) {
		this.is_default_ = is_default_;
	}
	
	/**
	 * 小图标
	 * 
	 * @param icon_
	 */
	public void setIcon_(String icon_) {
		this.icon_ = icon_;
	}
	
	/**
	 * 大图标
	 * 
	 * @param icon_big_
	 */
	public void setIcon_big_(String icon_big_) {
		this.icon_big_ = icon_big_;
	}
	
	/**
	 * 矢量图标
	 * 
	 * @param vector_
	 */
	public void setVector_(String vector_) {
		this.vector_ = vector_;
	}
	
	/**
	 * 排序号
	 * 
	 * @param sort_no_
	 */
	public void setSort_no_(Integer sort_no_) {
		this.sort_no_ = sort_no_;
	}
	

}
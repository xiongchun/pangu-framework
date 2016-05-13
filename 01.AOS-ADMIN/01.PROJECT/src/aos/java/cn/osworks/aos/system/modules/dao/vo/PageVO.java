package cn.osworks.aos.system.modules.dao.vo;

import cn.osworks.aos.core.typewrap.VO;

/**
 * 页面VO
 * 
 * @author OSWorks-XC
 * @date 2015-02-27
 */
public class PageVO extends VO {

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
	 * 排序号
	 */
	private Integer sort_no_;
	
	/**
	 * 是否缺省子页面
	 */
	private String is_default_;
	
	/**
	 * 所属功能模块名称
	 */
	private String module_name_;
	
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

	public String getId_() {
		return id_;
	}

	public void setId_(String id_) {
		this.id_ = id_;
	}

	public String getModule_id_() {
		return module_id_;
	}

	public void setModule_id_(String module_id_) {
		this.module_id_ = module_id_;
	}

	public String getName_() {
		return name_;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public String getUrl_() {
		return url_;
	}

	public void setUrl_(String url_) {
		this.url_ = url_;
	}

	public String getType_() {
		return type_;
	}

	public void setType_(String type_) {
		this.type_ = type_;
	}

	public String getEnabled_() {
		return enabled_;
	}

	public void setEnabled_(String enabled_) {
		this.enabled_ = enabled_;
	}

	public Integer getSort_no_() {
		return sort_no_;
	}

	public void setSort_no_(Integer sort_no_) {
		this.sort_no_ = sort_no_;
	}

	public String getIs_default_() {
		return is_default_;
	}

	public void setIs_default_(String is_default_) {
		this.is_default_ = is_default_;
	}

	public String getModule_name_() {
		return module_name_;
	}

	public void setModule_name_(String module_name_) {
		this.module_name_ = module_name_;
	}

	public String getIcon_() {
		return icon_;
	}

	public void setIcon_(String icon_) {
		this.icon_ = icon_;
	}

	public String getIcon_big_() {
		return icon_big_;
	}

	public void setIcon_big_(String icon_big_) {
		this.icon_big_ = icon_big_;
	}

	public String getVector_() {
		return vector_;
	}

	public void setVector_(String vector_) {
		this.vector_ = vector_;
	}
}

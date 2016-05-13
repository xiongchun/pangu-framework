package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>功能模块-用户关联表(浮动导航|快捷导航)[aos_sys_module_user_nav]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
public class Aos_sys_module_user_navPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 功能模块流水号
	 */
	private String module_id_;
	
	/**
	 * 人员流水号
	 */
	private String user_id_;
	
	/**
	 * 浮动导航图标文件
	 */
	private String nav_icon_;
	
	/**
	 * 导航类型
	 */
	private String type_;
	
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
	 * 功能模块流水号
	 * 
	 * @return module_id_
	 */
	public String getModule_id_() {
		return module_id_;
	}
	
	/**
	 * 人员流水号
	 * 
	 * @return user_id_
	 */
	public String getUser_id_() {
		return user_id_;
	}
	
	/**
	 * 浮动导航图标文件
	 * 
	 * @return nav_icon_
	 */
	public String getNav_icon_() {
		return nav_icon_;
	}
	
	/**
	 * 导航类型
	 * 
	 * @return type_
	 */
	public String getType_() {
		return type_;
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
	 * 功能模块流水号
	 * 
	 * @param module_id_
	 */
	public void setModule_id_(String module_id_) {
		this.module_id_ = module_id_;
	}
	
	/**
	 * 人员流水号
	 * 
	 * @param user_id_
	 */
	public void setUser_id_(String user_id_) {
		this.user_id_ = user_id_;
	}
	
	/**
	 * 浮动导航图标文件
	 * 
	 * @param nav_icon_
	 */
	public void setNav_icon_(String nav_icon_) {
		this.nav_icon_ = nav_icon_;
	}
	
	/**
	 * 导航类型
	 * 
	 * @param type_
	 */
	public void setType_(String type_) {
		this.type_ = type_;
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
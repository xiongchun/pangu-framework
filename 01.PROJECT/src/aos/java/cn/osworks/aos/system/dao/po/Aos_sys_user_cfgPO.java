package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>用户配置表[aos_sys_user_cfg]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2016-01-24 18:11:09
 */
public class Aos_sys_user_cfgPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 用户ID
	 */
	private String id_;
	
	/**
	 * 用户界面主题
	 */
	private String theme_;
	
	/**
	 * 用户界面皮肤
	 */
	private String skin_;
	
	/**
	 * 是否显示水平导航条
	 */
	private String is_show_top_nav_;
	
	/**
	 * 导航条按钮风格
	 */
	private String navbar_btn_style_;
	
	/**
	 * Tab高亮颜色
	 */
	private String tab_focus_color_;
	
	/**
	 * 导航缺省活动页
	 */
	private String nav_tab_index_;
	

	/**
	 * 用户ID
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 用户界面主题
	 * 
	 * @return theme_
	 */
	public String getTheme_() {
		return theme_;
	}
	
	/**
	 * 用户界面皮肤
	 * 
	 * @return skin_
	 */
	public String getSkin_() {
		return skin_;
	}
	
	/**
	 * 是否显示水平导航条
	 * 
	 * @return is_show_top_nav_
	 */
	public String getIs_show_top_nav_() {
		return is_show_top_nav_;
	}
	
	/**
	 * 导航条按钮风格
	 * 
	 * @return navbar_btn_style_
	 */
	public String getNavbar_btn_style_() {
		return navbar_btn_style_;
	}
	
	/**
	 * Tab高亮颜色
	 * 
	 * @return tab_focus_color_
	 */
	public String getTab_focus_color_() {
		return tab_focus_color_;
	}
	
	/**
	 * 导航缺省活动页
	 * 
	 * @return nav_tab_index_
	 */
	public String getNav_tab_index_() {
		return nav_tab_index_;
	}
	

	/**
	 * 用户ID
	 * 
	 * @param id_
	 */
	public void setId_(String id_) {
		this.id_ = id_;
	}
	
	/**
	 * 用户界面主题
	 * 
	 * @param theme_
	 */
	public void setTheme_(String theme_) {
		this.theme_ = theme_;
	}
	
	/**
	 * 用户界面皮肤
	 * 
	 * @param skin_
	 */
	public void setSkin_(String skin_) {
		this.skin_ = skin_;
	}
	
	/**
	 * 是否显示水平导航条
	 * 
	 * @param is_show_top_nav_
	 */
	public void setIs_show_top_nav_(String is_show_top_nav_) {
		this.is_show_top_nav_ = is_show_top_nav_;
	}
	
	/**
	 * 导航条按钮风格
	 * 
	 * @param navbar_btn_style_
	 */
	public void setNavbar_btn_style_(String navbar_btn_style_) {
		this.navbar_btn_style_ = navbar_btn_style_;
	}
	
	/**
	 * Tab高亮颜色
	 * 
	 * @param tab_focus_color_
	 */
	public void setTab_focus_color_(String tab_focus_color_) {
		this.tab_focus_color_ = tab_focus_color_;
	}
	
	/**
	 * 导航缺省活动页
	 * 
	 * @param nav_tab_index_
	 */
	public void setNav_tab_index_(String nav_tab_index_) {
		this.nav_tab_index_ = nav_tab_index_;
	}
	

}
package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>分类表[aos_sys_catalog]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:30
 */
public class Aos_sys_catalogPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 节点语义ID
	 */
	private String cascade_id_;
	
	/**
	 * 科目标识键
	 */
	private String root_key_;
	
	/**
	 * 科目名称
	 */
	private String root_name_;
	
	/**
	 * 分类名称
	 */
	private String name_;
	
	/**
	 * 热键
	 */
	private String hotkey_;
	
	/**
	 * 父节点流水号
	 */
	private String parent_id_;
	
	/**
	 * 是否叶子节点
	 */
	private String is_leaf_;
	
	/**
	 * 是否自动展开
	 */
	private String is_auto_expand_;
	
	/**
	 * 图标文件名称
	 */
	private String icon_name_;
	
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
	 * 节点语义ID
	 * 
	 * @return cascade_id_
	 */
	public String getCascade_id_() {
		return cascade_id_;
	}
	
	/**
	 * 科目标识键
	 * 
	 * @return root_key_
	 */
	public String getRoot_key_() {
		return root_key_;
	}
	
	/**
	 * 科目名称
	 * 
	 * @return root_name_
	 */
	public String getRoot_name_() {
		return root_name_;
	}
	
	/**
	 * 分类名称
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 热键
	 * 
	 * @return hotkey_
	 */
	public String getHotkey_() {
		return hotkey_;
	}
	
	/**
	 * 父节点流水号
	 * 
	 * @return parent_id_
	 */
	public String getParent_id_() {
		return parent_id_;
	}
	
	/**
	 * 是否叶子节点
	 * 
	 * @return is_leaf_
	 */
	public String getIs_leaf_() {
		return is_leaf_;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @return is_auto_expand_
	 */
	public String getIs_auto_expand_() {
		return is_auto_expand_;
	}
	
	/**
	 * 图标文件名称
	 * 
	 * @return icon_name_
	 */
	public String getIcon_name_() {
		return icon_name_;
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
	 * 节点语义ID
	 * 
	 * @param cascade_id_
	 */
	public void setCascade_id_(String cascade_id_) {
		this.cascade_id_ = cascade_id_;
	}
	
	/**
	 * 科目标识键
	 * 
	 * @param root_key_
	 */
	public void setRoot_key_(String root_key_) {
		this.root_key_ = root_key_;
	}
	
	/**
	 * 科目名称
	 * 
	 * @param root_name_
	 */
	public void setRoot_name_(String root_name_) {
		this.root_name_ = root_name_;
	}
	
	/**
	 * 分类名称
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 热键
	 * 
	 * @param hotkey_
	 */
	public void setHotkey_(String hotkey_) {
		this.hotkey_ = hotkey_;
	}
	
	/**
	 * 父节点流水号
	 * 
	 * @param parent_id_
	 */
	public void setParent_id_(String parent_id_) {
		this.parent_id_ = parent_id_;
	}
	
	/**
	 * 是否叶子节点
	 * 
	 * @param is_leaf_
	 */
	public void setIs_leaf_(String is_leaf_) {
		this.is_leaf_ = is_leaf_;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @param is_auto_expand_
	 */
	public void setIs_auto_expand_(String is_auto_expand_) {
		this.is_auto_expand_ = is_auto_expand_;
	}
	
	/**
	 * 图标文件名称
	 * 
	 * @param icon_name_
	 */
	public void setIcon_name_(String icon_name_) {
		this.icon_name_ = icon_name_;
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
package cn.osworks.aos.demo.dao.po;

import cn.osworks.aos.core.typewrap.PO;
import java.util.Date;

/**
 * <b>银行组织机构表[demo_org]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台开发插件自动生成-禁止手工修改。
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2015-07-24 19:31:13
 */
public class Demo_orgPO extends PO {

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
	 * 组织名称
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
	private Integer is_leaf_;
	
	/**
	 * 是否自动展开
	 */
	private Integer is_auto_expand_;
	
	/**
	 * 节点图标文件名称
	 */
	private String icon_name_;
	
	/**
	 * 地址
	 */
	private String address_;
	
	/**
	 * 创建人ID
	 */
	private String create_user_id_;
	
	/**
	 * 创建时间
	 */
	private Date create_time_;
	
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
	 * 组织名称
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
	public Integer getIs_leaf_() {
		return is_leaf_;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @return is_auto_expand_
	 */
	public Integer getIs_auto_expand_() {
		return is_auto_expand_;
	}
	
	/**
	 * 节点图标文件名称
	 * 
	 * @return icon_name_
	 */
	public String getIcon_name_() {
		return icon_name_;
	}
	
	/**
	 * 地址
	 * 
	 * @return address_
	 */
	public String getAddress_() {
		return address_;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @return create_user_id_
	 */
	public String getCreate_user_id_() {
		return create_user_id_;
	}
	
	/**
	 * 创建时间
	 * 
	 * @return create_time_
	 */
	public Date getCreate_time_() {
		return create_time_;
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
	 * 组织名称
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
	public void setIs_leaf_(Integer is_leaf_) {
		this.is_leaf_ = is_leaf_;
	}
	
	/**
	 * 是否自动展开
	 * 
	 * @param is_auto_expand_
	 */
	public void setIs_auto_expand_(Integer is_auto_expand_) {
		this.is_auto_expand_ = is_auto_expand_;
	}
	
	/**
	 * 节点图标文件名称
	 * 
	 * @param icon_name_
	 */
	public void setIcon_name_(String icon_name_) {
		this.icon_name_ = icon_name_;
	}
	
	/**
	 * 地址
	 * 
	 * @param address_
	 */
	public void setAddress_(String address_) {
		this.address_ = address_;
	}
	
	/**
	 * 创建人ID
	 * 
	 * @param create_user_id_
	 */
	public void setCreate_user_id_(String create_user_id_) {
		this.create_user_id_ = create_user_id_;
	}
	
	/**
	 * 创建时间
	 * 
	 * @param create_time_
	 */
	public void setCreate_time_(Date create_time_) {
		this.create_time_ = create_time_;
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
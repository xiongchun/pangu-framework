package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>数据字典索引表[aos_sys_dic_index]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
public class Aos_sys_dic_indexPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 字典标识
	 */
	private String key_;
	
	/**
	 * 字典名称
	 */
	private String name_;
	
	/**
	 * 热键
	 */
	private String hotkey_;
	
	/**
	 * 所属分类流水号
	 */
	private String catalog_id_;
	
	/**
	 * 所属分类流节点语义ID
	 */
	private String catalog_cascade_id_;
	
	/**
	 * 备注
	 */
	private String remark_;
	

	/**
	 * 流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 字典标识
	 * 
	 * @return key_
	 */
	public String getKey_() {
		return key_;
	}
	
	/**
	 * 字典名称
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
	 * 所属分类流水号
	 * 
	 * @return catalog_id_
	 */
	public String getCatalog_id_() {
		return catalog_id_;
	}
	
	/**
	 * 所属分类流节点语义ID
	 * 
	 * @return catalog_cascade_id_
	 */
	public String getCatalog_cascade_id_() {
		return catalog_cascade_id_;
	}
	
	/**
	 * 备注
	 * 
	 * @return remark_
	 */
	public String getRemark_() {
		return remark_;
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
	 * 字典标识
	 * 
	 * @param key_
	 */
	public void setKey_(String key_) {
		this.key_ = key_;
	}
	
	/**
	 * 字典名称
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
	 * 所属分类流水号
	 * 
	 * @param catalog_id_
	 */
	public void setCatalog_id_(String catalog_id_) {
		this.catalog_id_ = catalog_id_;
	}
	
	/**
	 * 所属分类流节点语义ID
	 * 
	 * @param catalog_cascade_id_
	 */
	public void setCatalog_cascade_id_(String catalog_cascade_id_) {
		this.catalog_cascade_id_ = catalog_cascade_id_;
	}
	
	/**
	 * 备注
	 * 
	 * @param remark_
	 */
	public void setRemark_(String remark_) {
		this.remark_ = remark_;
	}
	

}
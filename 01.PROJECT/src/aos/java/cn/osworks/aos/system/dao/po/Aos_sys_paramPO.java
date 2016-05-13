package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>参数表[aos_sys_param]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
public class Aos_sys_paramPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 参数键
	 */
	private String key_;
	
	/**
	 * 参数值
	 */
	private String value_;
	
	/**
	 * 所属分类流水号
	 */
	private String catalog_id_;
	
	/**
	 * 所属分类节点语义ID
	 */
	private String catalog_cascade_id_;
	
	/**
	 * 参数名称
	 */
	private String name_;
	
	/**
	 * 是否可覆盖
	 */
	private String is_overwrite_;
	
	/**
	 * 覆盖来源字段
	 */
	private String overwrite_field_;
	
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
	 * 参数键
	 * 
	 * @return key_
	 */
	public String getKey_() {
		return key_;
	}
	
	/**
	 * 参数值
	 * 
	 * @return value_
	 */
	public String getValue_() {
		return value_;
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
	 * 所属分类节点语义ID
	 * 
	 * @return catalog_cascade_id_
	 */
	public String getCatalog_cascade_id_() {
		return catalog_cascade_id_;
	}
	
	/**
	 * 参数名称
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 是否可覆盖
	 * 
	 * @return is_overwrite_
	 */
	public String getIs_overwrite_() {
		return is_overwrite_;
	}
	
	/**
	 * 覆盖来源字段
	 * 
	 * @return overwrite_field_
	 */
	public String getOverwrite_field_() {
		return overwrite_field_;
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
	 * 参数键
	 * 
	 * @param key_
	 */
	public void setKey_(String key_) {
		this.key_ = key_;
	}
	
	/**
	 * 参数值
	 * 
	 * @param value_
	 */
	public void setValue_(String value_) {
		this.value_ = value_;
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
	 * 所属分类节点语义ID
	 * 
	 * @param catalog_cascade_id_
	 */
	public void setCatalog_cascade_id_(String catalog_cascade_id_) {
		this.catalog_cascade_id_ = catalog_cascade_id_;
	}
	
	/**
	 * 参数名称
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 是否可覆盖
	 * 
	 * @param is_overwrite_
	 */
	public void setIs_overwrite_(String is_overwrite_) {
		this.is_overwrite_ = is_overwrite_;
	}
	
	/**
	 * 覆盖来源字段
	 * 
	 * @param overwrite_field_
	 */
	public void setOverwrite_field_(String overwrite_field_) {
		this.overwrite_field_ = overwrite_field_;
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
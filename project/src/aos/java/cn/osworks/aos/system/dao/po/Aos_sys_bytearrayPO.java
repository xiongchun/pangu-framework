package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>流文件表[aos_sys_bytearray]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台开发插件自动生成-禁止手工修改。
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2015-07-07 01:19:44
 */
public class Aos_sys_bytearrayPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 标识键
	 */
	private String key_;
	
	/**
	 * 名称
	 */
	private String name_;
	
	/**
	 * 分类ID
	 */
	private String catalog_id_;
	
	/**
	 * 分类级联ID
	 */
	private String catalog_cascade_id_;
	
	/**
	 * 内容类型
	 */
	private String content_type_;
	
	/**
	 * 大小
	 */
	private Integer size_;
	
	/**
	 * 流文件
	 */
	private byte[] bytes_;
	
	/**
	 * 创建时间
	 */
	private String create_time_;
	
	/**
	 * 操作人ID
	 */
	private String creater_id_;
	
	/**
	 * 标题
	 */
	private String title_;
	
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
	 * 标识键
	 * 
	 * @return key_
	 */
	public String getKey_() {
		return key_;
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
	 * 分类ID
	 * 
	 * @return catalog_id_
	 */
	public String getCatalog_id_() {
		return catalog_id_;
	}
	
	/**
	 * 分类级联ID
	 * 
	 * @return catalog_cascade_id_
	 */
	public String getCatalog_cascade_id_() {
		return catalog_cascade_id_;
	}
	
	/**
	 * 内容类型
	 * 
	 * @return content_type_
	 */
	public String getContent_type_() {
		return content_type_;
	}
	
	/**
	 * 大小
	 * 
	 * @return size_
	 */
	public Integer getSize_() {
		return size_;
	}
	
	/**
	 * 流文件
	 * 
	 * @return bytes_
	 */
	public byte[] getBytes_() {
		return bytes_;
	}
	
	/**
	 * 创建时间
	 * 
	 * @return create_time_
	 */
	public String getCreate_time_() {
		return create_time_;
	}
	
	/**
	 * 操作人ID
	 * 
	 * @return creater_id_
	 */
	public String getCreater_id_() {
		return creater_id_;
	}
	
	/**
	 * 标题
	 * 
	 * @return title_
	 */
	public String getTitle_() {
		return title_;
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
	 * 标识键
	 * 
	 * @param key_
	 */
	public void setKey_(String key_) {
		this.key_ = key_;
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
	 * 分类ID
	 * 
	 * @param catalog_id_
	 */
	public void setCatalog_id_(String catalog_id_) {
		this.catalog_id_ = catalog_id_;
	}
	
	/**
	 * 分类级联ID
	 * 
	 * @param catalog_cascade_id_
	 */
	public void setCatalog_cascade_id_(String catalog_cascade_id_) {
		this.catalog_cascade_id_ = catalog_cascade_id_;
	}
	
	/**
	 * 内容类型
	 * 
	 * @param content_type_
	 */
	public void setContent_type_(String content_type_) {
		this.content_type_ = content_type_;
	}
	
	/**
	 * 大小
	 * 
	 * @param size_
	 */
	public void setSize_(Integer size_) {
		this.size_ = size_;
	}
	
	/**
	 * 流文件
	 * 
	 * @param bytes_
	 */
	public void setBytes_(byte[] bytes_) {
		this.bytes_ = bytes_;
	}
	
	/**
	 * 创建时间
	 * 
	 * @param create_time_
	 */
	public void setCreate_time_(String create_time_) {
		this.create_time_ = create_time_;
	}
	
	/**
	 * 操作人ID
	 * 
	 * @param creater_id_
	 */
	public void setCreater_id_(String creater_id_) {
		this.creater_id_ = creater_id_;
	}
	
	/**
	 * 标题
	 * 
	 * @param title_
	 */
	public void setTitle_(String title_) {
		this.title_ = title_;
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
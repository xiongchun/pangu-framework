package aos.framework.dao;

import aos.framework.core.typewrap.PO;

/**
 * <b>aos_params[aos_params]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2016-10-21 13:52:51
 */
public class Aos_paramsPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 参数名称
	 */
	private String name_;
	
	/**
	 * 参数键
	 */
	private String key_;
	
	/**
	 * 参数值
	 */
	private String value_;
	
	/**
	 * 分组
	 */
	private String group_;
	
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
	 * 参数名称
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
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
	 * 分组
	 * 
	 * @return group_
	 */
	public String getGroup_() {
		return group_;
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
	 * 参数名称
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
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
	 * 分组
	 * 
	 * @param group_
	 */
	public void setGroup_(String group_) {
		this.group_ = group_;
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
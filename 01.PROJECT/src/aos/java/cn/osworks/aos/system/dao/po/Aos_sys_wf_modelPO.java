package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>流程模型扩展表[aos_sys_wf_model]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台开发插件自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-08-17 22:20:00
 */
public class Aos_sys_wf_modelPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 模型id
	 */
	private String model_id_;
	
	/**
	 * 模型创建方式
	 */
	private String create_type_;
	
	/**
	 * 流程名称
	 */
	private String name_;
	
	/**
	 * 创建人流水号
	 */
	private String create_user_id_;
	
	/**
	 * 创建人
	 */
	private String create_user_;
	
	/**
	 * 创建时间
	 */
	private String create_time_;
	
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
	 * 模型id
	 * 
	 * @return model_id_
	 */
	public String getModel_id_() {
		return model_id_;
	}
	
	/**
	 * 模型创建方式
	 * 
	 * @return create_type_
	 */
	public String getCreate_type_() {
		return create_type_;
	}
	
	/**
	 * 流程名称
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 创建人流水号
	 * 
	 * @return create_user_id_
	 */
	public String getCreate_user_id_() {
		return create_user_id_;
	}
	
	/**
	 * 创建人
	 * 
	 * @return create_user_
	 */
	public String getCreate_user_() {
		return create_user_;
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
	 * 模型id
	 * 
	 * @param model_id_
	 */
	public void setModel_id_(String model_id_) {
		this.model_id_ = model_id_;
	}
	
	/**
	 * 模型创建方式
	 * 
	 * @param create_type_
	 */
	public void setCreate_type_(String create_type_) {
		this.create_type_ = create_type_;
	}
	
	/**
	 * 流程名称
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 创建人流水号
	 * 
	 * @param create_user_id_
	 */
	public void setCreate_user_id_(String create_user_id_) {
		this.create_user_id_ = create_user_id_;
	}
	
	/**
	 * 创建人
	 * 
	 * @param create_user_
	 */
	public void setCreate_user_(String create_user_) {
		this.create_user_ = create_user_;
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
	 * 备注
	 * 
	 * @param remark_
	 */
	public void setRemark_(String remark_) {
		this.remark_ = remark_;
	}
	

}
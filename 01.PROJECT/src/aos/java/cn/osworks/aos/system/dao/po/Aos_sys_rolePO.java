package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>角色表[aos_sys_role]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
public class Aos_sys_rolePO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 *  流水号
	 */
	private String id_;
	
	/**
	 * 角色名称
	 */
	private String name_;
	
	/**
	 * 当前状态
	 */
	private String status_;
	
	/**
	 * 角色类型
	 */
	private String type_;
	
	/**
	 * 创建时间
	 */
	private String create_time_;
	
	/**
	 * 创建人ID
	 */
	private String creater_id_;
	
	/**
	 * 创建人所属部门流水号
	 */
	private String creater_org_id_;
	
	/**
	 * 创建人所属部门节点语义ID
	 */
	private String creater_org_cascade_id_;
	

	/**
	 *  流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 角色名称
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 当前状态
	 * 
	 * @return status_
	 */
	public String getStatus_() {
		return status_;
	}
	
	/**
	 * 角色类型
	 * 
	 * @return type_
	 */
	public String getType_() {
		return type_;
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
	 * 创建人ID
	 * 
	 * @return creater_id_
	 */
	public String getCreater_id_() {
		return creater_id_;
	}
	
	/**
	 * 创建人所属部门流水号
	 * 
	 * @return creater_org_id_
	 */
	public String getCreater_org_id_() {
		return creater_org_id_;
	}
	
	/**
	 * 创建人所属部门节点语义ID
	 * 
	 * @return creater_org_cascade_id_
	 */
	public String getCreater_org_cascade_id_() {
		return creater_org_cascade_id_;
	}
	

	/**
	 *  流水号
	 * 
	 * @param id_
	 */
	public void setId_(String id_) {
		this.id_ = id_;
	}
	
	/**
	 * 角色名称
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 当前状态
	 * 
	 * @param status_
	 */
	public void setStatus_(String status_) {
		this.status_ = status_;
	}
	
	/**
	 * 角色类型
	 * 
	 * @param type_
	 */
	public void setType_(String type_) {
		this.type_ = type_;
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
	 * 创建人ID
	 * 
	 * @param creater_id_
	 */
	public void setCreater_id_(String creater_id_) {
		this.creater_id_ = creater_id_;
	}
	
	/**
	 * 创建人所属部门流水号
	 * 
	 * @param creater_org_id_
	 */
	public void setCreater_org_id_(String creater_org_id_) {
		this.creater_org_id_ = creater_org_id_;
	}
	
	/**
	 * 创建人所属部门节点语义ID
	 * 
	 * @param creater_org_cascade_id_
	 */
	public void setCreater_org_cascade_id_(String creater_org_cascade_id_) {
		this.creater_org_cascade_id_ = creater_org_cascade_id_;
	}
	

}
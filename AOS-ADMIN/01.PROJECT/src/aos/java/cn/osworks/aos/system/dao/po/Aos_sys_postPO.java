package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>岗位表[aos_sys_post]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
public class Aos_sys_postPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 *  流水号
	 */
	private String id_;
	
	/**
	 * 岗位名称
	 */
	private String name_;
	
	/**
	 * 当前状态
	 */
	private String status_;
	
	/**
	 * 岗位类型
	 */
	private String type_;
	
	/**
	 * 所属部门流水号
	 */
	private String org_id_;
	
	/**
	 * 创建时间
	 */
	private String create_time_;
	
	/**
	 * 创建人ID
	 */
	private String creater_id_;
	
	/**
	 * 所属部门节点语义ID
	 */
	private String org_cascade_id_;
	

	/**
	 *  流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 岗位名称
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
	 * 岗位类型
	 * 
	 * @return type_
	 */
	public String getType_() {
		return type_;
	}
	
	/**
	 * 所属部门流水号
	 * 
	 * @return org_id_
	 */
	public String getOrg_id_() {
		return org_id_;
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
	 * 所属部门节点语义ID
	 * 
	 * @return org_cascade_id_
	 */
	public String getOrg_cascade_id_() {
		return org_cascade_id_;
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
	 * 岗位名称
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
	 * 岗位类型
	 * 
	 * @param type_
	 */
	public void setType_(String type_) {
		this.type_ = type_;
	}
	
	/**
	 * 所属部门流水号
	 * 
	 * @param org_id_
	 */
	public void setOrg_id_(String org_id_) {
		this.org_id_ = org_id_;
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
	 * 所属部门节点语义ID
	 * 
	 * @param org_cascade_id_
	 */
	public void setOrg_cascade_id_(String org_cascade_id_) {
		this.org_cascade_id_ = org_cascade_id_;
	}
	

}
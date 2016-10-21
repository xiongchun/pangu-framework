package aos.system.dao;

import aos.framework.core.typewrap.PO;
import java.util.Date;

/**
 * <b>aos_role_module[aos_role_module]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2016-10-10 23:40:42
 */
public class Aos_role_modulePO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 *  角色流水号
	 */
	private String role_id_;
	
	/**
	 * 功能模块流水号
	 */
	private String module_id_;
	
	/**
	 * 权限类型
	 */
	private String grant_type_;
	
	/**
	 * 创建时间
	 */
	private Date create_time_;
	
	/**
	 * 创建人ID
	 */
	private String create_by_;
	

	/**
	 * 流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 *  角色流水号
	 * 
	 * @return role_id_
	 */
	public String getRole_id_() {
		return role_id_;
	}
	
	/**
	 * 功能模块流水号
	 * 
	 * @return module_id_
	 */
	public String getModule_id_() {
		return module_id_;
	}
	
	/**
	 * 权限类型
	 * 
	 * @return grant_type_
	 */
	public String getGrant_type_() {
		return grant_type_;
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
	 * 创建人ID
	 * 
	 * @return create_by_
	 */
	public String getCreate_by_() {
		return create_by_;
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
	 *  角色流水号
	 * 
	 * @param role_id_
	 */
	public void setRole_id_(String role_id_) {
		this.role_id_ = role_id_;
	}
	
	/**
	 * 功能模块流水号
	 * 
	 * @param module_id_
	 */
	public void setModule_id_(String module_id_) {
		this.module_id_ = module_id_;
	}
	
	/**
	 * 权限类型
	 * 
	 * @param grant_type_
	 */
	public void setGrant_type_(String grant_type_) {
		this.grant_type_ = grant_type_;
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
	 * 创建人ID
	 * 
	 * @param create_by_
	 */
	public void setCreate_by_(String create_by_) {
		this.create_by_ = create_by_;
	}
	

}
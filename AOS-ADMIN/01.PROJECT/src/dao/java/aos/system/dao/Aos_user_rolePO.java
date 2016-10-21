package aos.system.dao;

import aos.framework.core.typewrap.PO;
import java.util.Date;

/**
 * <b>aos_user_role[aos_user_role]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2016-10-10 23:40:42
 */
public class Aos_user_rolePO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 用户流水号
	 */
	private String user_id_;
	
	/**
	 * 角色流水号
	 */
	private String role_id_;
	
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
	 * 用户流水号
	 * 
	 * @return user_id_
	 */
	public String getUser_id_() {
		return user_id_;
	}
	
	/**
	 * 角色流水号
	 * 
	 * @return role_id_
	 */
	public String getRole_id_() {
		return role_id_;
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
	 * 用户流水号
	 * 
	 * @param user_id_
	 */
	public void setUser_id_(String user_id_) {
		this.user_id_ = user_id_;
	}
	
	/**
	 * 角色流水号
	 * 
	 * @param role_id_
	 */
	public void setRole_id_(String role_id_) {
		this.role_id_ = role_id_;
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
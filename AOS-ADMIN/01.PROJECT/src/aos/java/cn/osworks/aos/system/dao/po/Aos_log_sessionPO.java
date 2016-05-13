package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;
import java.util.Date;

/**
 * <b>会话日志信息表[aos_log_session]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2016-02-24 23:52:40
 */
public class Aos_log_sessionPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 会话ID
	 */
	private String id_;
	
	/**
	 * 用户ID
	 */
	private String user_id_;
	
	/**
	 * 登录账户
	 */
	private String account_;
	
	/**
	 * 用户姓名
	 */
	private String user_name_;
	
	/**
	 * 客户端IP地址
	 */
	private String ip_address_;
	
	/**
	 * 客户端类型
	 */
	private String client_type_;
	
	/**
	 * 宿主
	 */
	private String owner_;
	
	/**
	 * 登录时间
	 */
	private Date create_time_;
	

	/**
	 * 会话ID
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 用户ID
	 * 
	 * @return user_id_
	 */
	public String getUser_id_() {
		return user_id_;
	}
	
	/**
	 * 登录账户
	 * 
	 * @return account_
	 */
	public String getAccount_() {
		return account_;
	}
	
	/**
	 * 用户姓名
	 * 
	 * @return user_name_
	 */
	public String getUser_name_() {
		return user_name_;
	}
	
	/**
	 * 客户端IP地址
	 * 
	 * @return ip_address_
	 */
	public String getIp_address_() {
		return ip_address_;
	}
	
	/**
	 * 客户端类型
	 * 
	 * @return client_type_
	 */
	public String getClient_type_() {
		return client_type_;
	}
	
	/**
	 * 宿主
	 * 
	 * @return owner_
	 */
	public String getOwner_() {
		return owner_;
	}
	
	/**
	 * 登录时间
	 * 
	 * @return create_time_
	 */
	public Date getCreate_time_() {
		return create_time_;
	}
	

	/**
	 * 会话ID
	 * 
	 * @param id_
	 */
	public void setId_(String id_) {
		this.id_ = id_;
	}
	
	/**
	 * 用户ID
	 * 
	 * @param user_id_
	 */
	public void setUser_id_(String user_id_) {
		this.user_id_ = user_id_;
	}
	
	/**
	 * 登录账户
	 * 
	 * @param account_
	 */
	public void setAccount_(String account_) {
		this.account_ = account_;
	}
	
	/**
	 * 用户姓名
	 * 
	 * @param user_name_
	 */
	public void setUser_name_(String user_name_) {
		this.user_name_ = user_name_;
	}
	
	/**
	 * 客户端IP地址
	 * 
	 * @param ip_address_
	 */
	public void setIp_address_(String ip_address_) {
		this.ip_address_ = ip_address_;
	}
	
	/**
	 * 客户端类型
	 * 
	 * @param client_type_
	 */
	public void setClient_type_(String client_type_) {
		this.client_type_ = client_type_;
	}
	
	/**
	 * 宿主
	 * 
	 * @param owner_
	 */
	public void setOwner_(String owner_) {
		this.owner_ = owner_;
	}
	
	/**
	 * 登录时间
	 * 
	 * @param create_time_
	 */
	public void setCreate_time_(Date create_time_) {
		this.create_time_ = create_time_;
	}
	

}
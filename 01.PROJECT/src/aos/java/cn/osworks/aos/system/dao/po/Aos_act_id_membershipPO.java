package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>aos_act_id_membership[aos_act_id_membership]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台开发插件自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-08-17 22:19:59
 */
public class Aos_act_id_membershipPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * user_id_
	 */
	private String user_id_;
	
	/**
	 * group_id_
	 */
	private String group_id_;
	

	/**
	 * user_id_
	 * 
	 * @return user_id_
	 */
	public String getUser_id_() {
		return user_id_;
	}
	
	/**
	 * group_id_
	 * 
	 * @return group_id_
	 */
	public String getGroup_id_() {
		return group_id_;
	}
	

	/**
	 * user_id_
	 * 
	 * @param user_id_
	 */
	public void setUser_id_(String user_id_) {
		this.user_id_ = user_id_;
	}
	
	/**
	 * group_id_
	 * 
	 * @param group_id_
	 */
	public void setGroup_id_(String group_id_) {
		this.group_id_ = group_id_;
	}
	

}
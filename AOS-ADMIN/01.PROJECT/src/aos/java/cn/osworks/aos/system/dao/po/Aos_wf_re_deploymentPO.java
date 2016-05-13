package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;
import java.util.Date;

/**
 * <b>aos_wf_re_deployment[aos_wf_re_deployment]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:32
 */
public class Aos_wf_re_deploymentPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * id_
	 */
	private String id_;
	
	/**
	 * name_
	 */
	private String name_;
	
	/**
	 * category_
	 */
	private String category_;
	
	/**
	 * tenant_id_
	 */
	private String tenant_id_;
	
	/**
	 * deploy_time_
	 */
	private Date deploy_time_;
	

	/**
	 * id_
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * name_
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * category_
	 * 
	 * @return category_
	 */
	public String getCategory_() {
		return category_;
	}
	
	/**
	 * tenant_id_
	 * 
	 * @return tenant_id_
	 */
	public String getTenant_id_() {
		return tenant_id_;
	}
	
	/**
	 * deploy_time_
	 * 
	 * @return deploy_time_
	 */
	public Date getDeploy_time_() {
		return deploy_time_;
	}
	

	/**
	 * id_
	 * 
	 * @param id_
	 */
	public void setId_(String id_) {
		this.id_ = id_;
	}
	
	/**
	 * name_
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * category_
	 * 
	 * @param category_
	 */
	public void setCategory_(String category_) {
		this.category_ = category_;
	}
	
	/**
	 * tenant_id_
	 * 
	 * @param tenant_id_
	 */
	public void setTenant_id_(String tenant_id_) {
		this.tenant_id_ = tenant_id_;
	}
	
	/**
	 * deploy_time_
	 * 
	 * @param deploy_time_
	 */
	public void setDeploy_time_(Date deploy_time_) {
		this.deploy_time_ = deploy_time_;
	}
	

}
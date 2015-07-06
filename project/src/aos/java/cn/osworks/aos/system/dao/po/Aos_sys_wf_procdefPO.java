package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>流程定义扩展表[aos_sys_wf_procdef]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台开发插件自动生成-禁止手工修改。
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2015-07-05 16:03:21
 */
public class Aos_sys_wf_procdefPO extends PO {

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
	 * 流程定义id
	 */
	private String proc_def_id_;
	
	/**
	 *  部署人流水号
	 */
	private String deploy_user_id_;
	
	/**
	 * 部署人
	 */
	private String deploy_user_;
	
	/**
	 * 部署时间
	 */
	private String deploy_time_;
	

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
	 * 流程定义id
	 * 
	 * @return proc_def_id_
	 */
	public String getProc_def_id_() {
		return proc_def_id_;
	}
	
	/**
	 *  部署人流水号
	 * 
	 * @return deploy_user_id_
	 */
	public String getDeploy_user_id_() {
		return deploy_user_id_;
	}
	
	/**
	 * 部署人
	 * 
	 * @return deploy_user_
	 */
	public String getDeploy_user_() {
		return deploy_user_;
	}
	
	/**
	 * 部署时间
	 * 
	 * @return deploy_time_
	 */
	public String getDeploy_time_() {
		return deploy_time_;
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
	 * 流程定义id
	 * 
	 * @param proc_def_id_
	 */
	public void setProc_def_id_(String proc_def_id_) {
		this.proc_def_id_ = proc_def_id_;
	}
	
	/**
	 *  部署人流水号
	 * 
	 * @param deploy_user_id_
	 */
	public void setDeploy_user_id_(String deploy_user_id_) {
		this.deploy_user_id_ = deploy_user_id_;
	}
	
	/**
	 * 部署人
	 * 
	 * @param deploy_user_
	 */
	public void setDeploy_user_(String deploy_user_) {
		this.deploy_user_ = deploy_user_;
	}
	
	/**
	 * 部署时间
	 * 
	 * @param deploy_time_
	 */
	public void setDeploy_time_(String deploy_time_) {
		this.deploy_time_ = deploy_time_;
	}
	

}
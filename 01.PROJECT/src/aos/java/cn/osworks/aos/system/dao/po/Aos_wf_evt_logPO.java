package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;
import java.util.Date;

/**
 * <b>aos_wf_evt_log[aos_wf_evt_log]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
public class Aos_wf_evt_logPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * log_nr_
	 */
	private Integer log_nr_;
	
	/**
	 * type_
	 */
	private String type_;
	
	/**
	 * proc_def_id_
	 */
	private String proc_def_id_;
	
	/**
	 * proc_inst_id_
	 */
	private String proc_inst_id_;
	
	/**
	 * execution_id_
	 */
	private String execution_id_;
	
	/**
	 * task_id_
	 */
	private String task_id_;
	
	/**
	 * time_stamp_
	 */
	private Date time_stamp_;
	
	/**
	 * user_id_
	 */
	private String user_id_;
	
	/**
	 * data_
	 */
	private byte[] data_;
	
	/**
	 * lock_owner_
	 */
	private String lock_owner_;
	
	/**
	 * lock_time_
	 */
	private Date lock_time_;
	
	/**
	 * is_processed_
	 */
	private Integer is_processed_;
	

	/**
	 * log_nr_
	 * 
	 * @return log_nr_
	 */
	public Integer getLog_nr_() {
		return log_nr_;
	}
	
	/**
	 * type_
	 * 
	 * @return type_
	 */
	public String getType_() {
		return type_;
	}
	
	/**
	 * proc_def_id_
	 * 
	 * @return proc_def_id_
	 */
	public String getProc_def_id_() {
		return proc_def_id_;
	}
	
	/**
	 * proc_inst_id_
	 * 
	 * @return proc_inst_id_
	 */
	public String getProc_inst_id_() {
		return proc_inst_id_;
	}
	
	/**
	 * execution_id_
	 * 
	 * @return execution_id_
	 */
	public String getExecution_id_() {
		return execution_id_;
	}
	
	/**
	 * task_id_
	 * 
	 * @return task_id_
	 */
	public String getTask_id_() {
		return task_id_;
	}
	
	/**
	 * time_stamp_
	 * 
	 * @return time_stamp_
	 */
	public Date getTime_stamp_() {
		return time_stamp_;
	}
	
	/**
	 * user_id_
	 * 
	 * @return user_id_
	 */
	public String getUser_id_() {
		return user_id_;
	}
	
	/**
	 * data_
	 * 
	 * @return data_
	 */
	public byte[] getData_() {
		return data_;
	}
	
	/**
	 * lock_owner_
	 * 
	 * @return lock_owner_
	 */
	public String getLock_owner_() {
		return lock_owner_;
	}
	
	/**
	 * lock_time_
	 * 
	 * @return lock_time_
	 */
	public Date getLock_time_() {
		return lock_time_;
	}
	
	/**
	 * is_processed_
	 * 
	 * @return is_processed_
	 */
	public Integer getIs_processed_() {
		return is_processed_;
	}
	

	/**
	 * log_nr_
	 * 
	 * @param log_nr_
	 */
	public void setLog_nr_(Integer log_nr_) {
		this.log_nr_ = log_nr_;
	}
	
	/**
	 * type_
	 * 
	 * @param type_
	 */
	public void setType_(String type_) {
		this.type_ = type_;
	}
	
	/**
	 * proc_def_id_
	 * 
	 * @param proc_def_id_
	 */
	public void setProc_def_id_(String proc_def_id_) {
		this.proc_def_id_ = proc_def_id_;
	}
	
	/**
	 * proc_inst_id_
	 * 
	 * @param proc_inst_id_
	 */
	public void setProc_inst_id_(String proc_inst_id_) {
		this.proc_inst_id_ = proc_inst_id_;
	}
	
	/**
	 * execution_id_
	 * 
	 * @param execution_id_
	 */
	public void setExecution_id_(String execution_id_) {
		this.execution_id_ = execution_id_;
	}
	
	/**
	 * task_id_
	 * 
	 * @param task_id_
	 */
	public void setTask_id_(String task_id_) {
		this.task_id_ = task_id_;
	}
	
	/**
	 * time_stamp_
	 * 
	 * @param time_stamp_
	 */
	public void setTime_stamp_(Date time_stamp_) {
		this.time_stamp_ = time_stamp_;
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
	 * data_
	 * 
	 * @param data_
	 */
	public void setData_(byte[] data_) {
		this.data_ = data_;
	}
	
	/**
	 * lock_owner_
	 * 
	 * @param lock_owner_
	 */
	public void setLock_owner_(String lock_owner_) {
		this.lock_owner_ = lock_owner_;
	}
	
	/**
	 * lock_time_
	 * 
	 * @param lock_time_
	 */
	public void setLock_time_(Date lock_time_) {
		this.lock_time_ = lock_time_;
	}
	
	/**
	 * is_processed_
	 * 
	 * @param is_processed_
	 */
	public void setIs_processed_(Integer is_processed_) {
		this.is_processed_ = is_processed_;
	}
	

}
package cn.osworks.aos.system.dao.po;

import cn.osworks.aos.core.typewrap.PO;

/**
 * <b>aos_wf_ge_bytearray[aos_wf_ge_bytearray]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author AHei
 * @date 2015-12-22 22:10:31
 */
public class Aos_wf_ge_bytearrayPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * id_
	 */
	private String id_;
	
	/**
	 * rev_
	 */
	private Integer rev_;
	
	/**
	 * name_
	 */
	private String name_;
	
	/**
	 * deployment_id_
	 */
	private String deployment_id_;
	
	/**
	 * bytes_
	 */
	private byte[] bytes_;
	
	/**
	 * generated_
	 */
	private Integer generated_;
	

	/**
	 * id_
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * rev_
	 * 
	 * @return rev_
	 */
	public Integer getRev_() {
		return rev_;
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
	 * deployment_id_
	 * 
	 * @return deployment_id_
	 */
	public String getDeployment_id_() {
		return deployment_id_;
	}
	
	/**
	 * bytes_
	 * 
	 * @return bytes_
	 */
	public byte[] getBytes_() {
		return bytes_;
	}
	
	/**
	 * generated_
	 * 
	 * @return generated_
	 */
	public Integer getGenerated_() {
		return generated_;
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
	 * rev_
	 * 
	 * @param rev_
	 */
	public void setRev_(Integer rev_) {
		this.rev_ = rev_;
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
	 * deployment_id_
	 * 
	 * @param deployment_id_
	 */
	public void setDeployment_id_(String deployment_id_) {
		this.deployment_id_ = deployment_id_;
	}
	
	/**
	 * bytes_
	 * 
	 * @param bytes_
	 */
	public void setBytes_(byte[] bytes_) {
		this.bytes_ = bytes_;
	}
	
	/**
	 * generated_
	 * 
	 * @param generated_
	 */
	public void setGenerated_(Integer generated_) {
		this.generated_ = generated_;
	}
	

}
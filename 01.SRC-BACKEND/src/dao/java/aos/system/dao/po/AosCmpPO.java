package aos.system.dao.po;

import aos.framework.core.typewrap.PO;

/**
 * <b>aos_cmp[aos_cmp]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-01-18 22:42:01
 */
public class AosCmpPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private String id_;
	
	/**
	 * 组件名称
	 */
	private String name_;
	
	/**
	 * 界面组件ID
	 */
	private String dom_id_;
	
	/**
	 * 所属页面标识
	 */
	private String page_key_;
	
	/**
	 * 所属页面名称
	 */
	private String page_name_;
	

	/**
	 * 流水号
	 * 
	 * @return id_
	 */
	public String getId_() {
		return id_;
	}
	
	/**
	 * 组件名称
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 界面组件ID
	 * 
	 * @return dom_id_
	 */
	public String getDom_id_() {
		return dom_id_;
	}
	
	/**
	 * 所属页面标识
	 * 
	 * @return page_key_
	 */
	public String getPage_key_() {
		return page_key_;
	}
	
	/**
	 * 所属页面名称
	 * 
	 * @return page_name_
	 */
	public String getPage_name_() {
		return page_name_;
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
	 * 组件名称
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 界面组件ID
	 * 
	 * @param dom_id_
	 */
	public void setDom_id_(String dom_id_) {
		this.dom_id_ = dom_id_;
	}
	
	/**
	 * 所属页面标识
	 * 
	 * @param page_key_
	 */
	public void setPage_key_(String page_key_) {
		this.page_key_ = page_key_;
	}
	
	/**
	 * 所属页面名称
	 * 
	 * @param page_name_
	 */
	public void setPage_name_(String page_name_) {
		this.page_name_ = page_name_;
	}
	

}
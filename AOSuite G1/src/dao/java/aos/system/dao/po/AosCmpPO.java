package aos.system.dao.po;

import aos.framework.core.typewrap.PO;

/**
 * <b>aos_cmp[aos_cmp]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-03-23 17:54:24
 */
public class AosCmpPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;
	
	/**
	 * 组件名称
	 */
	private String name;
	
	/**
	 * 界面组件ID
	 */
	private String dom_id;
	
	/**
	 * 所属页面标识
	 */
	private String page_key;
	
	/**
	 * 所属页面名称
	 */
	private String page_name;
	

	/**
	 * 流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 组件名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 界面组件ID
	 * 
	 * @return dom_id
	 */
	public String getDom_id() {
		return dom_id;
	}
	
	/**
	 * 所属页面标识
	 * 
	 * @return page_key
	 */
	public String getPage_key() {
		return page_key;
	}
	
	/**
	 * 所属页面名称
	 * 
	 * @return page_name
	 */
	public String getPage_name() {
		return page_name;
	}
	

	/**
	 * 流水号
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 组件名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 界面组件ID
	 * 
	 * @param dom_id
	 */
	public void setDom_id(String dom_id) {
		this.dom_id = dom_id;
	}
	
	/**
	 * 所属页面标识
	 * 
	 * @param page_key
	 */
	public void setPage_key(String page_key) {
		this.page_key = page_key;
	}
	
	/**
	 * 所属页面名称
	 * 
	 * @param page_name
	 */
	public void setPage_name(String page_name) {
		this.page_name = page_name;
	}
	

}
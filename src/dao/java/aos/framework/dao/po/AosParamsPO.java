package aos.framework.dao.po;

import aos.framework.core.typewrap.PO;

/**
 * <b>aos_params[aos_params]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-03-24 10:46:24
 */
public class AosParamsPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;
	
	/**
	 * 参数名称
	 */
	private String name;
	
	/**
	 * 参数键
	 */
	private String params_key;
	
	/**
	 * 参数值
	 */
	private String value;
	
	/**
	 * 参数分组
	 */
	private String params_group;
	
	/**
	 * 备注
	 */
	private String remark;
	

	/**
	 * 流水号
	 * 
	 * @return id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * 参数名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 参数键
	 * 
	 * @return params_key
	 */
	public String getParams_key() {
		return params_key;
	}
	
	/**
	 * 参数值
	 * 
	 * @return value
	 */
	public String getValue() {
		return value;
	}
	
	/**
	 * 参数分组
	 * 
	 * @return params_group
	 */
	public String getParams_group() {
		return params_group;
	}
	
	/**
	 * 备注
	 * 
	 * @return remark
	 */
	public String getRemark() {
		return remark;
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
	 * 参数名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 参数键
	 * 
	 * @param params_key
	 */
	public void setParams_key(String params_key) {
		this.params_key = params_key;
	}
	
	/**
	 * 参数值
	 * 
	 * @param value
	 */
	public void setValue(String value) {
		this.value = value;
	}
	
	/**
	 * 参数分组
	 * 
	 * @param params_group
	 */
	public void setParams_group(String params_group) {
		this.params_group = params_group;
	}
	
	/**
	 * 备注
	 * 
	 * @param remark
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	

}
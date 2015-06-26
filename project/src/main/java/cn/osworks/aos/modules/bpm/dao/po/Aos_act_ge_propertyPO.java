package cn.osworks.aos.modules.bpm.dao.po;

import cn.osworks.aos.base.typewrap.PO;

/**
 * <b>[aos_act_ge_property]数据持久化对象</b>
 * <p>
 * 注意:此类代码自动生成-禁止手工修改。
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2015-01-07 23:01:58
 */
public class Aos_act_ge_propertyPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * name_
	 */
	private String name_;
	
	/**
	 * value_
	 */
	private String value_;
	
	/**
	 * rev_
	 */
	private Integer rev_;
	

	/**
	 * name_
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * value_
	 * 
	 * @return value_
	 */
	public String getValue_() {
		return value_;
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
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * value_
	 * 
	 * @param value_
	 */
	public void setValue_(String value_) {
		this.value_ = value_;
	}
	
	/**
	 * rev_
	 * 
	 * @param rev_
	 */
	public void setRev_(Integer rev_) {
		this.rev_ = rev_;
	}
	

}
package aos.system.dao.po;

import aos.framework.core.typewrap.PO;
import java.math.BigInteger;

/**
 * <b>aos_sequence[aos_sequence]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-01-18 22:42:02
 */
public class AosSequencePO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 序列号名称
	 */
	private String name_;
	
	/**
	 * 当前值
	 */
	private BigInteger current_value_;
	
	/**
	 * 增长步长
	 */
	private Integer increment_;
	

	/**
	 * 序列号名称
	 * 
	 * @return name_
	 */
	public String getName_() {
		return name_;
	}
	
	/**
	 * 当前值
	 * 
	 * @return current_value_
	 */
	public BigInteger getCurrent_value_() {
		return current_value_;
	}
	
	/**
	 * 增长步长
	 * 
	 * @return increment_
	 */
	public Integer getIncrement_() {
		return increment_;
	}
	

	/**
	 * 序列号名称
	 * 
	 * @param name_
	 */
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	/**
	 * 当前值
	 * 
	 * @param current_value_
	 */
	public void setCurrent_value_(BigInteger current_value_) {
		this.current_value_ = current_value_;
	}
	
	/**
	 * 增长步长
	 * 
	 * @param increment_
	 */
	public void setIncrement_(Integer increment_) {
		this.increment_ = increment_;
	}
	

}
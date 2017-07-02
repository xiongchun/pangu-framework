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
 * @date 2017-03-23 17:54:25
 */
public class AosSequencePO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 序列号名称
	 */
	private String name;
	
	/**
	 * 当前值
	 */
	private BigInteger current_value;
	
	/**
	 * 增长步长
	 */
	private Integer increment;
	

	/**
	 * 序列号名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 当前值
	 * 
	 * @return current_value
	 */
	public BigInteger getCurrent_value() {
		return current_value;
	}
	
	/**
	 * 增长步长
	 * 
	 * @return increment
	 */
	public Integer getIncrement() {
		return increment;
	}
	

	/**
	 * 序列号名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 当前值
	 * 
	 * @param current_value
	 */
	public void setCurrent_value(BigInteger current_value) {
		this.current_value = current_value;
	}
	
	/**
	 * 增长步长
	 * 
	 * @param increment
	 */
	public void setIncrement(Integer increment) {
		this.increment = increment;
	}
	

}
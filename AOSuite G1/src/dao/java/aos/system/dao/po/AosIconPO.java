package aos.system.dao.po;

import aos.framework.core.typewrap.PO;

/**
 * <b>aos_icon[aos_icon]数据持久化对象</b>
 * <p>
 * 注意:此文件由AOS平台自动生成-禁止手工修改。
 * </p>
 * 
 * @author xiongchun
 * @date 2017-03-23 17:54:25
 */
public class AosIconPO extends PO {

	private static final long serialVersionUID = 1L;

	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 类型
	 */
	private String type;
	

	/**
	 * 名称
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 类型
	 * 
	 * @return type
	 */
	public String getType() {
		return type;
	}
	

	/**
	 * 名称
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 类型
	 * 
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}
	

}
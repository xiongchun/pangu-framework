package cn.osworks.aos.web.tag.core.model.vo;

import cn.osworks.aos.core.typewrap.VO;

/**
 * <b>配置项的值对象</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-04-06
 */
public class ConfigVO extends VO{
	
	private static final long serialVersionUID = 1L;

	private String key;
	
	private String value;
	
	/**
	 * 构造函数
	 * 
	 * 字符串特殊处理,其它原样输出
	 * 
	 * @param pKey
	 * @param pValue
	 */
	public ConfigVO(String pKey, String pValue, boolean isString) {
		setKey(pKey);
		if (isString) {
			setValue("'" + pValue + "'");
		}else {
			setValue(pValue);
		}
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}

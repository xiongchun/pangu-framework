package cn.osworks.aos.modules.cache;

import cn.osworks.aos.core.typewrap.VO;

/**
 * 参数值对象
 * 
 * @author xiongchun
 *
 */
public class ParamVO extends VO{

	private static final long serialVersionUID = 1L;
	
	//参数键
	private String key_;
	
	//参数值
	private String value_;

	public String getKey_() {
		return key_;
	}

	public void setKey_(String key_) {
		this.key_ = key_;
	}

	public String getValue_() {
		return value_;
	}

	public void setValue_(String value_) {
		this.value_ = value_;
	}
	
	
}

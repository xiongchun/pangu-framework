package cn.osworks.aos.modules.cache;

import cn.osworks.aos.core.typewrap.VO;

/**
 * 字典值对象
 * 
 * @author xiongchun
 * 
 */
public class DicVO extends VO{

	private static final long serialVersionUID = 1L;
	
	//字典KEY
	private String key_;
	
	//字典名称
	private String name_;
	
	//字典代码
	private String code_;
	
	//字典描述值
	private String desc_;

	public String getKey_() {
		return key_;
	}

	public void setKey_(String key_) {
		this.key_ = key_;
	}

	public String getName_() {
		return name_;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public String getCode_() {
		return code_;
	}

	public void setCode_(String code_) {
		this.code_ = code_;
	}

	public String getDesc_() {
		return desc_;
	}

	public void setDesc_(String desc_) {
		this.desc_ = desc_;
	}

}

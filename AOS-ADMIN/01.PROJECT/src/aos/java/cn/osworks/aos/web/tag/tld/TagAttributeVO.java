package cn.osworks.aos.web.tag.tld;

import cn.osworks.aos.core.typewrap.VO;

/**
 * <b>标签属性VO对象</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class TagAttributeVO extends VO{

	private static final long serialVersionUID = 1L;
	
	private String name;
	
	private String required;
	
	private String description;
	
	/**
	 * 是否复写父标签属性
	 */
	private String rewrite;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRequired() {
		return required;
	}

	public void setRequired(String required) {
		this.required = required;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRewrite() {
		return rewrite;
	}

	public void setRewrite(String rewrite) {
		this.rewrite = rewrite;
	}
	
}

package org.g4studio.core.tplengine;

/**
 * 模板引擎类型
 * @author XiongChun
 * @since 2009-07-26
 */
public class TemplateType {
	
	/**
	 * 引擎类型
	 */
	private String type;
	
	/**
	 * 引擎描述
	 */
	private String description;
	
	/**
	 * Velocity引擎定义
	 */
	public static final TemplateType VELOCITY = new TemplateType("Velocity", "Velocity engine");

	/**
	 * 构造函数
	 * @param pType 引擎类型
	 * @param pDescription 引擎描述
	 */
	public TemplateType(String pType, String pDescription) {
		this.type = pType;
		this.description = pDescription;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}

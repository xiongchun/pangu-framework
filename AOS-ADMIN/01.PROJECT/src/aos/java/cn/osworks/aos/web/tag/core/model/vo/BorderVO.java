package cn.osworks.aos.web.tag.core.model.vo;

import cn.osworks.aos.core.typewrap.VO;

/**
 * <b>边框设置的值对象</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-04-06
 */
public class BorderVO extends VO{
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	/**
	 * 边框大小,数值
	 */
	private String size;
	
	/**
	 * 边框位置
	 */
	private String align;
	
	/**
	 * 边框依赖主体元素
	 */
	private String element;
	
	/**
	 * 边框颜色
	 */
	private String color;

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public String getElement() {
		return element;
	}

	public void setElement(String element) {
		this.element = element;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

}

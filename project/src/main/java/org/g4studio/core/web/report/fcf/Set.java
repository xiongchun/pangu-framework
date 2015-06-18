package org.g4studio.core.web.report.fcf;

import java.util.HashMap;

/**
 * FlashReport数据元对象
 * 
 * @author XiongChun
 * @since 2010-07-04
 */
public class Set extends HashMap {
	/**
	 * 设置名称属性
	 * @param pName
	 */
	public void setName(String pName) {
		this.put("name", pName);
	}
	
	/**
	 * 设置值属性
	 * @param pName
	 */
	public void setValue(String pValue) {
		this.put("value", pValue);
	}
	
	/**
	 * 设置颜色属性
	 * @param pName
	 */
	public void setColor(String pColor) {
		this.put("color", pColor);
	}
	
	/**
	 * 设置浮动属性<br>
	 * <b>只针对2D饼图有效
	 * @param pName
	 */
	public void setIsSliced(String pIsSliced) {
		this.put("isSliced", pIsSliced);
	}
	
	/**
	 * 设置鼠标悬停时候追加的文本
	 * @param pName
	 */
	public void setHoverText(String pHoverText) {
		this.put("hoverText", pHoverText);
	}
	
	/**
	 * 设置透明度
	 * 只对漏斗图有效
	 * @param pAlpha
	 */
	public void setAlpha(String pAlpha) {
		this.put("alpha", pAlpha);
	}
	
	/**
	 * 设置和图形交互的JS函数
	 * 函数中的入参必须使用双引号不能使用单引号
	 * @param pFunction
	 */
	public void setJsFunction(String pFunction) {
		this.put("link", "JavaScript:" + pFunction + ";");
	}
	
	/**
	 * 设置和图形的下钻链接
	 * @param pLink
	 */
	public void setLink(String pLink) {
		this.put("link", "n-" + pLink);
	}
}

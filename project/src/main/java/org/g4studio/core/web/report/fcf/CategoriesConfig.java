package org.g4studio.core.web.report.fcf;

import java.util.HashMap;
import java.util.List;

/**
 * FlashReport组合图种类配置对象
 * <b>只适用与组合图
 * @author XiongChun
 * @since 2010-07-13
 */
public class CategoriesConfig extends HashMap{
	/**
	 * 缺省属性配置
	 */
	public CategoriesConfig(){
		this.put("font", "宋体");
		this.put("fontSize", "12");
	}
	
	/**
	 * 设置字体
	 * @param pFoneName
	 */
	public void setFont(String pFoneName){
		this.put("font", pFoneName);
	}
	
	/**
	 * 设置字体大小
	 * @param pFoneName
	 */
	public void setFontSize(String pFontSize){
		this.put("fontSize", pFontSize);
	}
	
	/**
	 * 设置字体颜色
	 * @param pFoneName
	 */
	public void setFontColor(String pFontColor){
		this.put("fontColor", pFontColor);
	}
	
	/**
	 * 设置种类
	 * @param pCategoriesList
	 */
	public void setCategories(List pCategoriesList){
		this.put("categories", pCategoriesList);
	}
	
    /**
     * 获取种类
     * @return
     */
	public List getCategories(){
		return (List)this.get("categories");
	}
}

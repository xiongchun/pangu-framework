package org.g4studio.core.tplengine;

/**
 * 模板接口
 * @author XiongChun
 * @since 2009-07-28
 */
public interface DefaultTemplate {
	
	/**
	 * 设置字符串模板内容或文件模板资源路径
	 * @param pResource
	 */
	public void setTemplateResource(String pResource);
	
	/**
	 * 获取字符串模板内容或文件模板资源路径
	 * @return
	 */
	public String getTemplateResource();
}

package cn.osworks.aos.web.tag.impl.ext.plugins;

import java.util.List;

import javax.servlet.jsp.JspException;


import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.BaseTagSupport;
import cn.osworks.aos.web.tag.impl.ext.ComponentTagSupport;

import com.google.common.collect.Lists;

/**
 * <b>插件集合标签</b>
 * <p>
 * 包括常规按钮、工具栏项目、菜单项目
 * 
 * @author OSWorks-XC
 * @date 2014-02-06
 */
public class PluginsTag extends BaseTagSupport {

	private static final long serialVersionUID = 1L;

	private List<String> plugins = Lists.newArrayList();

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		plugins.clear();
	}

	/**
	 * 往插件容器中追加一个插件字符串字面量
	 * 
	 * @param pluginString
	 */
	public void addPlugin(String pluginString) {
		plugins.add(pluginString);
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		// Native
		tagDto.put("plugins", getPlugins());
		String jspString = mergeFileTemplate(EXTVM + "plugins/pluginsTag.vm", tagDto);
		if (getParent() instanceof ComponentTagSupport) {
			ComponentTagSupport parentTag = (ComponentTagSupport) getParent();
			parentTag.setPlugins(jspString);
		}
		return EVAL_PAGE;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public List<String> getPlugins() {
		return plugins;
	}

}

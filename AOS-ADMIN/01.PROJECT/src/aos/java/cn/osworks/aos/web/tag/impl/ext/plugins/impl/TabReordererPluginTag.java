package cn.osworks.aos.web.tag.impl.ext.plugins.impl;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.BaseTagSupport;
import cn.osworks.aos.web.tag.impl.ext.plugins.PluginsTag;

/**
 * Tab卡片的右键关闭菜单
 * 
 * @author OSWorks-XC
 */
public class TabReordererPluginTag extends BaseTagSupport {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		return SKIP_BODY;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		String jspString = mergeFileTemplate(EXTVM + "plugins/impl/tabReordererPluginTag.vm", tagDto);
		if (getParent() instanceof PluginsTag) {
			PluginsTag parentTag = (PluginsTag) getParent();
			parentTag.addPlugin(jspString);
		}
		return EVAL_PAGE;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

}

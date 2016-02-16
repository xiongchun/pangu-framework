package cn.osworks.aos.web.tag.impl.ext.general;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.ComponentTagSupport;


/**
 * <b>Ext Component可视标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-03-06
 */
public class ComponentTag extends ComponentTagSupport {

	private static final long serialVersionUID = 1L;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		setXtype(Xtypes.COMPONENT);
		resetListenerContainer();
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
		String jspString = mergeFileTemplate(EXTVM + "componentTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		doClear();
		return EVAL_PAGE;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	private void doClear() throws JspException {
		setId(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

}

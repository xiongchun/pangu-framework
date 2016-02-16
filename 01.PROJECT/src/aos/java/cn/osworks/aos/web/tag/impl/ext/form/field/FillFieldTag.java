package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;


/**
 * <b>FillField标签实现类</b> 提示：此标签仅依赖作为占位和填充之用
 * 
 * @author OSWorks-XC
 * @date 2014-04-18
 */
public class FillFieldTag extends FormItemTagSupport {

	private static final long serialVersionUID = 1L;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		setXtype(Xtypes.DISPLAYFIELD);
		resetListenerContainer();

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
		String jspString = mergeFileTemplate(EXTVM + "form/fillFieldTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		addCur2ParentItems();
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

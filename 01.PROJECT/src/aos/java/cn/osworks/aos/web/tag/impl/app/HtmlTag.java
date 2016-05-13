package cn.osworks.aos.web.tag.impl.app;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TagDto;


/**
 * <b>Html标签</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-06-06
 */
public class HtmlTag extends AppTagSupport {

	private static final long serialVersionUID = 1L;

	private String html5 = TRUE;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {

	}

	/**
	 * 将一些参数变量存入pageContext,供JSP页面使用${}取值<br>
	 * 更多参数导出和存取标准请参阅<export/>标签
	 * 
	 * @param pageContext
	 */
	private void initWebContext() {
		pageContext.setAttribute(AOSCons.CXT_KEY, pageContext.getServletContext().getContextPath());
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		initWebContext();
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		// Native
		tagDto.put("html5", html5);
		String jspString = mergeFileTemplate(APPVM + "htmlStartTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		Dto hashDto = new TagDto();
		String jspString = mergeFileTemplate(APPVM + "htmlEndTag.vm", hashDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public void setHtml5(String html5) {
		this.html5 = html5;
	}

}

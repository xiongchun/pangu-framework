package cn.osworks.aos.web.tag.impl.ext.general;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.BaseTagSupport;


/**
 * <b>Script标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-03-06
 */
public class ScriptTag extends BaseTagSupport {

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
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		String jspString = mergeFileTemplate(EXTVM + "scriptStartTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		return EVAL_BODY_BUFFERED;
	}

	/**
	 * 标签
	 */
	public int doAfterBody() throws JspException {
		String bodyContent = getBodyContent().getString();
		int length = bodyContent.length();
		// 去除JSP中用以标记脚本的<script>标记
		bodyContent = bodyContent.substring(34, length - 11);
		try {
			getPreviousOut().write(bodyContent);
		} catch (IOException e) {
			throw new JspException(e);
		}
		return SKIP_BODY;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		Dto hashDto = new HashDto();
		String jspString = mergeFileTemplate(EXTVM + "scriptEndTag.vm", hashDto);
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

	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}
}

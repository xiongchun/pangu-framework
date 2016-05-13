package cn.osworks.aos.web.tag.impl.app;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TagDto;


/**
 * <b>Html Base标签</b>
// * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-06-06
 */
public class HtmlBaseTag extends AppTagSupport {

	private static final long serialVersionUID = 1L;

	private String href;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {

	}

	/**
	 * 处理Href地址
	 * 
	 * @return
	 */
	private String getMyHref() {
		String href = getHref();
		if (AOSUtils.isEmpty(href)) {
			return null;
		}
		if (!href.endsWith("/")) {
			href += "/";
		}
		if (!href.startsWith("/")) {
			href = "/" + href;
		}
		href = getContextpath() + href;
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		// 兼顾IE，必须加上下面这个头。base标签才IE下才有效。
		String head = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		href = head + href;
		return href;
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		tagDto.put("href", getMyHref());
		String jspString = mergeFileTemplate(APPVM + "htmlBaseTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		return SKIP_BODY;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

}

package cn.osworks.aos.web.tag.impl.app;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TagDto;


/**
 * <b>Head标签</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class HeadTag extends AppTagSupport {

	private static final long serialVersionUID = 1L;

	private String title;

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
		// Native
		tagDto.put("title", title);
		tagDto.put("appico", WebCxt.getCfgOfDB("app_ico"));
		String skin = WebCxt.getCfgByUser(pageContext.getSession(), "skin_");
		tagDto.put("skin", skin);
		tagDto.put(AOSCons.CXT_KEY, getContextpath());
		//浏览器类型处理
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		String ie_version = AOSUtils.getIeVersion(request.getHeader("USER-AGENT"));
		if (AOSUtils.isEmpty(ie_version)) {
			ie_version = "-1";  //非IE或者IE装了GCF
		}
		tagDto.put("ie_version", Integer.valueOf(ie_version));
		tagDto.put("treenode_cursor", WebCxt.getCfgOfDB("treenode_cursor_", "pointer"));
		String jspString = mergeFileTemplate(APPVM + "headTag.vm", tagDto);
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
		String jspString = "</head>";
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

	public void setTitle(String title) {
		this.title = title;
	}

}

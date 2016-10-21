package aos.framework.taglib.impl.app;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.asset.AOSTagUtils;
import aos.framework.taglib.core.model.TagDto;


/**
 * <b>资源导入标签</b>
 * 
 * @author xiongchun
 * @since 6.0
 * @date 2013-06-06
 */
public class IncludeTag extends AppTagSupport {

	private static final long serialVersionUID = 1L;

	private String lib;
	private String css;
	private String js;

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
		if (AOSUtils.isNotEmpty(lib)) {
			String[] libs = lib.split(",");
			for (String libkey : libs) {
				tagDto.put(libkey, TRUE);
			}
		}
		tagDto.put("css", css);
		tagDto.put("js", js);
		String skin =  AOSTagUtils.getCurSkin((HttpServletRequest)pageContext.getRequest());
		tagDto.put("skin", skin);
		String jspString = mergeFileTemplate(APPVM + "includeTag.vm", tagDto);
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

	public String getLib() {
		return lib;
	}

	public void setLib(String lib) {
		this.lib = lib;
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}

	public String getJs() {
		return js;
	}

	public void setJs(String js) {
		this.js = js;
	}

}

package aos.framework.taglib.impl.app;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import aos.framework.core.typewrap.Dto;
import aos.framework.taglib.asset.AOSTagUtils;
import aos.framework.taglib.core.model.TagDto;


/**
 * <b>Body标签</b>
 * 
 * @author xiongchun
 * @since 6.0
 * @date 2014-06-06
 */
public class BodyTag extends AppTagSupport {

	private static final long serialVersionUID = 1L;

	private String class2;
	
	private String backGround = FALSE;

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
		tagDto.put("class", class2);
		tagDto.put("backGround", getBackGround());
		if (StringUtils.equalsIgnoreCase(getBackGround(), TRUE)) {
			String curSkin = AOSTagUtils.getCurSkin((HttpServletRequest)pageContext.getRequest());
			tagDto.put("curSkin", curSkin);
		}
		String jspString = mergeFileTemplate(APPVM + "bodyTag.vm", tagDto);
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
		String jspString = "</body>";
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

	public void setClass2(String class2) {
		this.class2 = class2;
	}

	public String getBackGround() {
		return backGround;
	}

	public void setBackGround(String backGround) {
		this.backGround = backGround;
	}

}

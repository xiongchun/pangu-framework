package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;


/**
 * <b>HtmlEditorField标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-22
 */
public class HtmlEditorTag extends FormItemTagSupport {

	private static final long serialVersionUID = 1L;

	private String enableAlignments;

	private String enableColors;

	private String enableFont;

	private String enableFontSize;

	private String enableFormat;

	private String enableLinks;

	private String enableSourceEdit;

	private String hideToolbarBorder = TRUE;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		setXtype(Xtypes.HTMLEDITOR);
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
		tagDto.put("enableAlignments", getEnableAlignments());
		tagDto.put("enableColors", getEnableColors());
		tagDto.put("enableFont", getEnableFont());
		tagDto.put("enableFontSize", getEnableFontSize());
		tagDto.put("enableFormat", getEnableFormat());
		tagDto.put("enableLinks", getEnableLinks());
		tagDto.put("enableSourceEdit", getEnableSourceEdit());
		tagDto.put("hideToolbarBorder", getHideToolbarBorder());
		String jspString = mergeFileTemplate(EXTVM + "form/htmlEditorTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		super.addTotalColWidth4FormRow();
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

	public String getEnableAlignments() {
		return enableAlignments;
	}

	public void setEnableAlignments(String enableAlignments) {
		this.enableAlignments = enableAlignments;
	}

	public String getEnableColors() {
		return enableColors;
	}

	public void setEnableColors(String enableColors) {
		this.enableColors = enableColors;
	}

	public String getEnableFont() {
		return enableFont;
	}

	public void setEnableFont(String enableFont) {
		this.enableFont = enableFont;
	}

	public String getEnableFontSize() {
		return enableFontSize;
	}

	public void setEnableFontSize(String enableFontSize) {
		this.enableFontSize = enableFontSize;
	}

	public String getEnableFormat() {
		return enableFormat;
	}

	public void setEnableFormat(String enableFormat) {
		this.enableFormat = enableFormat;
	}

	public String getEnableLinks() {
		return enableLinks;
	}

	public void setEnableLinks(String enableLinks) {
		this.enableLinks = enableLinks;
	}

	public String getEnableSourceEdit() {
		return enableSourceEdit;
	}

	public void setEnableSourceEdit(String enableSourceEdit) {
		this.enableSourceEdit = enableSourceEdit;
	}

	public String getHideToolbarBorder() {
		return hideToolbarBorder;
	}

	public void setHideToolbarBorder(String hideToolbarBorder) {
		this.hideToolbarBorder = hideToolbarBorder;
	}

}

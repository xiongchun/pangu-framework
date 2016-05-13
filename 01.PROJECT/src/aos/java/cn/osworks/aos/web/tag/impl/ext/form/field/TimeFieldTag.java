package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;

/**
 * <b>TimeField标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2015-09-21
 */
public class TimeFieldTag extends FormItemTagSupport{

	private static final long serialVersionUID = 1L;

	private String format;

	private String maxValue;

	private String minValue;
	
	private String submitFormat;
	
	private String increment;
	
	

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		setXtype(Xtypes.TIMEFIELD);
		resetListenerContainer();
		if (AOSUtils.isEmpty(getFormat())) {
			setFormat("H点i分");
		}
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
		tagDto.put("format", getFormat());
		tagDto.put("maxValue", getMaxValue());
		tagDto.put("minValue", getMinValue());
		tagDto.put("submitFormat", getSubmitFormat());
		tagDto.put("increment", getIncrement());
		String jspString = mergeFileTemplate(EXTVM + "form/timeFieldTag.vm", tagDto);
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
		setFormat(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getMaxValue() {
		return maxValue;
	}

	public void setMaxValue(String maxValue) {
		this.maxValue = maxValue;
	}

	public String getMinValue() {
		return minValue;
	}

	public void setMinValue(String minValue) {
		this.minValue = minValue;
	}

	public String getSubmitFormat() {
		return submitFormat;
	}

	public void setSubmitFormat(String submitFormat) {
		this.submitFormat = submitFormat;
	}

	public String getIncrement() {
		return increment;
	}

	public void setIncrement(String increment) {
		this.increment = increment;
	}
}

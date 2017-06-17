package aos.framework.taglib.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.ext.FormItemTagSupport;


/**
 * <b>DateField标签实现类</b>
 * 
 * @author xiongchun
 * @date 2014-04-21
 */
public class DateFieldTag extends FormItemTagSupport {

	private static final long serialVersionUID = 1L;

	private String format;

	private String disabledDays;

	private String disabledDaysText;

	private String maxValue;

	private String minValue;
	
	private String submitFormat;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		setXtype(Xtypes.DATEFIELD);
		resetListenerContainer();
		if (AOSUtils.isEmpty(getFormat())) {
			setFormat("Y-m-d");
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
		tagDto.put("disabledDays", getDisabledDays());
		tagDto.put("disabledDaysText", getDisabledDaysText());
		tagDto.put("maxValue", getMaxValue());
		tagDto.put("minValue", getMinValue());
		tagDto.put("submitFormat", getSubmitFormat());
		String jspString = mergeFileTemplate(EXTVM + "form/dateFieldTag.vm", tagDto);
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

	public String getDisabledDays() {
		return disabledDays;
	}

	public void setDisabledDays(String disabledDays) {
		this.disabledDays = disabledDays;
	}

	public String getDisabledDaysText() {
		return disabledDaysText;
	}

	public void setDisabledDaysText(String disabledDaysText) {
		this.disabledDaysText = disabledDaysText;
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

}

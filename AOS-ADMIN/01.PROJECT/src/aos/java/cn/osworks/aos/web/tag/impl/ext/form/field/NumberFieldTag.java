package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;


/**
 * <b>NumberField标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-21
 */
public class NumberFieldTag extends FormItemTagSupport {

	private static final long serialVersionUID = 1L;

	private String maxValue;

	private String minValue;

	private String step;

	private String hideTrigger;

	private String keyNavEnabled;

	private String mouseWheelEnabled;

	private String allowDecimals;

	private String decimalPrecision;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		setXtype(Xtypes.NUMBERFIELD);
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
		tagDto.put("maxValue", getMaxValue());
		tagDto.put("minValue", getMinValue());
		tagDto.put("step", getStep());
		tagDto.put("hideTrigger", getHideTrigger());
		tagDto.put("keyNavEnabled", getKeyNavEnabled());
		tagDto.put("mouseWheelEnabled", getMouseWheelEnabled());
		tagDto.put("allowDecimals", getAllowDecimals());
		tagDto.put("decimalPrecision", getDecimalPrecision());
		String jspString = mergeFileTemplate(EXTVM + "form/numberFieldTag.vm", tagDto);
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

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getHideTrigger() {
		return hideTrigger;
	}

	public void setHideTrigger(String hideTrigger) {
		this.hideTrigger = hideTrigger;
	}

	public String getKeyNavEnabled() {
		return keyNavEnabled;
	}

	public void setKeyNavEnabled(String keyNavEnabled) {
		this.keyNavEnabled = keyNavEnabled;
	}

	public String getMouseWheelEnabled() {
		return mouseWheelEnabled;
	}

	public void setMouseWheelEnabled(String mouseWheelEnabled) {
		this.mouseWheelEnabled = mouseWheelEnabled;
	}

	public String getAllowDecimals() {
		return allowDecimals;
	}

	public void setAllowDecimals(String allowDecimals) {
		this.allowDecimals = allowDecimals;
	}

	public String getDecimalPrecision() {
		return decimalPrecision;
	}

	public void setDecimalPrecision(String decimalPrecision) {
		this.decimalPrecision = decimalPrecision;
	}

}

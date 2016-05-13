package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;
import cn.osworks.aos.web.tag.impl.ext.form.FieldSetTag;
import cn.osworks.aos.web.tag.impl.ext.form.FormPanelTag;

/**
 * <b>DateTimeField标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-21
 */
public class DateTimeFieldTag extends FormItemTagSupport{

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
		setXtype(Xtypes.DATETIMEFIELD);
		resetListenerContainer();
		if (AOSUtils.isEmpty(getFormat())) {
			setFormat("Y-m-d H:i:s");
		}
		//这个组件在父容器的验证不通过的side布局下回出现时分秒选择框换行错位的bug
		FieldSetTag fieldSetTag =  (FieldSetTag)findAncestorWithClass(this,FieldSetTag.class);
		if (fieldSetTag != null && fieldSetTag.getMsgTarget()!= null) {
			if (StringUtils.equals(fieldSetTag.getMsgTarget(), "side")) {
				fieldSetTag.setMsgTarget("qtip");
			}
		}else {
			FormPanelTag formPanelTag =  (FormPanelTag)findAncestorWithClass(this,FormPanelTag.class);
			if (formPanelTag != null && StringUtils.equals(formPanelTag.getMsgTarget(), "side")) {
				formPanelTag.setMsgTarget("qtip");
			}
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
		String jspString = mergeFileTemplate(EXTVM + "form/dateTimeFieldTag.vm", tagDto);
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

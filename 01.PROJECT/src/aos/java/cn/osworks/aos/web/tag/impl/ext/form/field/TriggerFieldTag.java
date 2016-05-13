package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;


/**
 * <b>TriggerField标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-06-24
 */
public class TriggerFieldTag extends FormItemTagSupport {

	private static final long serialVersionUID = 1L;

	private String maxLength;

	private String minLength;

	private String trigger1Cls;

	private String trigger2Cls;

	private String trigger3Cls;

	private String onTrigger1Click;

	private String onTrigger2Click;

	private String onTrigger3Click;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		setXtype(Xtypes.TRIGGERFIELD);
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
		tagDto.put("maxLength", getMaxLength());
		tagDto.put("minLength", getMinLength());
		tagDto.put("trigger1Cls", getTrigger1Cls());
		tagDto.put("trigger2Cls", getTrigger2Cls());
		tagDto.put("trigger3Cls", getTrigger3Cls());
		tagDto.put("onTrigger1Click", getOnTrigger1Click());
		tagDto.put("onTrigger2Click", getOnTrigger2Click());
		tagDto.put("onTrigger3Click", getOnTrigger3Click());
		String jspString = mergeFileTemplate(EXTVM + "form/triggerFieldTag.vm", tagDto);
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

	public String getMaxLength() {
		return maxLength;
	}

	public void setMaxLength(String maxLength) {
		this.maxLength = maxLength;
	}

	public String getMinLength() {
		return minLength;
	}

	public void setMinLength(String minLength) {
		this.minLength = minLength;
	}

	public String getTrigger1Cls() {
		return trigger1Cls;
	}

	public void setTrigger1Cls(String trigger1Cls) {
		this.trigger1Cls = trigger1Cls;
	}

	public String getTrigger2Cls() {
		return trigger2Cls;
	}

	public void setTrigger2Cls(String trigger2Cls) {
		this.trigger2Cls = trigger2Cls;
	}

	public String getTrigger3Cls() {
		return trigger3Cls;
	}

	public void setTrigger3Cls(String trigger3Cls) {
		this.trigger3Cls = trigger3Cls;
	}

	public String getOnTrigger1Click() {
		return onTrigger1Click;
	}

	public void setOnTrigger1Click(String onTrigger1Click) {
		this.onTrigger1Click = onTrigger1Click;
	}

	public String getOnTrigger2Click() {
		return onTrigger2Click;
	}

	public void setOnTrigger2Click(String onTrigger2Click) {
		this.onTrigger2Click = onTrigger2Click;
	}

	public String getOnTrigger3Click() {
		return onTrigger3Click;
	}

	public void setOnTrigger3Click(String onTrigger3Click) {
		this.onTrigger3Click = onTrigger3Click;
	}

}

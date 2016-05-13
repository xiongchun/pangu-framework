package cn.osworks.aos.web.tag.impl.ext.form.field;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;
import cn.osworks.aos.web.tag.impl.BaseTagSupport;


/**
 * <b>ComboBox的下拉选择项目</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-28
 */
public class OptionTag extends BaseTagSupport {

	private static final long serialVersionUID = 1L;

	private String value;

	private String display;

	private String c;

	private String d;

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
		return SKIP_BODY;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		Dto tagDto = new HashDto();
		tagDto.put("value", getValue());
		tagDto.put("display", getDisplay());
		tagDto.put("c", getC());
		tagDto.put("d", getD());
		ComboBoxFieldTag parentTag = (ComboBoxFieldTag) getParent();
		parentTag.addDataString(tagDto);
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}

}

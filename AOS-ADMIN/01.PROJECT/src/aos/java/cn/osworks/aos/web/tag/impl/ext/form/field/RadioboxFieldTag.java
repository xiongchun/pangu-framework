package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;


/**
 * <b>RadioboxField标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-24
 */
public class RadioboxFieldTag extends FormItemTagSupport {

	private static final long serialVersionUID = 1L;

	private String boxLabel;

	private String boxLabelAlign;

	private String inputValue;

	private String checked;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		setXtype(Xtypes.RADIOFIELD);
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
		tagDto.put("boxLabel", getBoxLabel());
		tagDto.put("boxLabelAlign", getBoxLabelAlign());
		tagDto.put("inputValue", getInputValue());
		tagDto.put("checked", getChecked());
		String jspString = mergeFileTemplate(EXTVM + "form/radioboxFieldTag.vm", tagDto);
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

	public String getBoxLabel() {
		return boxLabel;
	}

	public void setBoxLabel(String boxLabel) {
		this.boxLabel = boxLabel;
	}

	public String getInputValue() {
		return inputValue;
	}

	public void setInputValue(String inputValue) {
		this.inputValue = inputValue;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getBoxLabelAlign() {
		return boxLabelAlign;
	}

	public void setBoxLabelAlign(String boxLabelAlign) {
		this.boxLabelAlign = boxLabelAlign;
	}

}

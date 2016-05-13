package cn.osworks.aos.web.tag.impl.ext.form;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormPanelTagSupport;


/**
 * <b>CheckboxGroup标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-01
 */
public class RadioboxGroupTag extends FormPanelTagSupport {

	private static final long serialVersionUID = 1L;

	private String fieldLabel;

	private String columns = "1";

	private String vertical;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		setXtype(Xtypes.RADIOGROUP);
		resetListenerContainer();
		resetObjInContainerTag();
		setDefaultType(null);
		setItemAnchor(null);
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
		tagDto.put("fieldLabel", getFieldLabel());
		tagDto.put("columns", getColumns());
		tagDto.put("vertical", getVertical());
		String jspString = mergeFileTemplate(EXTVM + "form/radioboxGroupTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		// Items组件处理
		addCur2ParentItems();
		doClear();
		return EVAL_PAGE;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	public void doClear() throws JspException {
		super.doClear();
		setId(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getFieldLabel() {
		return fieldLabel;
	}

	public void setFieldLabel(String fieldLabel) {
		this.fieldLabel = fieldLabel;
	}

	public String getColumns() {
		return columns;
	}

	public void setColumns(String columns) {
		this.columns = columns;
	}

	public String getVertical() {
		return vertical;
	}

	public void setVertical(String vertical) {
		this.vertical = vertical;
	}
}

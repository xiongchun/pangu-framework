package aos.framework.taglib.impl.ext.form;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import aos.framework.core.typewrap.Dto;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.ext.FormPanelTagSupport;


/**
 * <b>CheckboxGroup标签实现类</b>
 * 
 * @author xiongchun
 * @date 2014-04-24
 */
public class CheckboxGroupTag extends FormPanelTagSupport {

	private static final long serialVersionUID = 1L;

	private String fieldLabel;

	private String columns = "1";

	private String vertical;
	
	private String onchange;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		setXtype(Xtypes.CHECKBOXGROUP);
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
		tagDto.put("onchange", getOnchange());
		String jspString = mergeFileTemplate(EXTVM + "form/checkboxGroupTag.vm", tagDto);
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

	public String getOnchange() {
		return onchange;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}


}

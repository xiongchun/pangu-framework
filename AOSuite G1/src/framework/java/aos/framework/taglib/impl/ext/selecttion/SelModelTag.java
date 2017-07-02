package aos.framework.taglib.impl.ext.selecttion;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.ext.ExtTagSupport;
import aos.framework.taglib.impl.ext.grid.GridPanelTag;


/**
 * <b>选择模型标签</b>
 * <p>
 * 用于表格、树等
 * </p>
 * 
 * @author xiongchun
 * @date 2014-05-07
 */
public class SelModelTag extends ExtTagSupport {

	private static final long serialVersionUID = 1L;

	private String mode;

	private String type;

	private String injectCheckbox;

	/**
	 * 内部变量，不需要暴露给JSP属性
	 */
	private String classname;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		resetListenerContainer();
		if (AOSUtils.isEmpty(getType())) {
			// 如果父标签是Grid，则将缺省选择模式设置为行选择模式。
			if (getParent() instanceof GridPanelTag) {
				setType("row");
			}
		}
		if ("row".equalsIgnoreCase(getType())) {
			setType(Xtypes.ROWMODEL);
			classname = "Ext.selection.RowModel";
		} else if ("cell".equalsIgnoreCase(getType())) {
			setType(Xtypes.CELLMODEL);
			classname = "Ext.selection.CellModel";
		} else if ("checkbox".equalsIgnoreCase(getType())) {
			setType(Xtypes.CHECKBOXMODEL);
			classname = "Ext.selection.CheckboxModel";
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
		tagDto.put("mode", getMyMode());
		tagDto.put("type", getType());
		tagDto.put("classname", classname);
		tagDto.put("injectCheckbox", getInjectCheckbox());
		String jspString = mergeFileTemplate(EXTVM + "selModelTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		if (getParent() instanceof GridPanelTag) {
			GridPanelTag parentTag = (GridPanelTag) getParent();
			parentTag.setSelModel(getMyId());
		}
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

	/**
	 * 转换
	 * 
	 * @return
	 */
	public String getMyMode() {
		if (AOSUtils.isNotEmpty(mode)) {
			mode = mode.toUpperCase();
		}
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getMode() {
		return mode;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getInjectCheckbox() {
		return injectCheckbox;
	}

	public void setInjectCheckbox(String injectCheckbox) {
		this.injectCheckbox = injectCheckbox;
	}

}

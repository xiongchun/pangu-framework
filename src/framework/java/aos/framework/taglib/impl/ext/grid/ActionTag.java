package aos.framework.taglib.impl.ext.grid;

import javax.servlet.jsp.JspException;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.impl.HashDto;
import aos.framework.taglib.asset.AOSTagUtils;
import aos.framework.taglib.impl.ext.ExtTagSupport;


/**
 * <b>Ext 表格单元格里的图标按钮</b>
 * 
 * @author xiongchun
 * @date 2014-05-06
 */
public class ActionTag extends ExtTagSupport {

	private static final long serialVersionUID = 1L;

	private String icon;

	private String tooltip;

	private String handler;
	
	private String disabledFn;

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
		// 构造Grid的columns属性
		Dto actionDto = new HashDto();
		super.pkgProperties(actionDto);
		actionDto.put("icon", AOSTagUtils.getIcon(getIcon(), pageContext));
		actionDto.put("tooltip", getTooltip());
		actionDto.put("handler", getHandler());
		actionDto.put("disabledFn", getDisabledFn());
		if (getParent() instanceof ColumnTag) {
			ColumnTag parentTag = (ColumnTag) getParent();
			parentTag.addActionDto(actionDto);
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

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getTooltip() {
		return tooltip;
	}

	public void setTooltip(String tooltip) {
		this.tooltip = tooltip;
	}

	public String getHandler() {
		return handler;
	}

	public void setHandler(String handler) {
		this.handler = handler;
	}

	public String getDisabledFn() {
		return disabledFn;
	}

	public void setDisabledFn(String disabledFn) {
		this.disabledFn = disabledFn;
	}
}

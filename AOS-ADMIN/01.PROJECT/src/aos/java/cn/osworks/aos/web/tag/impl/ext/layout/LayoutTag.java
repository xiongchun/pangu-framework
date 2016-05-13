package cn.osworks.aos.web.tag.impl.ext.layout;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.web.tag.core.model.vo.ConfigVO;
import cn.osworks.aos.web.tag.impl.BaseTagSupport;
import cn.osworks.aos.web.tag.impl.ext.ContainerTagSupport;


/**
 * <b>布局详细配置标签类</b> 此标签必须依附于容器标签
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-04-06
 */
public class LayoutTag extends BaseTagSupport {

	private static final long serialVersionUID = 1L;

	private String type;

	private String titleCollapse;

	private String animate;

	private String hideCollapseTool;

	private String multi;

	private String padding;

	private String activeOnTop;

	private String reserveScrollbar;

	private String columns;

	private String align;

	private String pack;

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
		ContainerTagSupport parentTag = (ContainerTagSupport) getParent();
		parentTag.setLayout(type);
		if (AOSUtils.isNotEmpty(getType())) {
			parentTag.addLayoutConfig(new ConfigVO("type", getType(), true));
		}
		if (AOSUtils.isNotEmpty(getTitleCollapse())) {
			parentTag.addLayoutConfig(new ConfigVO("titleCollapse", getTitleCollapse(), false));
		}
		if (AOSUtils.isNotEmpty(getAnimate())) {
			parentTag.addLayoutConfig(new ConfigVO("animate", getAnimate(), false));
		}
		if (AOSUtils.isNotEmpty(getHideCollapseTool())) {
			parentTag.addLayoutConfig(new ConfigVO("hideCollapseTool", getHideCollapseTool(), false));
		}
		if (AOSUtils.isNotEmpty(getMulti())) {
			parentTag.addLayoutConfig(new ConfigVO("multi", getMulti(), false));
		}
		if (AOSUtils.isNotEmpty(getPadding())) {
			parentTag.addLayoutConfig(new ConfigVO("padding", getPadding(), true));
		}
		if (AOSUtils.isNotEmpty(getActiveOnTop())) {
			parentTag.addLayoutConfig(new ConfigVO("activeOnTop", getActiveOnTop(), false));
		}
		if (AOSUtils.isNotEmpty(getReserveScrollbar())) {
			parentTag.addLayoutConfig(new ConfigVO("reserveScrollbar", getReserveScrollbar(), false));
		}
		if (AOSUtils.isNotEmpty(getColumns())) {
			parentTag.addLayoutConfig(new ConfigVO("columns", getColumns(), false));
		}
		if (AOSUtils.isNotEmpty(getAlign())) {
			parentTag.addLayoutConfig(new ConfigVO("align", getAlign(), true));
		}
		if (AOSUtils.isNotEmpty(getPack())) {
			parentTag.addLayoutConfig(new ConfigVO("pack", getPack(), true));
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

	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitleCollapse() {
		return titleCollapse;
	}

	public void setTitleCollapse(String titleCollapse) {
		this.titleCollapse = titleCollapse;
	}

	public String getAnimate() {
		return animate;
	}

	public void setAnimate(String animate) {
		this.animate = animate;
	}

	public String getHideCollapseTool() {
		return hideCollapseTool;
	}

	public void setHideCollapseTool(String hideCollapseTool) {
		this.hideCollapseTool = hideCollapseTool;
	}

	public String getMulti() {
		return multi;
	}

	public void setMulti(String multi) {
		this.multi = multi;
	}

	public String getPadding() {
		return padding;
	}

	public void setPadding(String padding) {
		this.padding = padding;
	}

	public String getActiveOnTop() {
		return activeOnTop;
	}

	public void setActiveOnTop(String activeOnTop) {
		this.activeOnTop = activeOnTop;
	}

	public String getReserveScrollbar() {
		return reserveScrollbar;
	}

	public void setReserveScrollbar(String reserveScrollbar) {
		this.reserveScrollbar = reserveScrollbar;
	}

	public String getColumns() {
		return columns;
	}

	public void setColumns(String columns) {
		this.columns = columns;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public String getPack() {
		return pack;
	}

	public void setPack(String pack) {
		this.pack = pack;
	}

}

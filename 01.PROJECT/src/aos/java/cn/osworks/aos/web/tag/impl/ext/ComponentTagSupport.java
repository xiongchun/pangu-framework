package cn.osworks.aos.web.tag.impl.ext;

import java.math.BigDecimal;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.core.model.vo.ItemVO;
import cn.osworks.aos.web.tag.impl.ext.form.RowSet2Tag;
import cn.osworks.aos.web.tag.impl.ext.form.RowSetTag;
import cn.osworks.aos.web.tag.impl.ext.layout.ViewportTag;


/**
 * <b>Ext可视组件基类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class ComponentTagSupport extends ExtTagSupport {

	private static final long serialVersionUID = 1L;

	private String region;

	private String renderTo;

	private String width;

	private String height;

	private String frame;

	private String border;

	private String autoScroll;

	private String margin;

	private String contentEl;

	private String html;

	private String iconCls;

	private String icon;

	private String iconVec;

	private String iconVecSize;

	private String iconVecAlign;

	private String style;

	private String padding;

	private String disabled;

	private String tooltip;

	private String columnWidth;

	private String center;

	private String animate;

	private String maxWidth;

	private String minWidth;

	private String maxHeight;

	private String minHeight;

	private String resizable;

	private String tpl; // 内部变量-不需要tld暴露给JSP

	// 内部变量，其值由<plugins/>标签赋给
	private String plugins;

	/**
	 * 将属性打包
	 * 
	 * @param pDto
	 * @return
	 */
	protected Dto pkgProperties(Dto tagDto) {
		super.pkgProperties(tagDto);
		tagDto.put("region", getRegion());
		tagDto.put("renderTo", AOSTagUtils.getRenderTo(getRenderTo()));
		tagDto.put("width", AOSTagUtils.getMyWidth(getWidth()));
		tagDto.put("height", AOSTagUtils.getMyHeight(getHeight()));
		tagDto.put("frame", getFrame());
		tagDto.put("border", AOSTagUtils.getMyBorder(getBorder()));
		tagDto.put("autoScroll", getAutoScroll());
		tagDto.put("margin", getMargin());
		tagDto.put("contentEl", getContentEl());
		tagDto.put("html", getHtml());
		tagDto.put("iconCls", getIconCls());
		tagDto.put("icon", AOSTagUtils.getIcon(getIcon(), pageContext));
		tagDto.put("style", getStyle());
		tagDto.put("padding", getPadding());
		tagDto.put("disabled", getDisabled());
		tagDto.put("tooltip", getTooltip());
		tagDto.put("columnWidth", getColumnWidth());
		//tagDto.put("center", getCenter());
		tagDto.put("animate", getAnimate());
		tagDto.put("maxWidth", AOSTagUtils.getMyMaxWidth(getMaxWidth()));
		tagDto.put("minWidth", getMinWidth());
		tagDto.put("maxHeight", AOSTagUtils.getMyMaxHeight(getMaxHeight()));
		tagDto.put("minHeight", getMinHeight());
		tagDto.put("resizable", getResizable());
		tagDto.put("tpl", getTpl());
		tagDto.put("plugins", getPlugins());
		return tagDto;
	}

	/**
	 * 处理布局和Item
	 * 
	 * 本来应该写在每个子类具体实现里面去更加直观的表达其语义。
	 * 
	 * @throws JspException
	 */
	protected void addCur2ParentItems() throws JspException {
		ItemVO itemVO = new ItemVO();
		itemVO.setId(getMyId());
		Tag parentTag = AOSTagUtils.getParent(getParent());
		if (parentTag instanceof ContainerTagSupport) {
			((ContainerTagSupport) parentTag).addItem(itemVO);
		}
	}

	/**
	 * 计算FormRow中元素columnwith累加
	 * 
	 * 注：放在这是因为兼顾button标签
	 * 
	 * 供表单field调用
	 * 
	 * @throws JspException
	 */
	protected void addTotalColWidth4FormRow() throws JspException {
		if (getParent() instanceof RowSet2Tag || getParent() instanceof RowSetTag) {
			FormPanelTagSupport parentTag = (FormPanelTagSupport) getParent();
			if (AOSUtils.isEmpty(getColumnWidth())) {
				setColumnWidth("0");
			}
			parentTag.addTotalColWidth(new BigDecimal(getColumnWidth()));
		}
	}

	/**
	 * 如果父标签是个Window的话，缺省将其border属性设置为false。以防止边框重合。
	 */
	protected void doBorderPrepare() {
		if (getParent() instanceof PanelTagSupport) {
			if (AOSUtils.isEmpty(getBorder())) {
				setBorder(FALSE);
			}
		}
	}

	/**
	 * 如果父标签是个容器标签，则将子面板型标签的width设置为200。防止没有width属性，某些布局情况会失败。
	 */
	protected void doWidthPrepare() {
		if (getParent() instanceof ContainerTagSupport) {
			if (AOSUtils.isEmpty(getWidth())) {
				setWidth("200");
			}
		}
	}
	
	/**
	 * 将当前组件设置为居中对齐，且监听窗口变化事件对齐动画居中
	 * 
	 * <p>此方法一般供面板型子组件调用
	 * 
	 * @throws JspException
	 */
	protected void doCenterIt() throws JspException {
		if (StringUtils.equalsIgnoreCase(TRUE, getCenter())) {
			ViewportTag viewportTag = (ViewportTag) findAncestorWithClass(this,ViewportTag.class);
			if (viewportTag != null) {
				if (AOSUtils.isEmpty(getRegion())) {
					viewportTag.centerIt(getMyId());
				}
			}
		}
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getBorder() {
		return border;
	}

	public void setBorder(String border) {
		this.border = border;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public String getAutoScroll() {
		return autoScroll;
	}

	public void setAutoScroll(String autoScroll) {
		this.autoScroll = autoScroll;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getRenderTo() {
		return renderTo;
	}

	public void setRenderTo(String renderTo) {
		this.renderTo = renderTo;
	}

	public String getMargin() {
		return margin;
	}

	public void setMargin(String margin) {
		this.margin = margin;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getContentEl() {
		return contentEl;
	}

	public void setContentEl(String contentEl) {
		this.contentEl = contentEl;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getFrame() {
		return frame;
	}

	public void setFrame(String frame) {
		this.frame = frame;
	}

	public String getPadding() {
		return padding;
	}

	public void setPadding(String padding) {
		this.padding = padding;
	}

	public String getIcon() {
		return icon;
	}

	public String getTooltip() {
		return tooltip;
	}

	public void setTooltip(String tooltip) {
		this.tooltip = tooltip;
	}

	public String getColumnWidth() {
		return columnWidth;
	}

	public void setColumnWidth(String columnWidth) {
		this.columnWidth = columnWidth;
	}

	public String getCenter() {
		return center;
	}

	public void setCenter(String center) {
		this.center = center;
	}

	public String getAnimate() {
		return animate;
	}

	public void setAnimate(String animate) {
		this.animate = animate;
	}

	public String getMaxWidth() {
		return maxWidth;
	}

	public void setMaxWidth(String maxWidth) {
		this.maxWidth = maxWidth;
	}

	public String getMinWidth() {
		return minWidth;
	}

	public void setMinWidth(String minWidth) {
		this.minWidth = minWidth;
	}

	public String getMaxHeight() {
		return maxHeight;
	}

	public void setMaxHeight(String maxHeight) {
		this.maxHeight = maxHeight;
	}

	public String getMinHeight() {
		return minHeight;
	}

	public void setMinHeight(String minHeight) {
		this.minHeight = minHeight;
	}

	public String getPlugins() {
		return plugins;
	}

	public void setPlugins(String plugins) {
		this.plugins = plugins;
	}

	public String getTpl() {
		return tpl;
	}

	public void setTpl(String tpl) {
		this.tpl = tpl;
	}

	public String getResizable() {
		return resizable;
	}

	public void setResizable(String resizable) {
		this.resizable = resizable;
	}

	public String getIconVec() {
		return iconVec;
	}

	public void setIconVec(String iconVec) {
		this.iconVec = iconVec;
	}

	public String getIconVecSize() {
		return iconVecSize;
	}

	public void setIconVecSize(String iconVecSize) {
		this.iconVecSize = iconVecSize;
	}

	public String getIconVecAlign() {
		return iconVecAlign;
	}

	public void setIconVecAlign(String iconVecAlign) {
		this.iconVecAlign = iconVecAlign;
	}

}

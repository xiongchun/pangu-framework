package cn.osworks.aos.web.tag.impl.ext;

import java.math.BigDecimal;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;


/**
 * <b>表单容器类组件基类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-18
 */
public class FormPanelTagSupport extends PanelTagSupport {

	private static final long serialVersionUID = 1L;

	private String labelWidth;

	private String labelAlign = "right";

	private String labelSeparator;

	private String labelPad;

	/**
	 * 这个属性比较特殊，不是输出到FormPanelTagSupport子类的VM中，而是由表单元素继承后直接输出到表单元素中
	 */
	private String rowSpace;

	private String itemAnchor = "100%";

	private String defaultType = "textfield";

	private String msgTarget;

	/**
	 * 内部属性:FormRow下表单元素集合的ColumnWidth之和
	 */
	private BigDecimal totalColWidth;

	/**
	 * 将属性打包
	 * 
	 * @param pDto
	 * @return
	 */
	protected Dto pkgProperties(Dto tagDto) {
		super.pkgProperties(tagDto);
		tagDto.put("labelWidth", getLabelWidth());
		tagDto.put("labelAlign", getLabelAlign());
		tagDto.put("labelSeparator", getLabelSeparator());
		tagDto.put("rowSpace", getRowSpace());
		tagDto.put("itemAnchor", getItemAnchor());
		tagDto.put("defaultType", getDefaultType());
		tagDto.put("msgTarget", getMsgTarget());
		/**
		 * 对于FormPanle及其子类，覆盖父类中的style属性
		 * 由于经典布局下，面板即便是设置frame=false后，还是有一个背景色。如果对formpanel设置了paddding之类的属性，
		 * 则会出现本应是白色底板变成背景色的情况。所以这里对formpanel设置组件style的背景色。
		 */
		// TODO 参数配置功能出来后可以修改为只是经典系列主题需要做此设置
		tagDto.put("style", AOSTagUtils.getMyStyleOrBodyStye(getStyle()));
		return tagDto;
	}

	/**
	 * FormRow里的表单元素调用累加列宽
	 * 
	 * @throws JspException
	 */
	public void addTotalColWidth(BigDecimal columnWidth) throws JspException {
		if (totalColWidth == null) {
			totalColWidth = new BigDecimal(0);
		}
		totalColWidth = totalColWidth.add(columnWidth);
		if (totalColWidth.floatValue() > 1) {
			throw new AOSException(11);
		}
	}

	public String getLabelWidth() {
		return labelWidth;
	}

	public void setLabelWidth(String labelWidth) {
		this.labelWidth = labelWidth;
	}

	public String getLabelAlign() {
		return labelAlign;
	}

	public void setLabelAlign(String labelAlign) {
		this.labelAlign = labelAlign;
	}

	public String getLabelSeparator() {
		return labelSeparator;
	}

	public void setLabelSeparator(String labelSeparator) {
		this.labelSeparator = labelSeparator;
	}

	public String getItemAnchor() {
		return itemAnchor;
	}

	public void setItemAnchor(String itemAnchor) {
		this.itemAnchor = itemAnchor;
	}

	public String getDefaultType() {
		return defaultType;
	}

	public void setDefaultType(String defaultType) {
		this.defaultType = defaultType;
	}

	public void setRowSpace(String rowSpace) {
		this.rowSpace = rowSpace;
	}

	public String getMsgTarget() {
		return msgTarget;
	}

	public void setMsgTarget(String msgTarget) {
		this.msgTarget = msgTarget;
	}

	public String getLabelPad() {
		return labelPad;
	}

	public void setLabelPad(String labelPad) {
		this.labelPad = labelPad;
	}

	public String getRowSpace() {
		return rowSpace;
	}

	public BigDecimal getTotalColWidth() {
		return totalColWidth;
	}

	public void setTotalColWidth(BigDecimal totalColWidth) {
		this.totalColWidth = totalColWidth;
	}

}

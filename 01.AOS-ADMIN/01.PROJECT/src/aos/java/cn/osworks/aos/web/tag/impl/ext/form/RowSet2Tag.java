package cn.osworks.aos.web.tag.impl.ext.form;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.core.model.vo.ItemVO;
import cn.osworks.aos.web.tag.impl.ext.FormPanelTagSupport;


/**
 * <b>RowSet2Tag标签实现类</b>
 * 
 * 用于FormPanel布局，这个标签很特殊。没有直接对应的VM文件。但是标签属性是需要设置的。这些属性被其它标签使用。<br>
 * 
 * 原理：自动计算这个标签内部的表单元素,如果不足1，则自动生成占位的空标签displaytag以补足(实现换行)。如果>1，
 * 则提示行标签内的子组件列宽之和不能大于1。<br>
 * 
 * 提示：建议尽量优先使用rowSet标签，rowSet标签基于Ext的FieldSet组件实现，更完善。而且，
 * rowSet标签能够完美支持固定列宽和相对列宽的组合布局。
 * 
 * @author OSWorks-XC
 * @date 2014-04-16
 */
public class RowSet2Tag extends FormPanelTagSupport {

	private static final long serialVersionUID = 1L;

	/**
	 * 误差矫正值
	 */
	private String checkValue = "0.05";

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		setItemVOs(null);
		setTotalColWidth(null);

		// RowSet2是一个虚拟标签,无布局模式。其布局直接继承自其父容器的布局。
		// RowSet2的RowSpace属性也直接继承自父容器
		FormPanelTagSupport parentTag = (FormPanelTagSupport) getParent();
		String layout = parentTag.getLayout();
		setLayout(layout);
		setRowSpace(parentTag.getRowSpace());
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
		BigDecimal myWidth = new BigDecimal(1).subtract(getTotalColWidth());
		if (myWidth.doubleValue() > 0) {
			Dto displayFieldTagDto = new TagDto();
			// 借用FormRow的ID，FormRow并没真实生成对应组件
			displayFieldTagDto.put("id", getMyId());
			displayFieldTagDto.put("columnWidth",
					myWidth.subtract(new BigDecimal(checkValue)).setScale(2, BigDecimal.ROUND_HALF_UP));
			displayFieldTagDto.put("parentRowSpace", getRowSpace());
			displayFieldTagDto.put("aboutme", "由formrow计算生成");
			String jspString = mergeFileTemplate(EXTVM + "form/displayFieldTag.vm", displayFieldTagDto);
			try {
				pageContext.getOut().write(jspString);
			} catch (IOException e) {
				throw new JspException(e);
			}
		}
		if (getParent() instanceof FormPanelTagSupport) {
			FormPanelTagSupport parengTag = (FormPanelTagSupport) getParent();
			// 获取FormRow标签的Items集合
			List<ItemVO> itemVOs = getItemVOs();
			// 将FormRow的Items组件分别压入到FormPanel的Items集合
			for (ItemVO itemVO : itemVOs) {
				parengTag.addItem(itemVO);
			}
			// 如果FormRow的子元素没填充满，则追加将占位符标签
			if (myWidth.doubleValue() > 0) {
				ItemVO itemVO = new ItemVO();
				itemVO.setId(getMyId());
				String layout = parengTag.getLayout();
				// 只有column布局下才生成占位标签
				if ("column".equals(layout)) {
					parengTag.addItem(itemVO);
				}
			}
		}

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

	public String getCheckValue() {
		return checkValue;
	}

	public void setCheckValue(String checkValue) {
		this.checkValue = checkValue;
	}

}

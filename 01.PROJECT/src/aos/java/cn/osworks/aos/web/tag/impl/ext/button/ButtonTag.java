package cn.osworks.aos.web.tag.impl.ext.button;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.ButtonTagSupport;


/**
 * <b>按钮组件标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class ButtonTag extends ButtonTagSupport {

	private static final long serialVersionUID = 1L;

	private String iconAlign;

	private String arrowAlign;

	private String textAlign;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		// 1个标签对应多个Xtype组件的情况
		if (AOSUtils.isEmpty(getXtype())) {
			setXtype(Xtypes.BUTTON);
		}
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
		// Native
		tagDto.put("iconAlign", getIconAlign());
		tagDto.put("arrowAlign", getIconAlign());
		tagDto.put("textAlign", getIconAlign());
		// Logic
		String classtype = "Ext.button.Button";
		if (AOSUtils.isNotEmpty(getXtype())) {
			if (getXtype().equalsIgnoreCase("splitbutton")) {
				classtype = "Ext.button.Split";
			}
		}
		tagDto.put("menuid", getMenuid());
		tagDto.put("classtype", classtype);
		String jspString = mergeFileTemplate(EXTVM + "buttonTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		// 当button在form里的时候
		addTotalColWidth4FormRow();
		// 将button作为布局元素
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

	public String getIconAlign() {
		return iconAlign;
	}

	public void setIconAlign(String iconAlign) {
		this.iconAlign = iconAlign;
	}

	public String getArrowAlign() {
		return arrowAlign;
	}

	public void setArrowAlign(String arrowAlign) {
		this.arrowAlign = arrowAlign;
	}

	public String getTextAlign() {
		return textAlign;
	}

	public void setTextAlign(String textAlign) {
		this.textAlign = textAlign;
	}
}

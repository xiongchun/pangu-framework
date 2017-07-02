package aos.framework.taglib.impl.ext.button;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.ext.ButtonTagSupport;


/**
 * <b>按钮组件标签实现类</b>
 * 
 * @author xiongchun
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
		
		if (StringUtils.equals(getIconAlign(), "top") || StringUtils.equals(getIconAlign(), "bottom") ) {
			if (AOSUtils.isEmpty(getScale())) {
				setScale("medium");
			}
		}
		
		//设置按钮缺省高度
		if (AOSUtils.isEmpty(getScale()) && AOSUtils.isEmpty(getHeight())) {
			setHeight("25");
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
		tagDto.put("arrowAlign", getArrowAlign());
		tagDto.put("textAlign", getTextAlign());
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
		setScale(null);
		setIconAlign(null);
		setArrowAlign(null);
		setTextAlign(null);
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

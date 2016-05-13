package cn.osworks.aos.web.tag.impl.ext.menu;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.ButtonTagSupport;
import cn.osworks.aos.web.tag.impl.ext.PanelTagSupport;


/**
 * <b>Ext 菜单容器标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class MenuTag extends PanelTagSupport {

	private static final long serialVersionUID = 1L;

	private String plain;

	private String floating;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		if (StringUtils.equals(getFloating(), FALSE)) {
			doBorderPrepare();
		}
		setXtype(Xtypes.MENU);
		resetListenerContainer();
		resetObjInContainerTag();
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		// Native
		tagDto.put("plain", getPlain());
		tagDto.put("floating", getFloating());
		String jspString = mergeFileTemplate(EXTVM + "menuTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}

		if (AOSUtils.isEmpty(tagDto.getString("renderTo"))) {
			if (StringUtils.equals(getFloating(), FALSE)) {
				//这种情况下menu组件将作为父容器组件的主体部分渲染
				//Items组件处理
				addCur2ParentItems();
			}else {
				//这种情况下menu组将将作为父容器组件的主体部分渲染
				if (getParent() instanceof ButtonTagSupport) {
					// menuid传给button系的父组件用于下拉菜单展示
					ButtonTagSupport parentTag = (ButtonTagSupport) getParent();
					parentTag.addMenuBySubTag(tagDto.getString("id"));
				}
				if (getParent() instanceof PanelTagSupport) {
					// menuid传给treepanel、gridpanel系的父组件用于列表项的上下文菜单展示
					PanelTagSupport parentTag = (PanelTagSupport) getParent();
					parentTag.setContextMenuID(tagDto.getString("id"));
				}
			}
		}
		doClear();
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	public void doClear() throws JspException {
		super.doClear();
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {

		// 重置相关容器和属性
		setId(null);
		return EVAL_PAGE;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getPlain() {
		return plain;
	}

	public void setPlain(String plain) {
		this.plain = plain;
	}

	public String getFloating() {
		return floating;
	}

	public void setFloating(String floating) {
		this.floating = floating;
	}

}

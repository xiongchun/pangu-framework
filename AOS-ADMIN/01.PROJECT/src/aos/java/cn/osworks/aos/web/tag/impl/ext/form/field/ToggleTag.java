package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.XTagSupport;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;
import cn.osworks.aos.web.tag.impl.ext.FormPanelTagSupport;
import cn.osworks.aos.web.tag.impl.ext.docked.DockedTag;
import cn.osworks.aos.web.tag.impl.ext.general.OnReadyTag;


/**
 * <b>Toggle标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-14
 */
public class ToggleTag extends FormItemTagSupport {

	private static final long serialVersionUID = 1L;

	private String onText;
	private String offText;
	private String resizeHandle;
	private String cls;
	private String state = FALSE;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		// 缺省为toggle
		String xtypeString = "toggleslide";
		// 如果JSP没有指定，则自动识别。
		XTagSupport parentTag = (XTagSupport) getParent();
		if (AOSUtils.isEmpty(getXtype())) {
			if (parentTag instanceof FormPanelTagSupport) {
				// 包含formpanel、fieldset、rowset
				xtypeString = "toggleslidefield";
			}
		} else {
			// 如果JSP已经指定，则以JSP为准。
			if (StringUtils.equalsIgnoreCase(getXtype(), "togglefield")) {
				xtypeString = "toggleslidefield";
			}
		}
		setXtype(xtypeString);
		if (xtypeString.equalsIgnoreCase("toggleslide") && !(parentTag instanceof DockedTag)) {
			// 如果在DockedTag里使用，则不能设置这个高度，否则导致此组件和其它工具栏子组件错位
			if (AOSUtils.isEmpty(getHeight())) {
				setHeight("25");
			}
		}
		resetListenerContainer();
		// 通知onReadyTag加载依赖资源
		OnReadyTag onReadyTag = (OnReadyTag) findAncestorWithClass(this, OnReadyTag.class);
		onReadyTag.setToggle(TRUE);
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
		tagDto.put("onText", getOnText());
		tagDto.put("offText", getOffText());
		tagDto.put("resizeHandle", getResizeHandle());
		tagDto.put("cls", getCls());
		tagDto.put("state", getState());
		String jspString = mergeFileTemplate(EXTVM + "form/toggleTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		super.addTotalColWidth4FormRow();
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
		setOnText(null);
		setOffText(null);
		setResizeHandle(null);
		setCls(null);
		setState(null);
		setHeight(null);
		setXtype(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getOnText() {
		return onText;
	}

	public void setOnText(String onText) {
		this.onText = onText;
	}

	public String getOffText() {
		return offText;
	}

	public void setOffText(String offText) {
		this.offText = offText;
	}

	public String getResizeHandle() {
		return resizeHandle;
	}

	public void setResizeHandle(String resizeHandle) {
		this.resizeHandle = resizeHandle;
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}

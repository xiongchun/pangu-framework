package cn.osworks.aos.web.tag.impl.ext.plugins.impl;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.BaseTagSupport;
import cn.osworks.aos.web.tag.impl.ext.plugins.PluginsTag;


/**
 * <b>表格系列组件编辑器插件</b>
 * <p>
 * 标签实现将单元格编辑器和行编辑合并到了一起
 * 
 * @author OSWorks-XC
 * @date 2014-02-06
 */
public class EditingPluginTag extends BaseTagSupport {

	private static final long serialVersionUID = 1L;

	private String ptype = "rowediting";

	private String clicksToEdit;

	private String autoCancel;

	private String onbeforeedit;

	private String oncanceledit;

	private String onedit;

	private String onvalidateedit;

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
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		// Native
		tagDto.put("ptype", getPtype());
		tagDto.put("clicksToEdit", getClicksToEdit());
		tagDto.put("autoCancel", getAutoCancel());
		tagDto.put("onbeforeedit", getOnbeforeedit());
		tagDto.put("oncanceledit", getOncanceledit());
		tagDto.put("onedit", getOnedit());
		tagDto.put("onvalidateedit", getOnvalidateedit());
		String jspString = mergeFileTemplate(EXTVM + "plugins/impl/editingPluginTag.vm", tagDto);
		if (getParent() instanceof PluginsTag) {
			PluginsTag parentTag = (PluginsTag) getParent();
			parentTag.addPlugin(jspString);
		}
		return EVAL_PAGE;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getClicksToEdit() {
		return clicksToEdit;
	}

	public void setClicksToEdit(String clicksToEdit) {
		this.clicksToEdit = clicksToEdit;
	}

	public String getAutoCancel() {
		return autoCancel;
	}

	public void setAutoCancel(String autoCancel) {
		this.autoCancel = autoCancel;
	}

	public String getOnbeforeedit() {
		return onbeforeedit;
	}

	public void setOnbeforeedit(String onbeforeedit) {
		this.onbeforeedit = onbeforeedit;
	}

	public String getOncanceledit() {
		return oncanceledit;
	}

	public void setOncanceledit(String oncanceledit) {
		this.oncanceledit = oncanceledit;
	}

	public String getOnedit() {
		return onedit;
	}

	public void setOnedit(String onedit) {
		this.onedit = onedit;
	}

	public String getOnvalidateedit() {
		return onvalidateedit;
	}

	public void setOnvalidateedit(String onvalidateedit) {
		this.onvalidateedit = onvalidateedit;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

}

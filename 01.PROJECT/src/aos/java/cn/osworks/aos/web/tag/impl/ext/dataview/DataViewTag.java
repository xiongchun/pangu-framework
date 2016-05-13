package cn.osworks.aos.web.tag.impl.ext.dataview;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.ComponentTagSupport;
import cn.osworks.aos.web.tag.impl.ext.general.OnReadyTag;


/**
 * <b>View标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-11-06
 */
public class DataViewTag extends ComponentTagSupport {

	private static final long serialVersionUID = 1L;

	private String fields;
	private String autoLoad;
	private String url;
	private String itemSelector;
	private String overItemCls;
	private String multiSelect;
	private String onselectionchange;
	private String animated; // 第二次load store的时候会出现bug，开启了动画则只能一次load数据之后使用过滤功能。
	private String duration;
	private String idProperty;
	private String onload;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		setXtype(Xtypes.VIEW);
		if (AOSUtils.isEmpty(getAutoLoad())) {
			setAutoLoad(FALSE);
		}
		if (AOSUtils.isEmpty(getMultiSelect())) {
			setMultiSelect(FALSE);
		}
		if (AOSUtils.isEmpty(getDuration())) {
			setDuration("500");
		}
		if (AOSUtils.isEmpty(getAnimated())) {
			setAnimated(FALSE);
		}
		if (AOSUtils.isEmpty(getAutoScroll())) {
			setAutoScroll(TRUE);
		}
		resetListenerContainer();
		OnReadyTag onReadyTag = (OnReadyTag) findAncestorWithClass(this, OnReadyTag.class);
		onReadyTag.setDataView(TRUE); // 引入依赖的动画插件资源
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		// 如果客户端是IE，则忽略JSP的设置由标签内部强行禁止动画。否则动画会出现瑕疵。
		if (AOSUtils.isIE(request.getHeader("USER-AGENT"))) {
			setAnimated(FALSE);
		}
		doPrepare();
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		tagDto.put("fields", AOSTagUtils.getMyFields(getFields()));
		tagDto.put("autoLoad", getAutoLoad());
		tagDto.put("url", getUrl());
		tagDto.put("itemSelector", getItemSelector());
		tagDto.put("overItemCls", getOverItemCls());
		tagDto.put("multiSelect", getMultiSelect());
		tagDto.put("onselectionchange", getOnselectionchange());
		tagDto.put("animated", getAnimated());
		tagDto.put("duration", getDuration());
		tagDto.put("idProperty", getIdProperty());
		tagDto.put("onload", getOnload());
		String jspString = mergeFileTemplate(EXTVM + "viewTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		// Items组件处理
		addCur2ParentItems();
		doClear();
		return EVAL_PAGE;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	public void doClear() throws JspException {
		setId(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getFields() {
		return fields;
	}

	public void setFields(String fields) {
		this.fields = fields;
	}

	public String getAutoLoad() {
		return autoLoad;
	}

	public void setAutoLoad(String autoLoad) {
		this.autoLoad = autoLoad;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getItemSelector() {
		return itemSelector;
	}

	public void setItemSelector(String itemSelector) {
		this.itemSelector = itemSelector;
	}

	public String getOverItemCls() {
		return overItemCls;
	}

	public void setOverItemCls(String overItemCls) {
		this.overItemCls = overItemCls;
	}

	public String getMultiSelect() {
		return multiSelect;
	}

	public void setMultiSelect(String multiSelect) {
		this.multiSelect = multiSelect;
	}

	public String getOnselectionchange() {
		return onselectionchange;
	}

	public void setOnselectionchange(String onselectionchange) {
		this.onselectionchange = onselectionchange;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getIdProperty() {
		return idProperty;
	}

	public void setIdProperty(String idProperty) {
		this.idProperty = idProperty;
	}

	public String getAnimated() {
		return animated;
	}

	public void setAnimated(String animated) {
		this.animated = animated;
	}

	public String getOnload() {
		return onload;
	}

	public void setOnload(String onload) {
		this.onload = onload;
	}
}

package cn.osworks.aos.web.tag.impl.ext.layout;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.ContainerTagSupport;

/**
 * <b>Viewport标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-03-06
 */
public class ViewportTag extends ContainerTagSupport {

	private static final long serialVersionUID = 1L;

	// 内部变量，不需要输出为标签属性
	private String centerCmpId;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		setXtype(Xtypes.VIEWPORT);
		resetListenerContainer();
		resetObjInContainerTag();
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
		tagDto.put("centerCmpId", getCenterCmpId());
		String jspString = mergeFileTemplate(EXTVM + "viewportTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
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
		setId(null);
		setCenterCmpId(null);
	}

	/**
	 * 将子组件在Viewport中央对齐
	 * 
	 * @param centerCmpId
	 */
	public void centerIt(String centerCmpId) {
		setCenterCmpId(centerCmpId);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getCenterCmpId() {
		return centerCmpId;
	}

	public void setCenterCmpId(String centerCmpId) {
		this.centerCmpId = centerCmpId;
	}

}

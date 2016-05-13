package cn.osworks.aos.web.tag.impl.ext.general;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.core.model.vo.AfterRenderRegisterVO;
import cn.osworks.aos.web.tag.impl.ext.ButtonTagSupport;
import cn.osworks.aos.web.tag.impl.ext.ComponentTagSupport;


/**
 * <b>Ext Tool标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-03-08
 */
public class ToolTag extends ButtonTagSupport {

	private static final long serialVersionUID = 1L;

	private String type;

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
		tagDto.put("type", getType());
		String jspString = mergeFileTemplate(EXTVM + "toolTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		ComponentTagSupport parentTag = (ComponentTagSupport) getParent();
		AfterRenderRegisterVO afterRenderRegisterVO = new AfterRenderRegisterVO();
		afterRenderRegisterVO.setId(tagDto.getString("id"));
		afterRenderRegisterVO.setType("tool");
		parentTag.addAfterRenderRegister(afterRenderRegisterVO);
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}

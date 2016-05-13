package cn.osworks.aos.web.tag.impl.ext.form;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormPanelTagSupport;


/**
 * <b>FormPanel标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-13
 */
public class FormPanelTag extends FormPanelTagSupport {

	private static final long serialVersionUID = 1L;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		doBorderPrepare();
		doWidthPrepare();
		doCenterIt();
		setXtype(Xtypes.FORMPANEL);
		resetListenerContainer();
		resetObjInContainerTag();
		// 将FormPanel的子组件缺省布局显式设置为column。
		if (AOSUtils.isEmpty(getLayout())) {
			setLayout("column");
		}
		if (AOSUtils.isEmpty(getBodyPadding())) {
			setBodyPadding("5");
		}
		if (AOSUtils.isEmpty(getConstrain())) {
			setConstrain(TRUE);
		}
		/**
		 * FormPanel(anchor)缺省布局的行间距是5,但是如果formPanel使用的column布局的话则无行间距
		 * 这里设置当为coloumn布局时，如果rowSpace为空则自动设置为5。 ？其它布局是否需要特殊处理有待验证
		 * 
		 */
		if (getLayout().equals("column")) {
			if (AOSUtils.isEmpty(getRowSpace())) {
				setRowSpace("5");
			}
		}
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
		String jspString = mergeFileTemplate(EXTVM + "form/formPanelTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
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
		super.doClear();
		setId(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

}

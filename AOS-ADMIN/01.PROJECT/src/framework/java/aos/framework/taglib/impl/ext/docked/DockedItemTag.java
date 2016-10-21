package aos.framework.taglib.impl.ext.docked;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.ext.ButtonTagSupport;
import aos.framework.taglib.impl.ext.ComponentTagSupport;


/**
 * <b>ToolItem标签实现类</b>
 * 
 * @author xiongchun
 * @since 6.0
 * @date 2014-03-06
 */
public class DockedItemTag extends ButtonTagSupport {

	private static final long serialVersionUID = 1L;

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
		//设置按钮缺省高度   tbtext组件的高度不能设置，否则会垂直居中有点bug
		if (AOSUtils.isEmpty(getScale()) && AOSUtils.isEmpty(getHeight()) && !StringUtils.equals(getXtype(),"tbtext")) {
			setHeight("25");
		}
		if (StringUtils.equals(getScale(), "medium")) {
			ComponentTagSupport parentTag = (ComponentTagSupport) getParent();
			if (parentTag instanceof DockedTag) {
				String height = "35";
				parentTag.setHeight(height);
			}
		}
		//设置分隔符的margin tbseparator
		if (StringUtils.equals(getXtype(), "tbseparator") && AOSUtils.isEmpty(getMargin())) {
			setMargin("0 5 0 0");
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
		String jspString = mergeFileTemplate(EXTVM + "dockedItemTag.vm", tagDto);
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
	private void doClear() throws JspException {
		setId(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

}

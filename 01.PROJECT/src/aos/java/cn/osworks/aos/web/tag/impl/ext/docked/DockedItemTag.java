package cn.osworks.aos.web.tag.impl.ext.docked;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.ButtonTagSupport;
import cn.osworks.aos.web.tag.impl.ext.ComponentTagSupport;


/**
 * <b>ToolItem标签实现类</b>
 * 
 * @author OSWorks-XC
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
		if (StringUtils.equals(getScale(), "medium")) {
			ComponentTagSupport parentTag = (ComponentTagSupport) getParent();
			if (parentTag instanceof DockedTag) {
				String curSkin = WebCxt.getCfgByUser(pageContext.getSession(), "skin_");
				String height = "35";
				if (curSkin.equalsIgnoreCase(AOSCons.SKIN_NEPTUNE)) {
					height = "42";
				}
				parentTag.setHeight(height);
			}
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

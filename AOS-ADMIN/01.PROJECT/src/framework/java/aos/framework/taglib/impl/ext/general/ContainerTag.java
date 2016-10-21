package aos.framework.taglib.impl.ext.general;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import aos.framework.core.typewrap.Dto;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.ext.ContainerTagSupport;


/**
 * <b>Ext原生容器类组件实现类</b>
 * 
 * @author xiongchun
 * @since 6.0
 * @date 2014-03-06
 */
public class ContainerTag extends ContainerTagSupport {

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
		setXtype(Xtypes.CONTAINER);
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
		String jspString = mergeFileTemplate(EXTVM + "containerTag.vm", tagDto);
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

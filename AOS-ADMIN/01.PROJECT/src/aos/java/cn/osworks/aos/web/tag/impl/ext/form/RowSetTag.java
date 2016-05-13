package cn.osworks.aos.web.tag.impl.ext.form;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormPanelTagSupport;


/**
 * <b>RowSetTag标签实现类</b>
 * 
 * 用于FormPanel布局，基于FieldSet实现<br>
 * 
 * 提示：rowSet标签基于Ext的FieldSet组件实现，能够完美支持固定列宽和相对列宽的组合布局。
 * 
 * @author OSWorks-XC
 * @date 2014-04-16
 */
public class RowSetTag extends FormPanelTagSupport {

	private static final long serialVersionUID = 1L;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		// 基于FIELDSET实现
		setXtype(Xtypes.FIELDSET);
		resetListenerContainer();
		resetObjInContainerTag();
		// 将FormPanel的子组件缺省布局显式设置为column。
		if (AOSUtils.isEmpty(getLayout())) {
			setLayout("column");
		}
		FormPanelTagSupport parentTag = (FormPanelTagSupport) getParent();
		if ("column".equals(parentTag.getLayout())) {
			// 如果父容器是column将布局
			if (AOSUtils.isEmpty(getColumnWidth())) {
				// 如果当前标签没设置该属性则缺省设置为1
				setColumnWidth("1");
			}
		}
		// 优先使用自己的rowspace属性,自己没设置再继承父亲的属性
		if (AOSUtils.isEmpty(getRowSpace())) {
			// fieldSet标签自己不需要此属性，此属性由其内部具体的表单元素继承使用
			setRowSpace(parentTag.getRowSpace());
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
		String jspString = mergeFileTemplate(EXTVM + "form/rowSetTag.vm", tagDto);
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
		setTotalColWidth(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

}

package cn.osworks.aos.web.tag.impl.ext.form;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormPanelTagSupport;


/**
 * <b>FieldSetTag标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-14
 */
public class FieldSetTag extends FormPanelTagSupport {

	private static final long serialVersionUID = 1L;

	private String checkboxToggle;

	private String checkboxName;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		setXtype(Xtypes.FIELDSET);
		resetListenerContainer();
		resetObjInContainerTag();
		// 设置缺省值
		if (AOSUtils.isEmpty(getCollapsible())) {
			setCollapsible(TRUE);
		}
		// 将FormPanel的子组件缺省布局显式设置为column。
		if (AOSUtils.isEmpty(getLayout())) {
			setLayout("column");
		}

		// FormPanelTagSupport parentTag = (FormPanelTagSupport) getParent();
		// 防止有C标签隔断，尽量不使用getParent
		FormPanelTagSupport parentTag = (FormPanelTagSupport) findAncestorWithClass(this, FormPanelTagSupport.class);
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
		tagDto.put("checkboxToggle", getCheckboxToggle());
		tagDto.put("checkboxName", getCheckboxName());
		String jspString = mergeFileTemplate(EXTVM + "form/fieldSetTag.vm", tagDto);
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

	public String getCheckboxToggle() {
		return checkboxToggle;
	}

	public void setCheckboxToggle(String checkboxToggle) {
		this.checkboxToggle = checkboxToggle;
	}

	public String getCheckboxName() {
		return checkboxName;
	}

	public void setCheckboxName(String checkboxName) {
		this.checkboxName = checkboxName;
	}

}

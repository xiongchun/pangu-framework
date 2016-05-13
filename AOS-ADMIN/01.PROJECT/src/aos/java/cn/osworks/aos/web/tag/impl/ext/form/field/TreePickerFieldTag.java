package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;


/**
 * <b>TreePickerField标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-26
 */
public class TreePickerFieldTag extends FormItemTagSupport {

	private static final long serialVersionUID = 1L;

	private String url;

	private String useArrows = FALSE;

	private String nodeParam;

	private String singleExpand = FALSE;

	private String maxPickerHeight;

	// valuefiled固定为id
	private String displayField = "text";

	// 根节点ID值
	private String rootId = "0";

	private String rootVisible = FALSE;

	private String rootText;

	private String rootIcon;

	// 根节点不会将请求load回来的节点附加属性作为根节点的附加属性，如果需要让根节点有附加属性则需要这里强制附加。
	private String rootAttribute;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		setXtype(Xtypes.APPTREEPICKER);
		resetListenerContainer();
		if (AOSUtils.isEmpty(getRootText())) {
			setRootText("根节点");
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
		tagDto.put("url", getUrl());
		tagDto.put("useArrows", getUseArrows());
		tagDto.put("nodeParam", getNodeParam());
		tagDto.put("maxPickerHeight", getMaxPickerHeight());
		tagDto.put("singleExpand", getSingleExpand());
		tagDto.put("displayField", getDisplayField());
		tagDto.put("rootId", getRootId());
		tagDto.put("rootVisible", getRootVisible());
		tagDto.put("rootText", getRootText());
		tagDto.put("rootIcon", AOSTagUtils.getIcon(getRootIcon(), pageContext));
		tagDto.put("rootAttribute", AOSTagUtils.removeEndComma(getRootAttribute()));
		String jspString = mergeFileTemplate(EXTVM + "form/treePickerFieldTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		super.addTotalColWidth4FormRow();
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUseArrows() {
		return useArrows;
	}

	public void setUseArrows(String useArrows) {
		this.useArrows = useArrows;
	}

	public String getNodeParam() {
		return nodeParam;
	}

	public void setNodeParam(String nodeParam) {
		this.nodeParam = nodeParam;
	}

	public String getSingleExpand() {
		return singleExpand;
	}

	public void setSingleExpand(String singleExpand) {
		this.singleExpand = singleExpand;
	}

	public String getMaxPickerHeight() {
		return maxPickerHeight;
	}

	public void setMaxPickerHeight(String maxPickerHeight) {
		this.maxPickerHeight = maxPickerHeight;
	}

	public String getDisplayField() {
		return displayField;
	}

	public void setDisplayField(String displayField) {
		this.displayField = displayField;
	}

	public String getRootId() {
		return rootId;
	}

	public void setRootId(String rootId) {
		this.rootId = rootId;
	}

	public String getRootVisible() {
		return rootVisible;
	}

	public void setRootVisible(String rootVisible) {
		this.rootVisible = rootVisible;
	}

	public String getRootText() {
		return rootText;
	}

	public void setRootText(String rootText) {
		this.rootText = rootText;
	}

	public String getRootIcon() {
		return rootIcon;
	}

	public void setRootIcon(String rootIcon) {
		this.rootIcon = rootIcon;
	}

	public String getRootAttribute() {
		return rootAttribute;
	}

	public void setRootAttribute(String rootAttribute) {
		this.rootAttribute = rootAttribute;
	}

}

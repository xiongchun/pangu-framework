package cn.osworks.aos.web.tag.impl.ext.form.field;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSListUtils;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.dao.po.Aos_sys_dicPO;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.FormItemTagSupport;

import com.google.common.collect.Lists;

/**
 * <b>ComboBoxField标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-04-28
 */
public class ComboBoxFieldTag extends FormItemTagSupport {

	private static final long serialVersionUID = 1L;

	private String multiSelect;

	private String forceSelection = TRUE;

	private String editable = FALSE;

	private String typeAhead;

	private String queryMode;

	private String displayField = "display";

	private String valueField = "value";

	private String url;

	private String fields = "[ 'value', 'display', 'c', 'd']";

	private String dicField;

	private String dicFilter;
	//字典对照的数据类型，缺省为char，可选number。
	private String dicDataType="char";

	// 内部变量,不暴露给JSP
	private List<Dto> optionDtos = new ArrayList<Dto>();

	public void addDataString(Dto optionDto) {
		if (optionDtos == null) {
			optionDtos = new ArrayList<Dto>();
		}
		optionDtos.add(optionDto);
	}

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	public void doPrepare() throws JspException {
		super.doPrepare();
		setXtype(Xtypes.COMBOBOX);
		resetListenerContainer();
		setOptionDtos(null);
		// 如果设置了url属性且queryMode属性没有被显式设置，则将querymode置为remote
		if (AOSUtils.isNotEmpty(getUrl())) {
			if (AOSUtils.isEmpty(getQueryMode())) {
				setQueryMode("remote");
			}
		}else {
			setQueryMode("local");
		}
		if (AOSUtils.isEmpty(getEmptyText())) {
			if (!StringUtils.equalsIgnoreCase(getReadOnly(), TRUE)&&!StringUtils.equalsIgnoreCase(getDisabled(), TRUE)) {
				setEmptyText(WebCxt.getCfgOfDB("combobox_emptytext"));
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
		// hiddenName和name使用同一个值,hiddenName不暴露给JSP设置
		tagDto.put("hiddenName", getName());
		tagDto.put("multiSelect", getMultiSelect());
		tagDto.put("forceSelection", getForceSelection());
		tagDto.put("editable", getEditable());
		tagDto.put("typeAhead", getTypeAhead());
		tagDto.put("queryMode", getQueryMode());
		tagDto.put("displayField", getDisplayField());
		tagDto.put("valueField", getValueField());
		tagDto.put("fields", getFields());
		tagDto.put("url", getUrl());
		if (getQueryMode().equals("local")) {
			if (AOSUtils.isNotEmpty(getDicField())) {
				// 优先使用数据字典数据源
				tagDto.put("jsonString", getDicListJson());
			} else {
				// 使用<option>标签组装下拉数据源
				tagDto.put("jsonString", AOSJson.toJson(getOptionDtos()));
			}
		}
		String jspString = mergeFileTemplate(EXTVM + "form/comboBoxField.vm", tagDto);
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
	 * 处理字典数据源
	 * 
	 * @return
	 */
	private String getDicListJson() {
		List<Dto> dicList = Lists.newArrayList();
		List<Aos_sys_dicPO> aos_sys_dicPOs = WebCxt.getDicList(getDicField());
		if (AOSUtils.isNotEmpty(dicFilter)) {
			String expression = getJqlExpression(dicFilter);
			if (StringUtils.startsWith(dicFilter, "!")) {
				// 排它过滤
				String jql = AOSUtils.merge("SELECT * FROM :AOSList WHERE code_ NOT IN ({0})", expression);
				aos_sys_dicPOs = AOSListUtils.select(aos_sys_dicPOs, Aos_sys_dicPO.class, jql, null);
			} else {
				// 选择过滤
				String jql = AOSUtils.merge("SELECT * FROM :AOSList WHERE code_ IN ({0})", expression);
				aos_sys_dicPOs = AOSListUtils.select(aos_sys_dicPOs, Aos_sys_dicPO.class, jql, null);
			}
		}
		// 过滤处理(支持选择过滤和排它过滤)
		for (Aos_sys_dicPO aos_sys_dicPO : aos_sys_dicPOs) {
			Dto dto = Dtos.newDto();
			if (StringUtils.equalsIgnoreCase(getDicDataType(), "number")) {
				dto.put("value", Integer.valueOf(aos_sys_dicPO.getCode_()));
			}else {
				dto.put("value", aos_sys_dicPO.getCode_());
			}
			dto.put("display", aos_sys_dicPO.getDesc_());
			dicList.add(dto);
		}
		return AOSJson.toJson(dicList);
	}

	/**
	 * 转为JQL条件的表达式
	 * 
	 * @return
	 */
	private String getJqlExpression(String inString) {
		String outString = "";
		if (StringUtils.startsWith(inString, "!")) {
			inString = StringUtils.substringAfter(inString, "!");
		}
		String[] ins = inString.split(",");
		for (String in : ins) {
			outString = outString + AOSTagUtils.padQuota(in) + ",";
		}
		return StringUtils.substringBeforeLast(outString, ",");
	}

	/**
	 * 释放资源
	 */
	public void release() {
		setEmptyText(null);
		super.release();
	}

	public String getMultiSelect() {
		return multiSelect;
	}

	public void setMultiSelect(String multiSelect) {
		this.multiSelect = multiSelect;
	}

	public String getForceSelection() {
		return forceSelection;
	}

	public void setForceSelection(String forceSelection) {
		this.forceSelection = forceSelection;
	}

	public String getEditable() {
		return editable;
	}

	public void setEditable(String editable) {
		this.editable = editable;
	}

	public String getTypeAhead() {
		return typeAhead;
	}

	public void setTypeAhead(String typeAhead) {
		this.typeAhead = typeAhead;
	}

	public String getQueryMode() {
		return queryMode;
	}

	public void setQueryMode(String queryMode) {
		this.queryMode = queryMode;
	}

	public String getDisplayField() {
		return displayField;
	}

	public void setDisplayField(String displayField) {
		this.displayField = displayField;
	}

	public String getValueField() {
		return valueField;
	}

	public void setValueField(String valueField) {
		this.valueField = valueField;
	}

	public String getFields() {
		return fields;
	}

	public void setFields(String fields) {
		this.fields = fields;
	}

	public List<Dto> getOptionDtos() {
		return optionDtos;
	}

	public void setOptionDtos(List<Dto> optionDtos) {
		this.optionDtos = optionDtos;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDicField() {
		return dicField;
	}

	public void setDicField(String dicField) {
		this.dicField = dicField;
	}

	public String getDicFilter() {
		return dicFilter;
	}

	public void setDicFilter(String dicFilter) {
		this.dicFilter = dicFilter;
	}

	public String getDicDataType() {
		return dicDataType;
	}

	public void setDicDataType(String dicDataType) {
		this.dicDataType = dicDataType;
	}

}

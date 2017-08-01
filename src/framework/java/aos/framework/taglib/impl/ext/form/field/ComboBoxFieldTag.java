package aos.framework.taglib.impl.ext.form.field;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCxt;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSListUtils;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.po.AosDicPO;
import aos.framework.taglib.asset.AOSTagUtils;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.ext.FormItemTagSupport;

/**
 * <b>ComboBoxField标签实现类</b>
 * 
 * @author xiongchun
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
	
	private String selectAll = FALSE;
	
	private String dicDataType;

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
				setEmptyText(AOSCxt.getParam("combobox_emptytext"));
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
		tagDto.put("url", AOSTagUtils.getMyUrl(getUrl()));
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
		List<AosDicPO> aos_dicPOs = AOSCxt.getDicList(getDicField());
		if (AOSUtils.isNotEmpty(dicFilter)) {
			String expression = getJqlExpression(dicFilter);
			if (StringUtils.startsWith(dicFilter, "!")) {
				// 排它过滤
				String jql = AOSUtils.merge("SELECT * FROM :AOSList WHERE code NOT IN ({0})", expression);
				aos_dicPOs = AOSListUtils.select(aos_dicPOs, AosDicPO.class, jql, null);
			} else {
				// 选择过滤
				String jql = AOSUtils.merge("SELECT * FROM :AOSList WHERE code IN ({0})", expression);
				aos_dicPOs = AOSListUtils.select(aos_dicPOs, AosDicPO.class, jql, null);
			}
		}
		// 类型处理
		for (AosDicPO aos_dic_optionsPO : aos_dicPOs) {
			Dto dto = Dtos.newDto();
			//特殊处理：若字典数据类型为数值型，则form.loadRecord()；的时候，下拉框不能被正常转换。所以这里尽最大努力将字符数值的代码转换为数值类型。
			if (StringUtils.equalsIgnoreCase(getDicDataType(), "number")) {
				dto.put("value", Integer.valueOf(aos_dic_optionsPO.getCode()));
			}else{
				dto.put("value", aos_dic_optionsPO.getCode());
			}
			dto.put("display", aos_dic_optionsPO.getDic_desc());
			dicList.add(dto);
		}
		//只对数据字典源的下拉项有效的
		if (StringUtils.equals(getSelectAll(), TRUE)) {
			Dto dto = Dtos.newDto();
			dto.put("value", "");
			dto.put("display", "全部");
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

	public String getSelectAll() {
		return selectAll;
	}

	public void setSelectAll(String selectAll) {
		this.selectAll = selectAll;
	}

	public String getDicDataType() {
		return dicDataType;
	}

	public void setDicDataType(String dicDataType) {
		this.dicDataType = dicDataType;
	}

}

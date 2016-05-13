package cn.osworks.aos.web.tag.impl.ext;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.impl.ext.form.field.CheckboxFieldTag;
import cn.osworks.aos.web.tag.impl.ext.form.field.RadioboxFieldTag;
import cn.osworks.aos.web.tag.impl.ext.grid.ColumnTag;

import javax.servlet.jsp.JspException;
import java.math.BigDecimal;

/**
 * <b>Ext 表单元素基类</b>
 *
 * @author OSWorks-XC
 * @date 2014-02-06
 * @since 6.0
 */
public class FormItemTagSupport extends ComponentTagSupport {

    private static final long serialVersionUID = 1L;

    private String fieldLabel;

    private String name;

    private String value;

    private String emptyText;

    private String anchor;

    private String labelWidth;

    private String labelAlign;

    private String labelSeparator;

    private String labelPad;

    private String allowBlank;

    private String tabIndex;

    private String inputType;

    private String readOnly;

    private String vtype;

    private String vtypeText;

    private String regex;

    private String regexText;

    private String xtype;

    private String editable;

    private String msgTarget;

    private String hideTrigger;

    private String star = TRUE; // 非空字段是否需要标注

    private String selectOnFocus;

    private String onchang;

    private String onkeydown;

    private String onkeyup;

    private String onfocus;

    private String onblur;

    // 仅针对combobox、treepicker系列有效
    private String onselect;

    private String onenterkey;

    private String onspecialkey;

    private String instance = TRUE;

    // 内部变量
    // 表单元素输入框区域样式 fieldCls属性：去掉输入框内区域的立体效果。选择框不能应用此样式。
    private String fieldCls = "app-form-fieldcls";

    /**
     * 预处理和标签逻辑校验
     *
     * @throws JspException
     */
    public void doPrepare() throws JspException {
        // 如果父标签是表格列，则不对其进行实例化
        if (getParent() instanceof ColumnTag) {
            setInstance(FALSE);
            ColumnTag parentTag = (ColumnTag) getParent();
            parentTag.setEditor2(getMyId() + "_cfg");
        }
    }

    /**
     * 将属性打包
     *
     * @param tagDto
     * @return
     */
    protected Dto pkgProperties(Dto tagDto) {
        super.pkgProperties(tagDto);
        tagDto.put("fieldLabel", getFieldLabel());
        tagDto.put("name", getName());
        tagDto.put("value", getValue());
        tagDto.put("emptyText", getEmptyText());
        tagDto.put("anchor", getAnchor());
        tagDto.put("labelWidth", getLabelWidth());
        tagDto.put("labelAlign", getLabelAlign());
        tagDto.put("labelSeparator", getLabelSeparator());
        tagDto.put("labelPad", getLabelPad());
        tagDto.put("allowBlank", getAllowBlank());
        tagDto.put("tabIndex", getTabIndex());
        tagDto.put("inputType", getInputType());
        tagDto.put("readOnly", getReadOnly());
        tagDto.put("vtype", getVtype());
        tagDto.put("vtypeText", getVtypeText());
        tagDto.put("regex", getRegex());
        tagDto.put("regexText", getRegexText());
        tagDto.put("editable", getEditable());
        tagDto.put("msgTarget", getMsgTarget());
        tagDto.put("hideTrigger", getHideTrigger());
        tagDto.put("star", getStar());
        tagDto.put("selectOnFocus", getSelectOnFocus());
        tagDto.put("onchang", getOnchang());
        tagDto.put("onkeydown", getOnkeydown());
        tagDto.put("onkeyup", getOnkeyup());
        tagDto.put("onfocus", getOnfocus());
        tagDto.put("onblur", getOnblur());
        tagDto.put("onselect", getOnselect());
        tagDto.put("onenterkey", getOnenterkey());
        tagDto.put("onspecialkey", getOnspecialkey());
        tagDto.put("instance", getInstance());
        if (StringUtils.equalsIgnoreCase(getAllowBlank(), FALSE)) {
            String blankText = getFieldLabel() == null ? "" : getFieldLabel();
            blankText = blankText + "不能为空";
            tagDto.put("blankText", AOSUtils.trimAll(blankText));
        }
        if (this instanceof CheckboxFieldTag || this instanceof RadioboxFieldTag) {
            setFieldCls("null");
        }
        tagDto.put("fieldCls", getFieldCls());

        if (AOSTagUtils.getParent(getParent()) instanceof FormPanelTagSupport) {
            FormPanelTagSupport parentTag = (FormPanelTagSupport) AOSTagUtils.getParent(getParent());
            if ("column".equals(parentTag.getLayout())) {
                tagDto.put("parentRowSpace", parentTag.getRowSpace());
            } else {
                if (AOSUtils.isNotEmpty(parentTag.getRowSpace())) {
                    BigDecimal rowspace = new BigDecimal(parentTag.getRowSpace());
                    // anchor缺省就有5像素的布局,如果<5还要返回的话其实布局高度就变成了5+X了
                    if (rowspace.doubleValue() > 5) {
                        tagDto.put("parentRowSpace", parentTag.getRowSpace());
                    }
                }
            }
        }
        return tagDto;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getEmptyText() {
        return emptyText;
    }

    public void setEmptyText(String emptyText) {
        this.emptyText = emptyText;
    }

    public String getFieldLabel() {
        return fieldLabel;
    }

    public void setFieldLabel(String fieldLabel) {
        this.fieldLabel = fieldLabel;
    }

    public String getAnchor() {
        return anchor;
    }

    public void setAnchor(String anchor) {
        this.anchor = anchor;
    }

    public String getLabelWidth() {
        return labelWidth;
    }

    public void setLabelWidth(String labelWidth) {
        this.labelWidth = labelWidth;
    }

    public String getAllowBlank() {
        return allowBlank;
    }

    public void setAllowBlank(String allowBlank) {
        this.allowBlank = allowBlank;
    }

    public String getTabIndex() {
        return tabIndex;
    }

    public void setTabIndex(String tabIndex) {
        this.tabIndex = tabIndex;
    }

    public String getInputType() {
        return inputType;
    }

    public void setInputType(String inputType) {
        this.inputType = inputType;
    }

    public String getReadOnly() {
        return readOnly;
    }

    public void setReadOnly(String readOnly) {
        this.readOnly = readOnly;
    }

    public String getVtype() {
        return vtype;
    }

    public void setVtype(String vtype) {
        this.vtype = vtype;
    }

    public String getRegex() {
        return regex;
    }

    public void setRegex(String regex) {
        this.regex = regex;
    }

    public String getRegexText() {
        return regexText;
    }

    public void setRegexText(String regexText) {
        this.regexText = regexText;
    }

    public String getVtypeText() {
        return vtypeText;
    }

    public void setVtypeText(String vtypeText) {
        this.vtypeText = vtypeText;
    }

    public String getXtype() {
        return xtype;
    }

    public void setXtype(String xtype) {
        this.xtype = xtype;
    }

    public String getLabelAlign() {
        return labelAlign;
    }

    public void setLabelAlign(String labelAlign) {
        this.labelAlign = labelAlign;
    }

    public String getLabelSeparator() {
        return labelSeparator;
    }

    public void setLabelSeparator(String labelSeparator) {
        this.labelSeparator = labelSeparator;
    }

    public String getEditable() {
        return editable;
    }

    public void setEditable(String editable) {
        this.editable = editable;
    }

    public String getMsgTarget() {
        return msgTarget;
    }

    public void setMsgTarget(String msgTarget) {
        this.msgTarget = msgTarget;
    }

    public String getLabelPad() {
        return labelPad;
    }

    public void setLabelPad(String labelPad) {
        this.labelPad = labelPad;
    }

    public String getHideTrigger() {
        return hideTrigger;
    }

    public void setHideTrigger(String hideTrigger) {
        this.hideTrigger = hideTrigger;
    }

    public String getOnchang() {
        return onchang;
    }

    public void setOnchang(String onchang) {
        this.onchang = onchang;
    }

    public String getOnkeydown() {
        return onkeydown;
    }

    public void setOnkeydown(String onkeydown) {
        this.onkeydown = onkeydown;
    }

    public String getOnfocus() {
        return onfocus;
    }

    public void setOnfocus(String onfocus) {
        this.onfocus = onfocus;
    }

    public String getOnblur() {
        return onblur;
    }

    public void setOnblur(String onblur) {
        this.onblur = onblur;
    }

    public String getOnenterkey() {
        return onenterkey;
    }

    public void setOnenterkey(String onenterkey) {
        this.onenterkey = onenterkey;
    }

    public String getOnselect() {
        return onselect;
    }

    public void setOnselect(String onselect) {
        this.onselect = onselect;
    }

    public String getOnkeyup() {
        return onkeyup;
    }

    public void setOnkeyup(String onkeyup) {
        this.onkeyup = onkeyup;
    }

    public String getOnspecialkey() {
        return onspecialkey;
    }

    public void setOnspecialkey(String onspecialkey) {
        this.onspecialkey = onspecialkey;
    }

    public String getInstance() {
        return instance;
    }

    public void setInstance(String instance) {
        this.instance = instance;
    }

    public String getFieldCls() {
        return fieldCls;
    }

    public void setFieldCls(String fieldCls) {
        this.fieldCls = fieldCls;
    }

    public String getStar() {
        return star;
    }

    public void setStar(String star) {
        this.star = star;
    }

    public String getSelectOnFocus() {
        return selectOnFocus;
    }

    public void setSelectOnFocus(String selectOnFocus) {
        this.selectOnFocus = selectOnFocus;
    }
}

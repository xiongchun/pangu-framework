package aos.framework.taglib.impl.ext.grid;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import com.google.common.collect.Lists;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.impl.HashDto;
import aos.framework.core.utils.AOSCxt;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.po.AosDicPO;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.impl.ext.ComponentTagSupport;
import aos.framework.taglib.impl.ext.tree.TreePanelTag;


/**
 * <b>Ext 表格通用列标签</b>
 * 
 * @author xiongchun
 * @date 2014-02-06
 */
public class ColumnTag extends ComponentTagSupport {

	private static final long serialVersionUID = 1L;

	private String width;

	private String header;

	private String dataIndex;

	private String hidden;

	private String hideable;

	private String sortable;

	private String flex;

	private String format;

	private String type;

	private String tpl;

	private String defaultValue;

	private String align;

	private String rendererFn;

	private String editor;

	private String editor2;

	private String lockable;

	private String locked;

	private String celltip;
	
	private String dataType = "char";

	private String rendererField;
	
	private String fixedWidth;
	
	private String summaryType;
	
	private String summaryRenderer;

	private List<Dto> actionDtos;
	
	// 内部变量,不暴露给JSP。
	private List<Dto> columnDtos = new ArrayList<Dto>();
	
	/**
	 * 提供给Column标签调用
	 * 
	 * @param columnDto
	 */
	public void addColumnDto(Dto columnDto) {
		if (columnDtos == null) {
			columnDtos = Lists.newArrayList();
		}
		columnDtos.add(columnDto);
	}

	/**
	 * 提供给Action标签调用
	 * 
	 * @param actionDto
	 */
	public void addActionDto(Dto actionDto) {
		if (actionDtos == null) {
			actionDtos = new ArrayList<Dto>();
		}
		actionDtos.add(actionDto);
	}

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		resetListenerContainer();
		setActionDtos(null);
		// 处理Xtype
		if ("date".equalsIgnoreCase(getType())) {
			setXtype(Xtypes.DATECOLUMN);
		} else if ("number".equalsIgnoreCase(getType())) {
			setXtype(Xtypes.NUMBERCOLUMN);
		} else if ("template".equalsIgnoreCase(getType())) {
			setXtype(Xtypes.TEMPLATECOLUMN);
		} else if ("rowno".equalsIgnoreCase(getType())) {
			setXtype(Xtypes.ROWNUMBERER);
		} else if ("check".equalsIgnoreCase(getType())) {
			setXtype(Xtypes.CHECKCOLUMN);
		} else if ("action".equalsIgnoreCase(getType())) {
			setXtype(Xtypes.ACTIONCOLUMN);
		} else if ("text".equalsIgnoreCase(getType())) {
			setXtype(Xtypes.GRIDCOLUMN);
		} else if ("tree".equalsIgnoreCase(getType())) {
			setXtype(Xtypes.TREECOLUMN);
		}  else {
			setXtype(Xtypes.GRIDCOLUMN);
		}
		
		if ("group".equalsIgnoreCase(getType())) {
			//禁用表格的隐藏列功能
			GridPanelTag gridPanelTag = (GridPanelTag)findAncestorWithClass(this, GridPanelTag.class);
			gridPanelTag.setEnableColumnHide(FALSE);
		}
		
		if ("rowno".equalsIgnoreCase(getType()) || "check".equalsIgnoreCase(getType())) {
			if (AOSUtils.isEmpty(getWidth())) {
				// 如果是行号列，则设置缺省值30。(可容纳3位大小大行号)
				setWidth("30");
			}
		}
		// 设置表格列缺省对其模式
		if (AOSUtils.isEmpty(getAlign())) {
			if ("number".equalsIgnoreCase(getType())) {
				// 显式声明为数字的列缺省强制右对齐
				setAlign("right");
			} else if ("tree".equalsIgnoreCase(getType())) {
				// 表格树列必须左对齐，否则树节点将错位
				setAlign("left");
			} else {
				//常规列
				String grid_column_algin = AOSCxt.getParam("grid_column_algin");
				setAlign(grid_column_algin);
			}
		}
		//根据设置缺省宽度
		if (AOSUtils.isNotEmpty(getFixedWidth())) {
			setMinWidth(getFixedWidth());
			setMaxWidth(getFixedWidth());
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
		// 构造Grid的columns属性
		Dto columnDto = new HashDto();
		super.pkgProperties(columnDto);
		columnDto.put("width", getWidth());
		columnDto.put("header", getHeader());
		columnDto.put("dataIndex", getDataIndex());
		columnDto.put("hidden", getHidden());
		columnDto.put("hideable", getHideable());
		columnDto.put("sortable", getSortable());
		columnDto.put("flex", getFlex());
		columnDto.put("format", getFormat());
		columnDto.put("type", getType());
		columnDto.put("tpl", getTpl());
		columnDto.put("align", getAlign());
		columnDto.put("rendererFn", getRendererFn());
		columnDto.put("editor", getEditor());
		columnDto.put("editor2", getEditor2());
		columnDto.put("lockable", getLockable());
		columnDto.put("locked", getLocked());
		columnDto.put("celltip", getCelltip());
		columnDto.put("dataType", getDataType());
		columnDto.put("rendererField", getRendererField());
		columnDto.put("actionDtos", getActionDtos());
		columnDto.put("summaryType", getSummaryType());
		columnDto.put("summaryRenderer", getSummaryRenderer());
		columnDto.put("columns", getColumnDtos());
		if (AOSUtils.isNotEmpty(getRendererField())) {
			List<AosDicPO> aos_dicPOs= AOSCxt.getDicList(getRendererField());
			columnDto.put("dicList", aos_dicPOs);
		}
		if(getParent() instanceof ColumnTag){
			ColumnTag parentTag = (ColumnTag) getParent();
			parentTag.addColumnDto(columnDto);
		}else if (getParent() instanceof GridPanelTag) {
			// Grid
			GridPanelTag parentTag = (GridPanelTag) getParent();
			parentTag.addColumnDto(columnDto);
		} else if (getParent() instanceof TreePanelTag) {
			// TreeGrid
			TreePanelTag parentTag = (TreePanelTag) getParent();
			parentTag.addColumnDto(columnDto);
			// 根据有无Column列将父标签标自动记为TreeGrid
			parentTag.setTreegrid(TRUE);
		}

		// 值域列才构造field对象
		if (AOSUtils.isNotEmpty(getDataIndex())) {
			Dto fieldDto = new HashDto();
			fieldDto.put("name", getDataIndex());
			fieldDto.put("defaultValue", getDefaultValue());
			fieldDto.put("type", getType());
			if (getParent() instanceof TreePanelTag) {
				// TreeGrid
				TreePanelTag parentTag = (TreePanelTag) getParent();
				parentTag.addFieldDto(fieldDto);
			} else {
				// gridpaneltag或者columntag
				//获取靠得最近的一个符合条件的父标签返回。
				GridPanelTag gridPanelTag = (GridPanelTag)findAncestorWithClass(this, GridPanelTag.class);
				gridPanelTag.addFieldDto(fieldDto);
			}
		}

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
		setWidth(null);
		setAlign(null);
		setRendererField(null);
		setFixedWidth(null);
		setColumnDtos(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getDataIndex() {
		return dataIndex;
	}

	public void setDataIndex(String dataIndex) {
		this.dataIndex = dataIndex;
	}

	public String getHidden() {
		return hidden;
	}

	public void setHidden(String hidden) {
		this.hidden = hidden;
	}

	public String getHideable() {
		return hideable;
	}

	public void setHideable(String hideable) {
		this.hideable = hideable;
	}

	public String getSortable() {
		return sortable;
	}

	public void setSortable(String sortable) {
		this.sortable = sortable;
	}

	public String getFlex() {
		return flex;
	}

	public void setFlex(String flex) {
		this.flex = flex;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTpl() {
		return tpl;
	}

	public void setTpl(String tpl) {
		this.tpl = tpl;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public String getRendererFn() {
		return rendererFn;
	}

	public void setRendererFn(String rendererFn) {
		this.rendererFn = rendererFn;
	}

	public String getRendererField() {
		return rendererField;
	}

	public void setRendererField(String rendererField) {
		this.rendererField = rendererField;
	}

	public List<Dto> getActionDtos() {
		return actionDtos;
	}

	public void setActionDtos(List<Dto> actionDtos) {
		this.actionDtos = actionDtos;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getEditor2() {
		return editor2;
	}

	public void setEditor2(String editor2) {
		this.editor2 = editor2;
	}

	public String getLockable() {
		return lockable;
	}

	public void setLockable(String lockable) {
		this.lockable = lockable;
	}

	public String getLocked() {
		return locked;
	}

	public void setLocked(String locked) {
		this.locked = locked;
	}

	public String getCelltip() {
		return celltip;
	}

	public void setCelltip(String celltip) {
		this.celltip = celltip;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getFixedWidth() {
		return fixedWidth;
	}

	public void setFixedWidth(String fixedWidth) {
		this.fixedWidth = fixedWidth;
	}

	public String getSummaryType() {
		return summaryType;
	}

	public void setSummaryType(String summaryType) {
		this.summaryType = summaryType;
	}

	public String getSummaryRenderer() {
		return summaryRenderer;
	}

	public void setSummaryRenderer(String summaryRenderer) {
		this.summaryRenderer = summaryRenderer;
	}

	public List<Dto> getColumnDtos() {
		return columnDtos;
	}

	public void setColumnDtos(List<Dto> columnDtos) {
		this.columnDtos = columnDtos;
	}

}

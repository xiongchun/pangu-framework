package cn.osworks.aos.web.tag.impl.ext.tree;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.PanelTagSupport;
import cn.osworks.aos.web.tag.impl.ext.general.OnReadyTag;
import cn.osworks.aos.web.tag.impl.ext.layout.ViewportTag;


/**
 * <b>TreePanel标签实现类</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
public class TreePanelTag extends PanelTagSupport {

	private static final long serialVersionUID = 1L;

	private String url;

	private String rootVisible = TRUE;

	// 如果想要初始化时候不load树数据，则需要设置为false。然后在需要load的时候调用根节点的expand()方法，就会触发load()。
	private String rootExpanded = TRUE;

	// 控制根节点是否出现复选框及其选中状态。
	private String rootChecked;

	private String useArrows = TRUE;

	private String expandAll;

	private String lines;

	private String nodeParam;

	private String rootId;

	private String rootText;

	// 复选框是否支持级联选择模式。可选：true|false。缺省：false。
	private String cascade = FALSE;

	private String rootIcon;

	private String expandPath;

	private String singleExpand;

	// 配合node标签生成本地数据源
	private String rootJson;

	private String enableLocking;

	private String onitemclick;

	private String onitemdblclick;

	private String onselectionchange;

	private String columnLines;

	private String rowLines;

	// 根节点不会将请求load回来的节点附加属性作为根节点的附加属性，如果需要让根节点有附加属性则需要这里强制附加。
	private String rootAttribute;

	// 单击、双击进行节点的展开和收缩操作
	private String singleClick = TRUE;

	// 内部变量,不暴露给JSP,供treepanel.vm使用。
	private String treegrid;

	// 内部变量,不暴露给JSP Store的fields属性,包含<Ext.data.Field>对象。
	private List<Dto> fieldDtos = new ArrayList<Dto>();

	// 内部变量,不暴露给JSP。
	private List<Dto> columnDtos = new ArrayList<Dto>();

	/**
	 * 提供给Column标签调用
	 * 
	 * @param fieldDto
	 */
	public void addFieldDto(Dto fieldDto) {
		if (fieldDtos == null) {
			fieldDtos = new ArrayList<Dto>();
		}
		fieldDtos.add(fieldDto);
	}

	/**
	 * 提供给Column标签调用
	 * 
	 * @param fieldDto
	 */
	public void addColumnDto(Dto columnDto) {
		if (columnDtos == null) {
			columnDtos = new ArrayList<Dto>();
		}
		columnDtos.add(columnDto);
	}

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		doBorderPrepare();
		doWidthPrepare();
		doCenterIt();
		setXtype(Xtypes.TREEPANEL);
		resetListenerContainer();
		// 树UI的动画效果不理想，所以缺省禁用动画
		if (AOSUtils.isEmpty(getAnimate())) {
			setAnimate(FALSE);
		}
		// 这2个属性是互斥的
		if (FALSE.equalsIgnoreCase(getLines())) {
			setUseArrows(null);
		}
		// 如果是异步树
		if (AOSUtils.isNotEmpty(getUrl())) {
			if (AOSUtils.isEmpty(getRootId())) {
				setRootId("0");
			}
			if (AOSUtils.isEmpty(getRootText())) {
				setRootText("根节点");
			}
		}
		if (AOSUtils.isEmpty(getBorder())) {
			if (getParent() instanceof ViewportTag) {
				setBorder(FALSE);
			}
		}
		setFieldDtos(null);
		setColumnDtos(null);
		// 通知onready标签引入依赖资源
		OnReadyTag onReadyTag = (OnReadyTag) findAncestorWithClass(this, OnReadyTag.class);
		onReadyTag.setTreePicker(TRUE);
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
		tagDto.put("rootVisible", getRootVisible());
		tagDto.put("rootExpanded", getRootExpanded());
		tagDto.put("rootChecked", getRootChecked());
		tagDto.put("useArrows", getUseArrows());
		tagDto.put("expandAll", getExpandAll());
		// Node标签生成的树数据模型
		tagDto.put("rootJson", getRootJson());
		tagDto.put("lines", getLines());
		tagDto.put("nodeParam", getNodeParam());
		tagDto.put("rootId", getRootId());
		tagDto.put("rootText", getRootText());
		tagDto.put("cascade", getCascade());
		tagDto.put("rootIcon", AOSTagUtils.getIcon(getRootIcon(), pageContext));
		tagDto.put("expandPath", getExpandPath());
		tagDto.put("singleExpand", getSingleExpand());
		tagDto.put("enableLocking", getEnableLocking());
		tagDto.put("onitemclick", getOnitemclick());
		tagDto.put("onitemdblclick", getOnitemdblclick());
		tagDto.put("onselectionchange", getOnselectionchange());
		tagDto.put("columnLines", getColumnLines());
		tagDto.put("singleClick", getSingleClick());
		tagDto.put("treegrid", getTreegrid());
		tagDto.put("fields", getFieldDtos());
		tagDto.put("columns", getColumnDtos());
		if (TRUE.equals(getTreegrid())) {
			setRowLines(TRUE);
		}
		tagDto.put("rowLines", getRowLines());
		tagDto.put("rootAttribute", AOSTagUtils.removeEndComma(getRootAttribute()));
		String jspString = mergeFileTemplate(EXTVM + "tree/treePanelTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		// Items组件处理
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRootVisible() {
		return rootVisible;
	}

	public void setRootVisible(String rootVisible) {
		this.rootVisible = rootVisible;
	}

	public String getUseArrows() {
		return useArrows;
	}

	public void setUseArrows(String useArrows) {
		this.useArrows = useArrows;
	}

	public String getExpandAll() {
		return expandAll;
	}

	public void setExpandAll(String expandAll) {
		this.expandAll = expandAll;
	}

	public String getRootJson() {
		return rootJson;
	}

	public void setRootJson(String rootJson) {
		this.rootJson = rootJson;
	}

	public String getLines() {
		return lines;
	}

	public void setLines(String lines) {
		this.lines = lines;
	}

	public String getNodeParam() {
		return nodeParam;
	}

	public void setNodeParam(String nodeParam) {
		this.nodeParam = nodeParam;
	}

	public String getRootId() {
		return rootId;
	}

	public void setRootId(String rootId) {
		this.rootId = rootId;
	}

	public String getRootText() {
		return rootText;
	}

	public void setRootText(String rootText) {
		this.rootText = rootText;
	}

	public String getExpandPath() {
		return expandPath;
	}

	public void setExpandPath(String expandPath) {
		this.expandPath = expandPath;
	}

	public String getSingleExpand() {
		return singleExpand;
	}

	public void setSingleExpand(String singleExpand) {
		this.singleExpand = singleExpand;
	}

	public String getEnableLocking() {
		return enableLocking;
	}

	public void setEnableLocking(String enableLocking) {
		this.enableLocking = enableLocking;
	}

	public String getTreegrid() {
		return treegrid;
	}

	public void setTreegrid(String treegrid) {
		this.treegrid = treegrid;
	}

	public List<Dto> getFieldDtos() {
		return fieldDtos;
	}

	public void setFieldDtos(List<Dto> fieldDtos) {
		this.fieldDtos = fieldDtos;
	}

	public List<Dto> getColumnDtos() {
		return columnDtos;
	}

	public void setColumnDtos(List<Dto> columnDtos) {
		this.columnDtos = columnDtos;
	}

	public String getOnitemclick() {
		return onitemclick;
	}

	public void setOnitemclick(String onitemclick) {
		this.onitemclick = onitemclick;
	}

	public String getSingleClick() {
		return singleClick;
	}

	public void setSingleClick(String singleClick) {
		this.singleClick = singleClick;
	}

	public String getColumnLines() {
		return columnLines;
	}

	public void setColumnLines(String columnLines) {
		this.columnLines = columnLines;
	}

	public String getRowLines() {
		return rowLines;
	}

	public void setRowLines(String rowLines) {
		this.rowLines = rowLines;
	}

	public String getRootIcon() {
		return rootIcon;
	}

	public void setRootIcon(String rootIcon) {
		this.rootIcon = rootIcon;
	}

	public String getCascade() {
		return cascade;
	}

	public void setCascade(String cascade) {
		this.cascade = cascade;
	}

	public String getRootExpanded() {
		return rootExpanded;
	}

	public void setRootExpanded(String rootExpanded) {
		this.rootExpanded = rootExpanded;
	}

	public String getRootChecked() {
		return rootChecked;
	}

	public void setRootChecked(String rootChecked) {
		this.rootChecked = rootChecked;
	}

	public String getOnselectionchange() {
		return onselectionchange;
	}

	public void setOnselectionchange(String onselectionchange) {
		this.onselectionchange = onselectionchange;
	}

	public String getOnitemdblclick() {
		return onitemdblclick;
	}

	public void setOnitemdblclick(String onitemdblclick) {
		this.onitemdblclick = onitemdblclick;
	}

	public String getRootAttribute() {
		return rootAttribute;
	}

	public void setRootAttribute(String rootAttribute) {
		this.rootAttribute = rootAttribute;
	}

}

package aos.framework.taglib.impl.ext.grid;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSCxt;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.asset.AOSTagUtils;
import aos.framework.taglib.asset.Xtypes;
import aos.framework.taglib.core.model.TagDto;
import aos.framework.taglib.impl.ext.PanelTagSupport;
import aos.framework.taglib.impl.ext.general.OnReadyTag;
import aos.framework.taglib.impl.ext.layout.ViewportTag;

/**
 * <b>GridPanel标签实现类</b>
 * 
 * @author xiongchun
 * @date 2014-05-02
 */
public class GridPanelTag extends PanelTagSupport {

	private static final long serialVersionUID = 1L;

	private String url;

	private String pageSize;

	private String forceFit = TRUE;

	private String hidePagebar = FALSE;

	private String pagebardock = "bottom";

	// 分页模式：client|server。
	private String pageType = "server";

	private String autoLoad = FALSE;

	private String stripeRows;

	private String disableSelection;

	private String onitemclick;

	private String onitemdblclick;

	private String onselectionchange;

	private String onload;

	private String columnLines;

	private String rowLines;

	private String enableLocking;
	
	private String enableColumnHide;
	
	//Ext表格行的缺省唯一索引标识KEY
	private String idProperty="rowId";
	
	private String displayInfo = TRUE;
	
	private String features;

	// 内部变量,不暴露给JSP,由selModeTag标签设定
	private String selModel;

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
	 * @param columnDto
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
		setXtype(Xtypes.GRIDPANEL);
		resetListenerContainer();
		setFieldDtos(null);
		setColumnDtos(null);
		if (AOSUtils.isEmpty(getBorder())) {
			if (getParent() instanceof ViewportTag) {
				setBorder(FALSE);
			}
		}
		// 通知onready标签引入依赖资源
		if (getPageType().equalsIgnoreCase("client")) {
			OnReadyTag onReadyTag = (OnReadyTag) findAncestorWithClass(this, OnReadyTag.class);
			onReadyTag.setPagingMemoryProxy(TRUE);
		}
		// 如果隐藏了分页栏
		if (getHidePagebar().equalsIgnoreCase(TRUE)) {
			if (AOSUtils.isEmpty(getPageSize())) {
				setPageSize(String.valueOf(Integer.MAX_VALUE));
			}
		} else {
			if (AOSUtils.isEmpty(getPageSize())) {
				setPageSize(AOSCxt.getParam("page_size"));
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
		tagDto.put("url", AOSTagUtils.getMyUrl(getUrl()));
		tagDto.put("pageSize", getPageSize());
		tagDto.put("forceFit", getForceFit());
		tagDto.put("hidePagebar", getHidePagebar());
		tagDto.put("pagebardock", getPagebardock());
		tagDto.put("pageType", getPageType());
		tagDto.put("fields", getFieldDtos());
		tagDto.put("columns", getColumnDtos());
		tagDto.put("autoLoad", getAutoLoad());
		tagDto.put("stripeRows", getStripeRows());
		tagDto.put("totalProperty", AOSCons.READER_TOTAL_PROPERTY);
		tagDto.put("root", AOSCons.READER_ROOT_PROPERTY);
		tagDto.put("selModel", getSelModel());
		tagDto.put("disableSelection", getDisableSelection());
		tagDto.put("onitemclick", getOnitemclick());
		tagDto.put("onitemdblclick", getMyEvent(getOnitemdblclick()));
		tagDto.put("onselectionchange", getOnselectionchange());
		tagDto.put("onload", getOnload());
		tagDto.put("columnLines", getColumnLines());
		tagDto.put("rowLines", getRowLines());
		tagDto.put("enableLocking", getEnableLocking());
		tagDto.put("enableColumnHide", getEnableColumnHide());
		tagDto.put("idProperty", getIdProperty());
		tagDto.put("displayInfo", getDisplayInfo());
		tagDto.put("emptyText", AOSCxt.getParam("grid_empty_text"));
		tagDto.put("features", getFeatures());
		String[] featuresArray = StringUtils.split(getFeatures(), ",");
		if (featuresArray != null) {
			String featuresScript = "";
			for (String feature : featuresArray) {
				if (StringUtils.equals(feature, "summary")) {
					featuresScript = "{ftype : 'summary', dock : 'bottom'},";
				}
				//其它feature...
			}
			tagDto.put("featuresScript", StringUtils.substringBeforeLast(featuresScript, ","));
		}
		
		String jspString = mergeFileTemplate(EXTVM + "grid/gridPanelTag.vm", tagDto);
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
		setSelModel(null);
		setPlugins(null);
	}
	
	/**
	 * 转换语法兼容性
	 * @return
	 */
	private String getMyEvent(String itemdblclick){
		if (AOSUtils.isEmpty(itemdblclick)) {
			return null;
		}
		if (itemdblclick.indexOf("#") != -1) {
			itemdblclick = StringUtils.substring(itemdblclick, 1);
			itemdblclick = "function(){" + itemdblclick + "}";
		}
		return itemdblclick;
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

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getForceFit() {
		return forceFit;
	}

	public void setForceFit(String forceFit) {
		this.forceFit = forceFit;
	}

	public String getPagebardock() {
		return pagebardock;
	}

	public void setPagebardock(String pagebardock) {
		this.pagebardock = pagebardock;
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

	public String getAutoLoad() {
		return autoLoad;
	}

	public void setAutoLoad(String autoLoad) {
		this.autoLoad = autoLoad;
	}

	public String getStripeRows() {
		return stripeRows;
	}

	public void setStripeRows(String stripeRows) {
		this.stripeRows = stripeRows;
	}

	public String getDisableSelection() {
		return disableSelection;
	}

	public void setDisableSelection(String disableSelection) {
		this.disableSelection = disableSelection;
	}

	public String getSelModel() {
		return selModel;
	}

	public void setSelModel(String selModel) {
		this.selModel = selModel;
	}

	public String getColumnLines() {
		return columnLines;
	}

	public void setColumnLines(String columnLines) {
		this.columnLines = columnLines;
	}

	public String getEnableLocking() {
		return enableLocking;
	}

	public void setEnableLocking(String enableLocking) {
		this.enableLocking = enableLocking;
	}

	public String getOnitemclick() {
		return onitemclick;
	}

	public void setOnitemclick(String onitemclick) {
		this.onitemclick = onitemclick;
	}

	public String getOnitemdblclick() {
		return onitemdblclick;
	}

	public void setOnitemdblclick(String onitemdblclick) {
		this.onitemdblclick = onitemdblclick;
	}

	public String getRowLines() {
		return rowLines;
	}

	public void setRowLines(String rowLines) {
		this.rowLines = rowLines;
	}

	public String getIdProperty() {
		return idProperty;
	}

	public void setIdProperty(String idProperty) {
		this.idProperty = idProperty;
	}

	public String getHidePagebar() {
		return hidePagebar;
	}

	public void setHidePagebar(String hidePagebar) {
		this.hidePagebar = hidePagebar;
	}

	public String getPageType() {
		return pageType;
	}

	public void setPageType(String pageType) {
		this.pageType = pageType;
	}

	public String getOnload() {
		return onload;
	}

	public void setOnload(String onload) {
		this.onload = onload;
	}

	public String getOnselectionchange() {
		return onselectionchange;
	}

	public void setOnselectionchange(String onselectionchange) {
		this.onselectionchange = onselectionchange;
	}

	public String getDisplayInfo() {
		return displayInfo;
	}

	public void setDisplayInfo(String displayInfo) {
		this.displayInfo = displayInfo;
	}

	public String getEnableColumnHide() {
		return enableColumnHide;
	}

	public void setEnableColumnHide(String enableColumnHide) {
		this.enableColumnHide = enableColumnHide;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

}

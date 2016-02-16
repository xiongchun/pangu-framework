package cn.osworks.aos.web.tag.impl.ext;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.core.model.vo.BorderVO;

/**
 * <b>自定义容器类组件基类</b> 专门针对window、tree、panel、grid而设置的一个特殊的容器类
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class PanelTagSupport extends ContainerTagSupport {

	private static final long serialVersionUID = 1L;

	private String title;

	private String collapsible;

	private String collapsed;

	private String titleCollapse;

	private String bodyStyle;

	private String bodyPadding;

	private String headerBorder;

	private String bodyBorder;
	
	private String splitterBorder;

	private String closable;

	private String closeAction;

	private String collapseMode;

	private String header;
	
	//面板组件作为Tab卡片时是否可以拖拉排序，需要配合reorder插件才有效。
	private String reorderable;

	// 内部变量
	private String contextMenuID;

	/**
	 * 将属性打包
	 * 
	 * @param tagDto
	 * @return
	 */
	protected Dto pkgProperties(Dto tagDto) {
		super.pkgProperties(tagDto);
		tagDto.put("title", getMyTitle());
		tagDto.put("collapsible", getCollapsible());
		tagDto.put("collapsed", getCollapsed());
		tagDto.put("titleCollapse", getTitleCollapse());
		tagDto.put("bodyStyle", getBodyStyle());
		tagDto.put("bodyPadding", getBodyPadding());
		tagDto.put("closable", getClosable());
		tagDto.put("closeAction", getCloseAction());
		tagDto.put("collapseMode", getCollapseMode());
		tagDto.put("borders", getBorders());
		tagDto.put("header", getHeader());
		tagDto.put("reorderable", getReorderable());
		tagDto.put("contextMenuID", getContextMenuID());
		return tagDto;
	}

	/**
	 * 标题加工
	 * 
	 */
	private String getMyTitle() {
		String titleString = AOSTagUtils.getTitle(getTitle());
		// 如果设置了矢量图标，则进行矢量图标和text属性的合并计算
		String iconVec = getIconVec();
		if (AOSUtils.isNotEmpty(iconVec)) {
			iconVec = AOSTagUtils.getIconVec(iconVec, getIconVecSize());
			if (StringUtils.equalsIgnoreCase("right", getIconVecAlign())) {
				titleString = titleString + " " + iconVec;
			} else {
				titleString = iconVec + " " + titleString;
			}
		}
		return titleString;
	}

	/**
	 * 边框设置数据包装
	 * 
	 * @return
	 */
	protected List<BorderVO> getBorders() {
		List<BorderVO> borders = new ArrayList<BorderVO>();
		if (AOSUtils.isNotEmpty(getHeaderBorder())) {
			String[] headerBorders = getHeaderBorder().split(" ");
			int i = 0;
			// Header边框处理
			for (String borderSize : headerBorders) {
				BorderVO borderVO = new BorderVO();
				borderVO.setId("_id_" + AOSTagUtils.getUUID4Tag());
				borderVO.setElement("header");
				borderVO.setSize(borderSize);
				if (i == 0) {
					borderVO.setAlign("top");
				} else if (i == 1) {
					borderVO.setAlign("right");
				} else if (i == 2) {
					borderVO.setAlign("bottom");
				} else if (i == 3) {
					borderVO.setAlign("left");
				}
				borders.add(borderVO);
				i++;
			}
		}
		if (AOSUtils.isNotEmpty(getBodyBorder())) {
			String[] bodyBorders = getBodyBorder().split(" ");
			int i = 0;
			// Body边框处理
			for (String borderSize : bodyBorders) {
				BorderVO borderVO = new BorderVO();
				borderVO.setId("_id_" + AOSTagUtils.getUUID4Tag());
				borderVO.setElement("body");
				borderVO.setSize(borderSize);
				if (i == 0) {
					borderVO.setAlign("top");
				} else if (i == 1) {
					borderVO.setAlign("right");
				} else if (i == 2) {
					borderVO.setAlign("bottom");
				} else if (i == 3) {
					borderVO.setAlign("left");
				}
				borders.add(borderVO);
				i++;
			}
		}
		
		if (AOSUtils.isNotEmpty(getSplitterBorder())) {
			String curSkin = WebCxt.getCfgByUser(pageContext.getSession(), "skin_");
			if (AOSTagUtils.isExtendedClassic(curSkin)) {
				String color = WebCxt.getDicCodeDesc("cmp_border_color_", curSkin);
				String[] splitterBorders = getSplitterBorder().split(" ");
				int i = 0;
				// Splliter边框处理
				for (String borderSize : splitterBorders) {
					BorderVO borderVO = new BorderVO();
					borderVO.setId("_id_" + AOSTagUtils.getUUID4Tag());
					borderVO.setElement("splitter");
					borderVO.setSize(borderSize);
					if (i == 0) {
						borderVO.setAlign("top");
					} else if (i == 1) {
						borderVO.setAlign("right");
					} else if (i == 2) {
						borderVO.setAlign("bottom");
					} else if (i == 3) {
						borderVO.setAlign("left");
					}
					borderVO.setColor(color);
					borders.add(borderVO);
					i++;
				}				
			}
		}
		
		return borders;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	protected void doClear() throws JspException {
		setContextMenuID(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCollapsible() {
		return collapsible;
	}

	public void setCollapsible(String collapsible) {
		this.collapsible = collapsible;
	}

	public String getCollapsed() {
		return collapsed;
	}

	public void setCollapsed(String collapsed) {
		this.collapsed = collapsed;
	}

	public String getTitleCollapse() {
		return titleCollapse;
	}

	public void setTitleCollapse(String titleCollapse) {
		this.titleCollapse = titleCollapse;
	}

	public String getBodyStyle() {
		return bodyStyle;
	}

	public void setBodyStyle(String bodyStyle) {
		this.bodyStyle = bodyStyle;
	}

	public String getBodyPadding() {
		return bodyPadding;
	}

	public void setBodyPadding(String bodyPadding) {
		this.bodyPadding = bodyPadding;
	}

	public String getHeaderBorder() {
		return headerBorder;
	}

	public void setHeaderBorder(String headerBorder) {
		this.headerBorder = headerBorder;
	}

	public String getBodyBorder() {
		return bodyBorder;
	}

	public void setBodyBorder(String bodyBorder) {
		this.bodyBorder = bodyBorder;
	}

	public String getClosable() {
		return closable;
	}

	public void setClosable(String closable) {
		this.closable = closable;
	}

	public String getCloseAction() {
		return closeAction;
	}

	public void setCloseAction(String closeAction) {
		this.closeAction = closeAction;
	}

	public String getCollapseMode() {
		return collapseMode;
	}

	public void setCollapseMode(String collapseMode) {
		this.collapseMode = collapseMode;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getContextMenuID() {
		return contextMenuID;
	}

	public void setContextMenuID(String contextMenuID) {
		this.contextMenuID = contextMenuID;
	}

	public String getSplitterBorder() {
		return splitterBorder;
	}

	public void setSplitterBorder(String splitterBorder) {
		this.splitterBorder = splitterBorder;
	}

	public String getReorderable() {
		return reorderable;
	}

	public void setReorderable(String reorderable) {
		this.reorderable = reorderable;
	}

}

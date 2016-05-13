package cn.osworks.aos.web.tag.impl.ext.docked;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.core.model.vo.AfterRenderRegisterVO;
import cn.osworks.aos.web.tag.core.model.vo.BorderVO;
import cn.osworks.aos.web.tag.impl.ext.ContainerTagSupport;
import cn.osworks.aos.web.tag.impl.ext.ExtTagSupport;
import cn.osworks.aos.web.tag.impl.ext.general.OnReadyTag;
import cn.osworks.aos.web.tag.impl.ext.grid.GridPanelTag;
import cn.osworks.aos.web.tag.impl.ext.tree.TreePanelTag;


/**
 * <b>ToolBar标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-03-06
 */
public class DockedTag extends ContainerTagSupport {

	private static final long serialVersionUID = 1L;

	private String dock;

	// 状态栏使用
	private String text;

	// 状态栏使用
	private String defaultText;

	private String ui;

	// 针对边框的二次强制处理
	private String forceBoder;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		// 1个标签对应多个Xtype组件的情况
		if (AOSUtils.isEmpty(getXtype())) {
			setXtype(Xtypes.TOOLBAR);
		}
		resetListenerContainer();
		resetObjInContainerTag();
		if (AOSUtils.isEmpty(getForceBoder())) {
			// 已知window组件的直系docked不能设置此属性,否则边框有问题
			if (getParent() instanceof GridPanelTag || getParent() instanceof TreePanelTag) {
				setForceBoder("0 0 1 0");
			}
		}
		// 设置缺省高度 ext api缺省为auto 这里强行设置具体的缺省高度
		if (AOSUtils.isEmpty(getHeight())) {
			String skin = WebCxt.getCfgByUser(pageContext.getSession(), "skin_");
			if (skin.equalsIgnoreCase(AOSCons.SKIN_BLUE) || skin.equalsIgnoreCase(AOSCons.SKIN_GRAY)) {
				setHeight("27");
			}
		}
		// 通知onready标签引入依赖资源
		if (getXtype().equalsIgnoreCase("statusbar")) {
			OnReadyTag onReadyTag = (OnReadyTag) findAncestorWithClass(this, OnReadyTag.class);
			onReadyTag.setStatusBar(TRUE);
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
		// Native
		tagDto.put("dock", getDock());
		tagDto.put("text", getText());
		tagDto.put("defaultText", getDefaultText());
		tagDto.put("ui", getUi());
		tagDto.put("forceBorders", getForceBorders());
		// Logic
		String barType = "Ext.toolbar.Toolbar";
		if (getXtype() != null) {
			if (getXtype().equalsIgnoreCase("pagingtoolbar")) {
				barType = "Ext.toolbar.Paging";
			} else if (getXtype().equalsIgnoreCase("statusbar")) {
				barType = "Ext.ux.statusbar.StatusBar";
			}
		}
		tagDto.put("barType", barType);
		String jspString = mergeFileTemplate(EXTVM + "dockedTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		if (AOSUtils.isEmpty(tagDto.getString("renderTo"))) {
			ExtTagSupport parentTag = (ExtTagSupport) getParent();
			AfterRenderRegisterVO afterRenderRegisterVO = new AfterRenderRegisterVO();
			afterRenderRegisterVO.setId(tagDto.getString("id"));
			afterRenderRegisterVO.setType("docked");
			if (AOSUtils.isNotEmpty(dock)) {
				if (dock.equalsIgnoreCase("bottom")) {
					// 容器面板的BottomDocked熟悉颠倒的特殊处理
					parentTag.addAfterRenderRegister4ContainerBottomDocked(afterRenderRegisterVO);
				} else {
					parentTag.addAfterRenderRegister(afterRenderRegisterVO);
				}
			} else {
				parentTag.addAfterRenderRegister(afterRenderRegisterVO);
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
		setHeight(null);
	}

	/**
	 * 强制二次处理边框
	 * 
	 * @return
	 */
	protected List<BorderVO> getForceBorders() {
		List<BorderVO> borders = new ArrayList<BorderVO>();
		if (AOSUtils.isNotEmpty(getForceBoder())) {
			String[] forceBorders = getForceBoder().split(" ");
			int i = 0;
			for (String borderSize : forceBorders) {
				BorderVO borderVO = new BorderVO();
				borderVO.setId("_id_" + AOSTagUtils.getUUID4Tag());
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
		return borders;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getDock() {
		return dock;
	}

	public void setDock(String dock) {
		this.dock = dock;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDefaultText() {
		return defaultText;
	}

	public void setDefaultText(String defaultText) {
		this.defaultText = defaultText;
	}

	public String getUi() {
		return ui;
	}

	public void setUi(String ui) {
		this.ui = ui;
	}

	public String getForceBoder() {
		return forceBoder;
	}

	public void setForceBoder(String forceBoder) {
		this.forceBoder = forceBoder;
	}

}

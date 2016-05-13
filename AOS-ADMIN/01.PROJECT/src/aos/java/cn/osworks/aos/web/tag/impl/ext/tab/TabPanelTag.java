package cn.osworks.aos.web.tag.impl.ext.tab;

import java.io.IOException;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.panel.PanelTag;


/**
 * <b>TabPanel标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-04-10
 */
public class TabPanelTag extends PanelTag {

	private static final long serialVersionUID = 1L;

	private String activeTab;

	private String plain = "true";

	private String tabBarHeight;

	private String activeTabBarColor;

	private String tabPosition = "top";
	
	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		doBorderPrepare();
		doWidthPrepare();
		doCenterIt();
		setXtype(Xtypes.TABPANEL);
		resetListenerContainer();
		resetObjInContainerTag();

		if (AOSUtils.isEmpty(getTabBarHeight())) {
			String skin = WebCxt.getCfgByUser(pageContext.getSession(), "skin_");
			if (skin.equalsIgnoreCase(AOSCons.SKIN_NEPTUNE)) {
				setTabBarHeight("30");
			} else {
				setTabBarHeight("25");
			}
		}

		// 设置缺省活动卡片高亮颜色
		if (AOSUtils.isEmpty(getActiveTabBarColor())) {
			String colorString = WebCxt.getCfgOfDB("tab_focus_color_");
			setActiveTabBarColor(colorString);
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
		tagDto.put("activeTab", getActiveTab());
		tagDto.put("plain", getPlain());
		tagDto.put("tabBarHeight", getTabBarHeight());
		tagDto.put("activeTabBarColor", getActiveTabBarColor());
		tagDto.put("tabPosition", getTabPosition());
		String jspString = mergeFileTemplate(EXTVM + "tabPanelTag.vm", tagDto);
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
		setTabBarHeight(null);
		setActiveTabBarColor(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	/**
	 * 支持索引和Tab的ID
	 * 
	 * @return
	 */
	public String getActiveTab() {
		if (AOSUtils.isEmpty(activeTab)) {
			return activeTab;
		}
		if (!StringUtils.isNumeric(activeTab)) {
			activeTab = "'" + activeTab + "'";
		}
		return activeTab;
	}

	public void setActiveTab(String activeTab) {
		this.activeTab = activeTab;
	}

	public String getPlain() {
		return plain;
	}

	public void setPlain(String plain) {
		this.plain = plain;
	}

	public String getTabBarHeight() {
		return tabBarHeight;
	}

	public void setTabBarHeight(String tabBarHeight) {
		this.tabBarHeight = tabBarHeight;
	}

	public String getActiveTabBarColor() {
		return activeTabBarColor;
	}

	public void setActiveTabBarColor(String activeTabBarColor) {
		this.activeTabBarColor = activeTabBarColor;
	}

	public String getTabPosition() {
		return tabPosition;
	}

	public void setTabPosition(String tabPosition) {
		this.tabPosition = tabPosition;
	}

}

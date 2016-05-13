package cn.osworks.aos.web.tag.impl.ext.plugins.impl;

import java.util.List;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.BaseTagSupport;
import cn.osworks.aos.web.tag.impl.ext.plugins.PluginsTag;


/**
 * Tab卡片的右键关闭菜单
 * 
 * @author OSWorks-XC
 * @date 2014-02-06
 */
public class TabCloseMenuPluginTag extends BaseTagSupport {

	private static final long serialVersionUID = 1L;

	//The text for closing the current tab.
	private String closeTabText;
	
	//Indicates whether to show the 'Close Others' option. default: true.
	private String showCloseOthers;
	
	//The text for closing all tabs except the current one.
	private String closeOthersTabsText;
	
	// Indicates whether to show the 'Close All' option.  default: true.
	private String showCloseAll;
	
	//The text for closing all tabs.
	private String closeAllTabsText;
	
	//尾巴扩展菜单1
	private String extraItemsTail1;
	
	//尾巴扩展菜单1
	private String extraItemsTail2;
	
	//是否显示关闭菜单图标
	private String showCloseItemIcon;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		return SKIP_BODY;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		// Native
		tagDto.put("closeTabText", getCloseTabText());
		tagDto.put("showCloseOthers", getShowCloseOthers());
		tagDto.put("closeOthersTabsText", getCloseOthersTabsText());
		tagDto.put("showCloseAll", getShowCloseAll());
		tagDto.put("closeAllTabsText", getCloseAllTabsText());
		//是否显示关闭菜单图标
		if (!StringUtils.equalsIgnoreCase(getShowCloseItemIcon(), FALSE)) {
			tagDto.put("closeTabIcon", AOSTagUtils.getIcon("page.png", pageContext));
			tagDto.put("closeOthersTabsIcon", AOSTagUtils.getIcon("page2.png", pageContext));
			tagDto.put("closeAllTabsIcon", AOSTagUtils.getIcon("page3.png", pageContext));
		}
		List<Dto> extraItemsTailDtos = Lists.newArrayList();
		//扩展菜单1
		if (AOSUtils.isNotEmpty(getExtraItemsTail1())) {
			String[] tail1Opts = StringUtils.split(getExtraItemsTail1(), ":");
			if (tail1Opts.length < 3) {
				throw new JspException("TabColeMenu标签的extraItemsTail1属性值不合法。请检查。");
			}
			Dto tail1Dto = Dtos.newDto();
			tail1Dto.put("text", tail1Opts[0]);
			tail1Dto.put("handler", tail1Opts[1]);
			tail1Dto.put("icon", AOSTagUtils.getIcon(tail1Opts[2], pageContext));
			extraItemsTailDtos.add(tail1Dto);
		}
		//扩展菜单2
		if (AOSUtils.isNotEmpty(getExtraItemsTail2())) {
			String[] tail2Opts = StringUtils.split(getExtraItemsTail2(), ":");
			if (tail2Opts.length < 3) {
				throw new JspException("TabColeMenu标签的extraItemsTail2属性值不合法。请检查。");
			}
			Dto tail2Dto = Dtos.newDto();
			tail2Dto.put("text", tail2Opts[0]);
			tail2Dto.put("handler", tail2Opts[1]);
			tail2Dto.put("icon", AOSTagUtils.getIcon(tail2Opts[2], pageContext));
			extraItemsTailDtos.add(tail2Dto);
		}
		tagDto.put("extraItemsTailDtos", extraItemsTailDtos);
		String jspString = mergeFileTemplate(EXTVM + "plugins/impl/tabCloseMenuPluginTag.vm", tagDto);
		if (getParent() instanceof PluginsTag) {
			PluginsTag parentTag = (PluginsTag) getParent();
			parentTag.addPlugin(jspString);
		}
		return EVAL_PAGE;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public String getCloseTabText() {
		return closeTabText;
	}

	public void setCloseTabText(String closeTabText) {
		this.closeTabText = closeTabText;
	}

	public String getShowCloseOthers() {
		return showCloseOthers;
	}

	public void setShowCloseOthers(String showCloseOthers) {
		this.showCloseOthers = showCloseOthers;
	}

	public String getCloseOthersTabsText() {
		return closeOthersTabsText;
	}

	public void setCloseOthersTabsText(String closeOthersTabsText) {
		this.closeOthersTabsText = closeOthersTabsText;
	}

	public String getShowCloseAll() {
		return showCloseAll;
	}

	public void setShowCloseAll(String showCloseAll) {
		this.showCloseAll = showCloseAll;
	}

	public String getCloseAllTabsText() {
		return closeAllTabsText;
	}

	public void setCloseAllTabsText(String closeAllTabsText) {
		this.closeAllTabsText = closeAllTabsText;
	}

	public String getExtraItemsTail1() {
		return extraItemsTail1;
	}

	public void setExtraItemsTail1(String extraItemsTail1) {
		this.extraItemsTail1 = extraItemsTail1;
	}

	public String getShowCloseItemIcon() {
		return showCloseItemIcon;
	}

	public void setShowCloseItemIcon(String showCloseItemIcon) {
		this.showCloseItemIcon = showCloseItemIcon;
	}

	public String getExtraItemsTail2() {
		return extraItemsTail2;
	}

	public void setExtraItemsTail2(String extraItemsTail2) {
		this.extraItemsTail2 = extraItemsTail2;
	}

}

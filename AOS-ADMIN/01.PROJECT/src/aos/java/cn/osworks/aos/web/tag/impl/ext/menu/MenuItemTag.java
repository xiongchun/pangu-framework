package cn.osworks.aos.web.tag.impl.ext.menu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.asset.Xtypes;
import cn.osworks.aos.web.tag.core.model.TagDto;
import cn.osworks.aos.web.tag.impl.ext.ButtonTagSupport;
import cn.osworks.aos.web.tag.impl.ext.ComponentTagSupport;


/**
 * <b>Ext 菜单标签实现类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-02-06
 */
public class MenuItemTag extends ButtonTagSupport {

	private static final long serialVersionUID = 1L;

	private String plain;

	// 内部使用
	private String subMenuId;

	// 内部使用
	private List<Dto> subMenuItemList;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		if (AOSUtils.isEmpty(getXtype())) {
			setXtype(Xtypes.MENUITEM);
		}
		setSubMenuItemList(null);
		setSubMenuId(null);
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
		tagDto.put("plain", getPlain());
		// Logic
		ComponentTagSupport parentTag = (ComponentTagSupport) AOSTagUtils.getParent(getParent());
		if (parentTag instanceof MenuTag) {
			tagDto.put("parentXalias", "menu");
		}
		tagDto.put("parentID", parentTag.getMyId());
		String subMenuId = null;
		if (parentTag instanceof MenuItemTag) {
			MenuItemTag parentTag2 = (MenuItemTag) getParent();
			subMenuId = parentTag2.getMyId() + "_sub";
			parentTag2.setSubMenuId(subMenuId);
			Dto subDto = new HashDto();
			subDto.put("subMenuItemId", tagDto.getString("id"));
			parentTag2.addSubMenuItem(subDto);
		}
		tagDto.put("subMenuId", getSubMenuId());
		tagDto.put("subMenuItemList", getSubMenuItemList());
		String jspString = mergeFileTemplate(EXTVM + "menuItemTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
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
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public void addSubMenuItem(Dto subDto) {
		if (subMenuItemList == null) {
			subMenuItemList = new ArrayList<Dto>();
		}
		subMenuItemList.add(subDto);
	}

	public String getPlain() {
		return plain;
	}

	public void setPlain(String plain) {
		this.plain = plain;
	}

	public String getSubMenuId() {
		return subMenuId;
	}

	public void setSubMenuId(String subMenuId) {
		this.subMenuId = subMenuId;
	}

	public List<Dto> getSubMenuItemList() {
		return subMenuItemList;
	}

	public void setSubMenuItemList(List<Dto> subMenuItemList) {
		this.subMenuItemList = subMenuItemList;
	}

}

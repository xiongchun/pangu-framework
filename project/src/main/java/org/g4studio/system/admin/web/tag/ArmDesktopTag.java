package org.g4studio.system.admin.web.tag;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.common.util.WebUtils;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.properties.PropertiesFactory;
import org.g4studio.core.properties.PropertiesFile;
import org.g4studio.core.properties.PropertiesHelper;
import org.g4studio.core.tplengine.DefaultTemplate;
import org.g4studio.core.tplengine.FileTemplate;
import org.g4studio.core.tplengine.TemplateEngine;
import org.g4studio.core.tplengine.TemplateEngineFactory;
import org.g4studio.core.tplengine.TemplateType;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.core.web.taglib.html.HtmlTag;
import org.g4studio.core.web.taglib.util.TagConstant;
import org.g4studio.core.web.taglib.util.TagHelper;
import org.g4studio.system.admin.service.TagSupportService;
import org.g4studio.system.common.dao.vo.UserInfoVo;
import org.g4studio.system.common.util.SystemConstants;

/**
 * Desktop桌面布局标签:G4Studio_ARM专用
 * 
 * @author OSWorks-XC
 * @since 2012-12-22
 */
public class ArmDesktopTag extends TagSupport{
	
	private TagSupportService armTagSupportService = (TagSupportService)SpringBeanLoader.getSpringBean("armTagSupportService");
	
	private static Log log = LogFactory.getLog(HtmlTag.class);
	
	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException{
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		UserInfoVo userInfo = WebUtils.getSessionContainer(request).getUserInfo();
		String contextPath = request.getContextPath();
		request.setAttribute("webContext", contextPath);
		Dto dto = new BaseDto();
		PropertiesHelper pHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);
		dto.put("title", WebUtils.getParamValue("SYS_TITLE", request));
		dto.put("contextPath", contextPath);
		String titleIcon = WebUtils.getParamValue("TITLE_ICON", request);
		dto.put("titleIcon", G4Utils.isEmpty(titleIcon) ? "G4Studio.ico" : titleIcon);
		Dto themeDto = new BaseDto();
		Dto resultDto = new BaseDto();
		if(G4Utils.isNotEmpty(userInfo)){
			themeDto.put("userid", userInfo.getUserid());
			resultDto = armTagSupportService.getEauserSubInfo(themeDto);
		}
		String theme = null;
		if(G4Utils.isNotEmpty(resultDto))
			theme = resultDto.getAsString("theme");
		String defaultTheme = WebUtils.getParamValue("SYS_DEFAULT_THEME", request);
		theme = G4Utils.isEmpty(theme) ? defaultTheme : theme;
		dto.put("theme", theme);
		String layout = null;
		if(G4Utils.isNotEmpty(resultDto))
			layout = resultDto.getAsString("layout");
		String defaultLayout = WebUtils.getParamValue("APP_LAYOUT", request);
		layout = G4Utils.isEmpty(layout) ? defaultLayout : layout;
		dto.put("layout", layout);
		String background = null;
		if(G4Utils.isNotEmpty(resultDto))
			background = resultDto.getAsString("background");
		String defaultBackfround = WebUtils.getParamValue("DESKTOP_BACKGROUND", request);
		background = G4Utils.isEmpty(background) ? defaultBackfround : background;
		dto.put("background", background);
		PropertiesHelper p = PropertiesFactory.getPropertiesHelper(PropertiesFile.G4);
		dto.put("extMode", p.getValue("extMode", TagConstant.Ext_Mode_Run));
		dto.put("runMode", p.getValue("runMode", TagConstant.RUN_MODE_NORMAL));
		dto.put("ajaxErrCode", G4Constants.Ajax_Timeout);
		String micolor = pHelper.getValue("micolor", "blue");
		dto.put("username", WebUtils.getSessionContainer(request).getUserInfo().getUsername());
		dto.put("account", WebUtils.getSessionContainer(request).getUserInfo().getAccount());
		Dto qDto = new BaseDto();
		qDto.put("deptid", WebUtils.getSessionContainer(request).getUserInfo().getDeptid());
		dto.put("deptname", armTagSupportService.getDepartmentInfo(qDto).getAsString("deptname"));
		dto.put("userInfo", userInfo);
		List menuList = getMenuList();
		dto.put("menuList", menuList);
		dto.put("paramList", WebUtils.getParamList(request));
		TemplateEngine engine = TemplateEngineFactory.getTemplateEngine(TemplateType.VELOCITY);
		DefaultTemplate template = new FileTemplate();
		template.setTemplateResource(TagHelper.getTemplatePath(getClass().getName()));
		StringWriter writer = engine.mergeTemplate(template, dto);
		try {
			pageContext.getOut().write(writer.toString());
		} catch (IOException e) {
			log.error(G4Constants.Exception_Head + e.getMessage());
			e.printStackTrace();
		}
		return super.SKIP_BODY;
	}
	
	/**
	 * 获取权限内的功能菜单
	 * 
	 * @return
	 */
	private List getMenuList(){
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		String account = WebUtils.getSessionContainer(request).getUserInfo().getAccount();
		account = account == null ? "" : account;
		String accountType = SystemConstants.ACCOUNTTYPE_NORMAL;
		if (account.equalsIgnoreCase(WebUtils.getParamValue("DEFAULT_ADMIN_ACCOUNT", request))) {
			accountType = SystemConstants.ACCOUNTTYPE_SUPER;
		} else if (account.equalsIgnoreCase(WebUtils.getParamValue("DEFAULT_DEVELOP_ACCOUNT", request))) {
			accountType = SystemConstants.ACCOUNTTYPE_DEVELOPER;
		}
		Dto qDto = new BaseDto();
		qDto.put("accountType", accountType);
		qDto.put("userid", WebUtils.getSessionContainer(request).getUserInfo().getUserid());
		List menuList = armTagSupportService.getMenuList4Desktop(qDto).getDefaultAList();
		return menuList;
	}
	
	/**
	 * 标签结束
	 */
	public int doEndTag() throws JspException{
		return super.EVAL_PAGE;
	}
	
	/**
	 * 释放资源
	 */
	public void release(){

		super.release();
	}
}

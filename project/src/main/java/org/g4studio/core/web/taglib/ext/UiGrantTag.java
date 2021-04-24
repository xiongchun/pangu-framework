package org.g4studio.core.web.taglib.ext;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.common.dao.Dao;
import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.common.util.WebUtils;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.tplengine.DefaultTemplate;
import org.g4studio.core.tplengine.FileTemplate;
import org.g4studio.core.tplengine.TemplateEngine;
import org.g4studio.core.tplengine.TemplateEngineFactory;
import org.g4studio.core.tplengine.TemplateType;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.core.web.taglib.util.TagHelper;
import org.g4studio.system.common.dao.vo.UserInfoVo;

/**
 * 
 * UiGrant标签<br>
 * 实现UI元素授权
 * 
 * @author OSWorks-XC
 * @since 2011-09-30
 */
public class UiGrantTag extends TagSupport{
	
	private static Log log = LogFactory.getLog(UiGrantTag.class);
	
	
	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException{
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		Dao g4Dao = (Dao) SpringBeanLoader.getSpringBean("g4Dao");
		Dto qDto = new BaseDto();
		UserInfoVo userInfoVo = WebUtils.getSessionContainer(request).getUserInfo();
		qDto.put("userid", userInfoVo.getUserid());
		qDto.put("menuid", request.getParameter("menuid4Log"));
		List roleGrantList = g4Dao.queryForList("ArmTagSupport.getUiRoleGrantInfo", qDto);
		List userGrantList = g4Dao.queryForList("ArmTagSupport.getUiUserGrantInfo", qDto);
		List grantList = new ArrayList();
		if (G4Utils.isNotEmpty(roleGrantList)) {
			grantList.addAll(roleGrantList);
		}
		if (G4Utils.isNotEmpty(userGrantList)) {
			grantList.addAll(userGrantList);
		}
		Dto dto = new BaseDto();
		dto.put("grantList", grantList);
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

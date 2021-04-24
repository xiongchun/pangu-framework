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
import org.g4studio.common.util.WebUtils;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.tplengine.DefaultTemplate;
import org.g4studio.core.tplengine.FileTemplate;
import org.g4studio.core.tplengine.TemplateEngine;
import org.g4studio.core.tplengine.TemplateEngineFactory;
import org.g4studio.core.tplengine.TemplateType;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.web.taglib.util.TagConstant;
import org.g4studio.core.web.taglib.util.TagHelper;

/**
 * CodeStoreTag标签<br>
 * 导入Ext扩展组件的CSS、JS资源
 * 
 * @author OSWorks-XC
 * @since 2010-01-30
 */
public class CodeStoreTag extends TagSupport {

	private static Log log = LogFactory.getLog(CodeStoreTag.class);
	private String fields;
	private String showCode = "false";

	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException {
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		StringBuffer sb = new StringBuffer();
		sb.append(TagConstant.SCRIPT_START);
		Dto dto = new BaseDto();
		dto.put("showCode", showCode.toLowerCase());
		String[] arrayFields = fields.split(",");
		TemplateEngine engine = TemplateEngineFactory.getTemplateEngine(TemplateType.VELOCITY);
		DefaultTemplate template = new FileTemplate();
		template.setTemplateResource(TagHelper.getTemplatePath(getClass().getName()));
		for (int i = 0; i < arrayFields.length; i++) {
			if (arrayFields[i].indexOf(":") != -1) {
				String field = arrayFields[i].substring(0, arrayFields[i].indexOf(":"));
				dto.put("field", field);
				List codeList = WebUtils.getCodeListByField(field, request);
				String filter =  arrayFields[i].substring(arrayFields[i].indexOf(":") + 1);
				String filters[] = filter.split("!");
				List okList = new ArrayList();
				
				for (int j = 0; j < codeList.size(); j++) {
					Dto codeDto = (BaseDto) codeList.get(j);
					boolean flag = true;
					for (int k = 0; k < filters.length; k++) {
						if (codeDto.getAsString("code").equalsIgnoreCase(filters[k])) {
							flag = false;
						}
					}
					if (flag) {
						okList.add(codeDto);
					}
				}
				dto.put("codeList", okList);
			} else {
				List codeList = WebUtils.getCodeListByField(arrayFields[i], request);
				dto.put("field", arrayFields[i]);
				dto.put("codeList", codeList);
			}
			StringWriter writer = engine.mergeTemplate(template, dto);
			sb.append(writer.toString());
		}
		sb.append(TagConstant.SCRIPT_END);
		try {
			pageContext.getOut().write(sb.toString());
		} catch (IOException e) {
			log.error(G4Constants.Exception_Head + e.getMessage());
			e.printStackTrace();
		}
		return super.SKIP_BODY;
	}

	/**
	 * 标签结束
	 */
	public int doEndTag() throws JspException {
		return super.EVAL_PAGE;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		fields = null;
		showCode = null;
		super.release();
	}

	public void setFields(String fields) {
		this.fields = fields;
	}

	public void setShowCode(String showCode) {
		this.showCode = showCode;
	}

}

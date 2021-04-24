package org.g4studio.core.web.taglib.html;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.tplengine.DefaultTemplate;
import org.g4studio.core.tplengine.StringTemplate;
import org.g4studio.core.tplengine.TemplateEngine;
import org.g4studio.core.tplengine.TemplateEngineFactory;
import org.g4studio.core.tplengine.TemplateType;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.core.web.taglib.util.TagHelper;

/**
 * Import标签<br>
 * 导入CSS、JS资源
 * @author OSWorks-XC
 * @since 2010-01-30
 */
public class ImportTag extends TagSupport{
	
	private static Log log = LogFactory.getLog(ImportTag.class);
	private String src;
	
	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException{
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		String tpl = "#if($type==*css*)<link rel=*stylesheet* type=*text/css* href=*$src*/>#elseif($type==*js*)<script type=*text/javascript* src=*$src* ></script>#end";
		Dto dto = new BaseDto();
		dto.put("type", src.indexOf(".css") == -1 ? "js" : "css");
		String srcString =  request.getContextPath() + src;
		if (StringUtils.equals("js", dto.getAsString("type"))) {
			srcString = srcString + "?random=" + G4Utils.getRandom(0, Integer.MAX_VALUE);
		}
		dto.put("src", srcString);
		TemplateEngine engine = TemplateEngineFactory.getTemplateEngine(TemplateType.VELOCITY);
		DefaultTemplate template = new StringTemplate(TagHelper.replaceStringTemplate(tpl));
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
		src = null;
		super.release();
	}

	public void setSrc(String src) {
		this.src = src;
	}
}

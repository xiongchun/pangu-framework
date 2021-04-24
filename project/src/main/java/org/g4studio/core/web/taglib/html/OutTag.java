package org.g4studio.core.web.taglib.html;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.common.util.WebUtils;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;

/**
 * Out标签<br>
 * 输出request,session,application作用域的变量值
 * @author OSWorks-XC
 * @since 2010-02-30
 */
public class OutTag extends TagSupport {
	
	private static Log log = LogFactory.getLog(OutTag.class);
	private String scope;
	private String key;
	
	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException{
		scope = G4Utils.isEmpty(scope) ? "request" : scope;
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		String valueString = "";
		if(scope.equalsIgnoreCase("request")){
			valueString = (String)request.getAttribute(key);
		}else if(scope.equalsIgnoreCase("session")){
			valueString = (String)WebUtils.getSessionAttribute(request, key);
		}else if (scope.equalsIgnoreCase("application")) {
			valueString = (String)request.getSession().getServletContext().getAttribute(key);
		}
		try {
			pageContext.getOut().write(valueString);
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
		scope = null;
		key = null;
		super.release();
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public void setKey(String key) {
		this.key = key;
	}
}

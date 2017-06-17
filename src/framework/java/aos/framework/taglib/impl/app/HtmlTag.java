package aos.framework.taglib.impl.app;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.asset.AOSTagUtils;
import aos.framework.taglib.core.model.TagDto;


/**
 * <b>Html标签</b>
 * 
 * @author xiongchun
 * @since 6.0
 * @date 2013-06-06
 */
public class HtmlTag extends AppTagSupport {

	private static final long serialVersionUID = 1L;

	private String html5 = TRUE;
	
	private String title;
	
	private String base;
	
	private String lib;

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		initWebContext();
	}

	/**
	 * 将一些参数变量存入pageContext,供JSP页面使用${}取值<br>
	 * 更多参数导出和存取标准请参阅<export/>标签
	 * 
	 * @param pageContext
	 */
	private void initWebContext() {
		//JSP可以通过el表达式${cxt}来获取
		pageContext.setAttribute("cxt", pageContext.getServletContext().getContextPath());
		//还可以存入其它变量
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		Dto tagDto = new TagDto();
		super.pkgProperties(tagDto);
		// Native
		tagDto.put("html5", html5);
		tagDto.put("title", title);
		tagDto.put("base", getMyBase(getBase()));
		tagDto.put("skin", AOSTagUtils.getCurSkin((HttpServletRequest)pageContext.getRequest()));
		if (AOSUtils.isNotEmpty(lib)) {
			String[] libs = lib.split(",");
			for (String libkey : libs) {
				tagDto.put(libkey, TRUE);
			}
		}
		//浏览器类型处理
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		String ie_version = AOSUtils.getIeVersion(request.getHeader("USER-AGENT"));
		if (AOSUtils.isEmpty(ie_version)) {
			ie_version = "-1";  //非IE或者IE装了GCF
		}
		tagDto.put("ie_version", Integer.valueOf(ie_version));
		String jspString = mergeFileTemplate(APPVM + "htmlStartTag.vm", tagDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		Dto hashDto = new TagDto();
		String jspString = mergeFileTemplate(APPVM + "htmlEndTag.vm", hashDto);
		try {
			pageContext.getOut().write(jspString);
		} catch (IOException e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}
	
	/**
	 * 处理Base地址
	 * 
	 * @return
	 */
	private String getMyBase(String base) {
		if (AOSUtils.isEmpty(base)) {
			return null;
		}
		if (!base.endsWith("/")) {
			base += "/";
		}
		if (!base.startsWith("/")) {
			base = "/" + base;
		}
		base = getContextpath() + base;
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		// 兼顾IE，必须加上下面这个头。base标签才IE下才有效。
		String head = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		base = head + base;
		return base;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
	}

	public void setHtml5(String html5) {
		this.html5 = html5;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBase() {
		return base;
	}

	public void setBase(String base) {
		this.base = base;
	}

	public String getLib() {
		return lib;
	}

	public void setLib(String lib) {
		this.lib = lib;
	}

}

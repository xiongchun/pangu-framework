package org.g4studio.core.resource.impl;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * CacheResourceFilter
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-09-10
 */
public class CacheResourceFilter implements Filter {

	private static final long serialVersionUID = 1L;

	private final Log logger = LogFactory.getLog(this.getClass());

	public void destroy() {
	}

	public void doFilter(ServletRequest pServletRequest, ServletResponse pServletResponse, FilterChain pFilterChain)
			throws IOException, ServletException {
	}

	private FilterConfig filterConfig = null;

	public void init(FilterConfig pFilterConfig) throws ServletException {
		this.filterConfig = pFilterConfig;
	}

	public static void main(String[] args) {
		// 用于处理CSS 文件的图片url
		Pattern p = Pattern.compile("(url(\\p{Blank})*)(\\()(([^\\)])*)(\\))");
		Matcher m = p
				.matcher(".x-tip-br{background: url  ( ../images/default/form/error-tip-corners.gif  ) no-repeat right -6px;}");
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			String x = m.group(4).trim() + "?timestamp=13";
			m.appendReplacement(sb, "$1$3" + x + "$6");
		}
		m.appendTail(sb);
		System.err.println(sb.toString());
	}
}

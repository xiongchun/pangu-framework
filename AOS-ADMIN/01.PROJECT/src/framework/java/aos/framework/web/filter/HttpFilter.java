package aos.framework.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import aos.framework.core.asset.WebCxt;
import aos.framework.core.utils.AOSCons;

/**
 * <b>拦截器</b>
 * <p>
 * 拦截所有请求
 * 
 * @author xiongchun
 */
@SuppressWarnings("all")
public class HttpFilter implements Filter {

	private static Logger log = LoggerFactory.getLogger(HttpFilter.class);

	/**
	 * 初始化
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	/**
	 * 过滤
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		/*
		log.info(AOSCons.CONSOLE_FLAG3 + "ClientIP：{}，URI：{}，ROUTER：{}，JUID：{}", WebCxt.getClientIpAddr(httpRequest), httpRequest.getRequestURI(),
				httpRequest.getParameter("router"), httpRequest.getParameter("juid"));
		*/
		//System.out.println(WebCxt.getClientIpAddr(httpRequest) + "，" + httpRequest.getRequestURI());
		chain.doFilter(httpRequest, httpResponse);
	}

	/**
	 * 释放资源
	 */
	@Override
	public void destroy() {
	}

}

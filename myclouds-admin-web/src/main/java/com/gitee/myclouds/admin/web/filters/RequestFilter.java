package com.gitee.myclouds.admin.web.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 外层通用请求过滤器
 * 
 * @author xiongchun
 *
 */
@WebFilter(filterName = "RequestFilter", urlPatterns = { "/*" })
public class RequestFilter implements Filter{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void destroy() {
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
		logReqInfo(httpServletRequest);
		filterChain.doFilter(servletRequest, servletResponse);
		return;
	}

	/**
	 * 打印通用请求日志信息
	 * 
	 * @param httpServletRequest
	 */
	private void logReqInfo(HttpServletRequest httpServletRequest) {
		String uri = httpServletRequest.getRequestURI();
		String sessionId = httpServletRequest.getRequestedSessionId();
		logger.info("收到请求->请求URI：{} 所属会话：{}", uri, sessionId == null ? StringUtils.EMPTY : sessionId);
	}
}

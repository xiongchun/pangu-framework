package org.g4studio.core.resource;

import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * HttpHolder
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-11-20
 */
public class HttpHolder {
	private static ThreadLocal requestThreadLocal = new ThreadLocal();
	private static ThreadLocal responseThreadLocal = new ThreadLocal();
	private static ServletContext servletContext = null;
	private static ThreadLocal filterChainLocal = new ThreadLocal();

	private HttpHolder() {
	}

	public static void setRequest(HttpServletRequest pRequest) {
		requestThreadLocal.set(pRequest);
	}

	public static void setResponse(HttpServletResponse pResponse) {
		responseThreadLocal.set(pResponse);
	}

	public static void setServletContext(ServletContext pServletContext) {
		servletContext = pServletContext;
	}

	public static void setFilterChain(FilterChain pFilterChain) {
		filterChainLocal.set(pFilterChain);
	}

	public static ServletContext getServletContext() {
		return servletContext;
	}

	public static FilterChain getFilterChain() {
		return (FilterChain) filterChainLocal.get();
	}

	public static HttpServletRequest getRequest() {
		return (HttpServletRequest) requestThreadLocal.get();
	}

	public static HttpServletResponse getResponse() {
		return (HttpServletResponse) responseThreadLocal.get();
	}

}

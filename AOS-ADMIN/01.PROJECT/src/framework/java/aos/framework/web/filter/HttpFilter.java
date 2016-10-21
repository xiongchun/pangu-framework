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

import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import aos.framework.core.utils.AOSUtils;

/**
 * <b>拦截器</b>
 * <p>拦截所有请求
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
		//System.out.println("HttpFilter：第一过滤链" + httpRequest.getRequestURI());
		chain.doFilter(httpRequest, httpResponse);
	}

	/**
	 * 释放资源
	 */
	@Override
	public void destroy() {
	}

}

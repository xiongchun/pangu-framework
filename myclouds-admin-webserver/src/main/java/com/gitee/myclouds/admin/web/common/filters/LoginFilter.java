package com.gitee.myclouds.admin.web.common.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gitee.myclouds.toolbox.session.data.CurUser;
import com.gitee.myclouds.toolbox.util.FilterUtil;
import com.gitee.myclouds.toolbox.util.WebCxt;

/**
 * Admin登录权限过滤器
 * 
 * @author xiongchun
 *
 */
@WebFilter(filterName = "LoginFilter", urlPatterns = { "/*" })
public class LoginFilter implements Filter {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 排除列表
	private final String[] excludeKeysArray = { "/login", "/css/", "/img/", "/js/", "/theme/" };

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	/**
	 * 过滤器处理流程
	 * 
	 */
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
		HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;

		// 排除列表
		if (FilterUtil.checkExcludes(httpServletRequest.getRequestURI(), excludeKeysArray)) {
			filterChain.doFilter(servletRequest, servletResponse);
			return;
		}

		// 应用过滤器算法
		boolean isPass = true;
		isPass = checkSession(httpServletRequest, httpServletResponse);
		if (isPass) {
			filterChain.doFilter(servletRequest, servletResponse);
		} else {
			httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login");
			return;
		}

	}

	/**
	 * 检查用户是否登录
	 * 
	 * @param httpServletRequest
	 */
	private boolean checkSession(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
			throws IOException {
		boolean isPass = true;
		String uri = httpServletRequest.getRequestURI();
		HttpSession httpSession = httpServletRequest.getSession();
		CurUser curUser = WebCxt.getCurUser(httpSession);
		if (curUser == null) {
			// 对于被拦截后不进行页面转换的时候，可以使用下面的设置。如：API接口的拦截器等。否则会导致页面跳转时候报如下错。
			// cannot call sendredirect() after the response has been committed
			// httpServletResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "请求被安全审计组件拦截
			// | 事件:未登录或登录已超时");
			logger.info("拦截请求(未登录)-> 请求URI：{} 所属会话：{}", uri, httpServletRequest.getRequestedSessionId());
			isPass = false;
		}
		return isPass;
	}

	@Override
	public void destroy() {

	}

}

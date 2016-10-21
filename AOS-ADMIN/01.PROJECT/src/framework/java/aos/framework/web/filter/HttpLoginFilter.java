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

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import aos.framework.core.asset.AOSBeanLoader;
import aos.framework.core.utils.AOSUtils;
import aos.system.common.model.UserModel;
import aos.system.modules.cache.CacheUserDataService;

/**
 * <b>拦截器</b>
 * <p>
 * 拦截http路径的请求，进行登录身份验证和登录有效期展期
 * 
 * @author xiongchun
 */
public class HttpLoginFilter implements Filter {

	private static Logger log = LoggerFactory.getLogger(HttpLoginFilter.class);

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
		// String uri = httpRequest.getRequestURI();
		String router = httpRequest.getParameter("router");
		// TODO 改为REDIS缓存 和URL授权时候一起考虑
		if (StringUtils.equalsIgnoreCase(router, "homeService.initLogin")
				|| StringUtils.equalsIgnoreCase(router, "homeService.login")
				|| StringUtils.equalsIgnoreCase(router, "homeService.loginDev")) {
			chain.doFilter(httpRequest, httpResponse);
			return;
		}
		String juid = httpRequest.getParameter("juid");
		boolean pass = true;
		if (AOSUtils.isEmpty(juid)) {
			log.warn("juid参数缺失。");
			pass = false;
		} else {
			CacheUserDataService cacheUserDataService = (CacheUserDataService) AOSBeanLoader
					.getSpringBean("cacheUserDataService");
			UserModel userModel = cacheUserDataService.getUserModel(juid);
			if (AOSUtils.isEmpty(userModel)) {
				pass = false;
			} else {
				// 维持心跳
				cacheUserDataService.heartbeat(juid);
			}
		}
		if (!pass) {
			log.warn("请求被重定向到登录页。");
			httpResponse.getWriter().write("<script type=\"text/javascript\">parent.location.href='"
					+ httpRequest.getContextPath() + "/http/do.jhtml?router=homeService.initLogin'</script>");
			httpResponse.getWriter().flush();
			httpResponse.getWriter().close();
			return;
		}
		chain.doFilter(httpRequest, httpResponse);
	}

	/**
	 * 释放资源
	 */
	@Override
	public void destroy() {
	}

}

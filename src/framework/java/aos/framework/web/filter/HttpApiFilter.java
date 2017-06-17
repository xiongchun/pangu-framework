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
 * <b>API接口拦截器</b>
 * <p>
 * 拦截/api/*后台接口请求。无实现，可自行扩展。
 * 
 * @author xiongchun
 */
@SuppressWarnings("all")
public class HttpApiFilter implements Filter {

	private static Logger logger = LoggerFactory.getLogger(HttpApiFilter.class);

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
		// 这里可以扩展自己的相应实现
		logger.info(AOSCons.CONSOLE_FLAG3 + "ClientIP：{}，URI：{}", WebCxt.getClientIpAddr(httpRequest),
				httpRequest.getRequestURI());
		// 无实现，可自行扩展
		// do anything
		chain.doFilter(httpRequest, httpResponse);
	}

	/**
	 * 释放资源
	 */
	@Override
	public void destroy() {
	}

}

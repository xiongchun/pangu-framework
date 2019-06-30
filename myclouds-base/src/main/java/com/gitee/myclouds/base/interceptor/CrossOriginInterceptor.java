package com.gitee.myclouds.base.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 跨域拦截器
 * 
 * <p>外围服务网关已经对跨域问题进行了统一处理，微服务内部可以不再关注跨域。<br>
 * 提示：次类仅提供一个通用参考模版代码，可以重写也根据实际需要在 @see MyConfiguration 中决定是否加载此拦截器。
 * 
 * @author xiongchun
 *
 */
public class CrossOriginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        if (request.getHeader(HttpHeaders.ORIGIN) != null) {
            response.addHeader("Access-Control-Allow-Origin", "*");
            response.addHeader("Access-Control-Allow-Credentials", "true");
            response.addHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, PATCH, DELETE, OPTIONS, TRACE");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type, X-Auth-Token");
            response.addHeader("Access-Control-Max-Age", "86400");
        }
        return true;
    }
	
}

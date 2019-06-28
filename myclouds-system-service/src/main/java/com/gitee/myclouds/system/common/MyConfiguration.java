package com.gitee.myclouds.system.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gitee.myclouds.base.interceptor.GeneralCrossOriginInterceptor;

/**
 * 服务配置
 * 
 * @author xiongchun
 *
 */
@Configuration
public class MyConfiguration implements WebMvcConfigurer{
	
	/**
	 * 可以注册一些拦截器
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//外围服务网关已经对跨域问题进行了统一处理，微服务内部可以不再关注跨域。
		//这里打开微服务的跨域功能，目的是为了开发或测试时候前端可以直连到这个微服务进行联调。
		registry.addInterceptor(new GeneralCrossOriginInterceptor());
		
		//可以参考 GeneralCrossOriginInterceptor 实现各种功能的拦截器。不过不建议在微服务内部做这样的处理，一般拦截动作可以去myclouds-gateway处理。
		//这里提供一份模版代码，供大家酌情使用。
	}
	
}

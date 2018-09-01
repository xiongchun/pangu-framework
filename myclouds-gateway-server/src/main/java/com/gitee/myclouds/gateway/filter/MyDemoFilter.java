package com.gitee.myclouds.gateway.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;

import lombok.extern.slf4j.Slf4j;

/**
 * 演示Filter基本用法
 * 
 * <p>
 * 基于网关系统的过滤器机制，可以实现动态路由、监控、授权、安全、请求统计等诸多功能。
 * 大家尽情发挥即可。
 * 
 * @author xiongchun
 *
 */
@Slf4j
public class MyDemoFilter extends ZuulFilter{
	
	/**
	 * Filter需要执行的动作
	 */
	@Override
	public Object run() {
		//获取当前请求上下文，在这个上下文基础上可以做很多事情了。具体自己查看API。
		RequestContext context = RequestContext.getCurrentContext();
		//获取原始Htpp请求，有这个对象也可以做很多事情了。自己发挥吧。
		HttpServletRequest request = context.getRequest();
		//获取全部参数
		Dto inDto = Dtos.newDto(request);
		log.info("Request请求参数列表：{}", JSON.toJSONString(inDto));
		log.info("Request请求URL：{}", request.getRequestURL());
		//获取指定参数，token之类的安全类参数也可以是在头信息中
		String token = request.getParameter("token");
		//Token的检验逻辑没这么简单，这里只是给大家举个栗子
        if (MyUtil.isNotEmpty(token)) {
        	context.setSendZuulResponse(true); //将请求往后转发
        	context.setResponseStatusCode(200);
        } else {
        	HttpServletResponse response = context.getResponse();
        	response.setHeader("Content-Type", "application/json;charset=UTF-8");
        	context.setSendZuulResponse(false); //终止转发，返回响应报文
        	context.setResponseStatusCode(400);
        	Dto responseDto = Dtos.newDto("code", -1);
        	responseDto.put("msg", "请求被拦截");
        	context.setResponseBody(JSON.toJSONString(responseDto));
        }
        
		return null;
	}

	/**
	 * 是否启用Filter
	 */
	@Override
	public boolean shouldFilter() {

		return true;
	}

	/**
	 * 优先级
	 * <p>定义filter的顺序，数字越小表示顺序越高，越优先执行
	 */
	@Override
	public int filterOrder() {

		return 10; 
	}

	/**
	 *  <b>Filter类型</b>
	 *  <li>PRE： 这种过滤器在请求被路由之前调用。我们可利用这种过滤器实现身份验证、在集群中选择请求的微服务、记录调试信息等。
     *  <li>ROUTING：这种过滤器将请求路由到微服务。这种过滤器用于构建发送给微服务的请求，并使用Apache HttpClient或Netfilx Ribbon请求微服务。
     *  <li>POST：这种过滤器在路由到微服务以后执行。这种过滤器可用来为响应添加标准的HTTP Header、收集统计信息和指标、将响应从微服务发送给客户端等。
      * <li>ERROR：在其他阶段发生错误时执行该过滤器。
	 */
	@Override
	public String filterType() {
		
		return "pre";
	}

}

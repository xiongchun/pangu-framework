package com.gitee.myclouds.gateway.limiter;

import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
import org.springframework.cloud.gateway.route.Route;
import org.springframework.cloud.gateway.support.ServerWebExchangeUtils;
import org.springframework.web.server.ServerWebExchange;

import reactor.core.publisher.Mono;

/**
 * 全局限流Key解析生成
 * 
 * @author xiongchun
 *
 */
public class GlobalKeyResolver implements KeyResolver{

	/**
	 * 动态获取服务实例进行以服务为单位的全局限流配置
	 */
	@Override
	public Mono<String> resolve(ServerWebExchange exchange) {
		Route route = exchange.getRequiredAttribute(ServerWebExchangeUtils.GATEWAY_ROUTE_ATTR);
        String serviceInstanceName = route.getUri().getAuthority(); //获取服务实例名
		return Mono.just(serviceInstanceName);
	}

}

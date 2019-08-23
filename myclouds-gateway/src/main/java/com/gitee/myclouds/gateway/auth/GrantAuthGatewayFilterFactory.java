package com.gitee.myclouds.gateway.auth;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.cloud.gateway.filter.factory.HystrixGatewayFilterFactory;
import org.springframework.cloud.gateway.filter.factory.HystrixGatewayFilterFactory.Config;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;

/**
 * 网关权限过滤器：操作权限鉴权
 * 
 * @author xiongchun
 *
 */
@Component
public class GrantAuthGatewayFilterFactory extends AbstractGatewayFilterFactory<HystrixGatewayFilterFactory.Config> {

	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	public GrantAuthGatewayFilterFactory() {
		super(Config.class);
	}

	// 忽略列表
	private String[] ignorePaths = {};

	@Override
	public GatewayFilter apply(Config config) {
		return (exchange, chain) -> {
			ServerHttpRequest request = exchange.getRequest();
			String path = request.getPath().value();
			if (ArrayUtils.contains(ignorePaths, path)) {
				return chain.filter(exchange);
			}
			
			
			
			return chain.filter(exchange);
			// return response.setComplete(); 跳出过滤链直接返回
		};

	}

}

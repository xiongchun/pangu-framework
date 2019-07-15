package com.gitee.myclouds.gateway.auth;

import java.nio.charset.StandardCharsets;
import java.util.Map;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.cloud.gateway.filter.factory.HystrixGatewayFilterFactory;
import org.springframework.cloud.gateway.filter.factory.HystrixGatewayFilterFactory.Config;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.common.util.CommonCons;
import com.google.common.collect.Maps;

import reactor.core.publisher.Flux;

/**
 * 网关权限过滤器：身份认证鉴权
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
			String tokenName = CommonCons.Common.Token.getValue();
			ServerHttpResponse response = exchange.getResponse();
			String token = exchange.getRequest().getHeaders().getFirst(tokenName);
			Map<String, Object> outMap = Maps.newHashMap();
			if (StringUtils.isEmpty(token)) {
				token = request.getQueryParams().getFirst(tokenName);
			}
			String contentType = "application/json;charset=UTF-8";
			if (StringUtils.isEmpty(token)) {
				response.getHeaders().add("Content-Type", contentType);
				response.setStatusCode(HttpStatus.UNAUTHORIZED);
				outMap.put("code", -901);
				outMap.put("msg", "未授权，请登录授权。");
				DataBuffer buffer = response.bufferFactory()
						.wrap(JSON.toJSONString(outMap).getBytes(StandardCharsets.UTF_8));
				return response.writeWith(Flux.just(buffer));
			}
			String key = CommonCons.RedisKey.Token.getValue() + token;
			if (!stringRedisTemplate.opsForHash().hasKey(key, "id")) {
				response.getHeaders().add("Content-Type", contentType);
				response.setStatusCode(HttpStatus.UNAUTHORIZED);
				outMap.put("code", -902);
				outMap.put("msg", "Token无效或登录已超时，请重新登录。");
				DataBuffer buffer = response.bufferFactory()
						.wrap(JSON.toJSONString(outMap).getBytes(StandardCharsets.UTF_8));
				return response.writeWith(Flux.just(buffer));
			}
			return chain.filter(exchange);
			// return response.setComplete(); 跳出过滤链直接返回
		};

	}

}

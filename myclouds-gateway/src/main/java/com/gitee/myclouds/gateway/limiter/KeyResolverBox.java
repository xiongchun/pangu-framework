package com.gitee.myclouds.gateway.limiter;

import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import reactor.core.publisher.Mono;

/**
 * 限流KEY字段生成
 * <p> 返回的字符串将作为限流器在Redis中键名的一部分
 * 
 * @author xiongchun
 *
 */
@Component
public class KeyResolverBox {
	
	/**
	 * 针对myclouds-system-service的全局限流
	 * 
	 * @return
	 */
    @Bean
    GlobalKeyResolver globalKeyResolver() {
        return new GlobalKeyResolver();
    }
    
	/**
	 * 客户端分离限流，不建议使用，运维过于复杂
	 * <P>可以根据不同的客户端（如ClientHost或userId等）进行精细限流
	 * @return
	 */
    @Bean
    KeyResolver clientKeyResolver() {
    	return exchange -> Mono.just(exchange.getRequest().getRemoteAddress().getAddress().getHostAddress());
        //return exchange -> Mono.just(exchange.getRequiredAttribute("userId"));
    }
    
}

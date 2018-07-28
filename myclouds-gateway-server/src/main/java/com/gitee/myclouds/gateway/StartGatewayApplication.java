package com.gitee.myclouds.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;

import com.gitee.myclouds.gateway.filter.MyDemoFilter;

/**
 * MyClouds网关系统
 * 
 * @author xiongchun
 *
 */
@SpringBootApplication
@EnableZuulProxy
public class StartGatewayApplication{
	
	public static void main(String[] args) throws Exception {		
		SpringApplication.run(StartGatewayApplication.class, args);
	}
	
	//初始化演示Filter
	@Bean
	public MyDemoFilter myDemoFilter() {
		return new MyDemoFilter();
	}

}

package com.gitee.myclouds.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;

@SpringBootApplication
@EnableDiscoveryClient
@EnableHystrix
public class MyGatewayApplication {
	
	public static void main(String[] args) throws Exception {
		SpringApplication.run(MyGatewayApplication.class, args);
	}

}

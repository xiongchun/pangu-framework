package com.gitee.myclouds.admin.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableFeignClients
@ComponentScan(basePackages={"com.gitee.myclouds"}) 
public class StartAdminWebApplication {

	public static void main(String[] args) throws Exception {
		SpringApplication.run(StartAdminWebApplication.class, args);
	}
	
}

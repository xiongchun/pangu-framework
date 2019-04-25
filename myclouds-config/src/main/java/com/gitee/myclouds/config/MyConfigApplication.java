package com.gitee.myclouds.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableDiscoveryClient
@EnableConfigServer
public class MyConfigApplication {
	
	public static void main(String[] args) throws Exception {
		SpringApplication.run(MyConfigApplication.class, args);
	}

}

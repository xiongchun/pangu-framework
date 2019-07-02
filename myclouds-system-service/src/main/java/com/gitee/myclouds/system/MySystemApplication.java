package com.gitee.myclouds.system;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import lombok.extern.slf4j.Slf4j;

@SpringBootApplication
@EnableDiscoveryClient
@EnableTransactionManagement
@EnableCaching
@MapperScan(basePackages = {"com.gitee.myclouds"}, sqlSessionFactoryRef = "sqlSessionFactory")
@ComponentScan(basePackages={"com.gitee.myclouds"})
@Slf4j
public class MySystemApplication {
	
	public static void main(String[] args) throws Exception {
		log.info("Starting MySystemApplication...");
		SpringApplication.run(MySystemApplication.class, args);
		log.info("MySystemApplication started successed - - - -");
	}

}

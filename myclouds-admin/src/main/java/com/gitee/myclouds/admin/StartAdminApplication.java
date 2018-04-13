package com.gitee.myclouds.admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableDiscoveryClient
@EnableTransactionManagement
@MapperScan(basePackages = {"com.gitee.myclouds"}, sqlSessionFactoryRef = "sqlSessionFactory")
@ComponentScan(basePackages={"com.gitee.myclouds"})
public class StartAdminApplication {

	public static void main(String[] args) throws Exception {
		SpringApplication.run(StartAdminApplication.class, args);
		
	}

}

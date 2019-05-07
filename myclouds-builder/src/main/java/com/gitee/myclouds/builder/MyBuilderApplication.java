package com.gitee.myclouds.builder;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.gitee.myclouds.builder.service.BuildDomainService;

@SpringBootApplication
@ComponentScan(basePackages={"com.gitee"})
public class MyBuilderApplication {
	
	public static void main(String[] args){
		ConfigurableApplicationContext  context = SpringApplication.run(MyBuilderApplication.class, args);
		BuildDomainService buildDomainService = context.getBean(BuildDomainService.class);
		buildDomainService.buildDomain();
	}

}

package com.gitee.myclouds.builder;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.gitee.myclouds.builder.service.BuildDomainService;

@SpringBootApplication
@ComponentScan(basePackages={"com.gitee"})
public class StartBuilderApplication {
	
	public static void main(String[] args){
		ConfigurableApplicationContext  context = SpringApplication.run(StartBuilderApplication.class, args);
		BuildDomainService buildDomainService = context.getBean(BuildDomainService.class);
		buildDomainService.buildDomain();
	}

}

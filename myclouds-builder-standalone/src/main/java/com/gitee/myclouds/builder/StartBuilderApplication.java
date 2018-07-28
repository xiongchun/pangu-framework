package com.gitee.myclouds.builder;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.gitee.myclouds.builder.listener.BuilderApplicationStartupListener;

@SpringBootApplication
@ComponentScan(basePackages={"com.gitee"})
public class StartBuilderApplication {
	
	public static void main(String[] args) {
		SpringApplication springApplication = new SpringApplication(StartBuilderApplication.class);
		springApplication.addListeners(new BuilderApplicationStartupListener());
		springApplication.run(args);
	}

}

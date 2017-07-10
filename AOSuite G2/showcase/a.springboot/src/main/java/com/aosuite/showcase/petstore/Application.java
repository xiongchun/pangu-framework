package com.aosuite.showcase.petstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * SpringBoot应用入口
 * 
 * @author xiongchun
 *
 */
@SpringBootApplication
@ComponentScan(basePackages={"com.aosuite"}) 
public class Application{
	
	public static void main(String[] args) throws Exception {
		SpringApplication.run(Application.class, args);
	}

}

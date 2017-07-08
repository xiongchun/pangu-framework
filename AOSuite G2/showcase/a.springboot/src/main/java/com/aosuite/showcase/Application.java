package com.aosuite.showcase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.aosuite.showcase.service.DemoService;

/**
 * SpringBoot应用入口
 * 
 * @author xiongchun
 *
 */
@SpringBootApplication
@ComponentScan(basePackages={"com.aosuite"}) 
public class Application implements CommandLineRunner{

	@Autowired
	private DemoService demoService;
	
	@Override
	public void run(String... arg0) throws Exception {
		demoService.getSum(2);
	}
	
	public static void main(String[] args) throws Exception {
		SpringApplication.run(Application.class, args);
		//SpringApplication.run(Application.class, args).close();
	}

}

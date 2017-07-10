package com.aosuite.showcase.petstore;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.aosuite.showcase.petstore.service.PetStoreService;

/**
 * SpringBoot应用入口
 * 
 * @author xiongchun
 *
 */
@SpringBootApplication
@ComponentScan(basePackages={"com.aosuite"}) 
public class Application implements CommandLineRunner{
	
	@Autowired PetStoreService demoService;
	
	public static void main(String[] args) throws Exception {
		SpringApplication.run(Application.class, args);
	}

	@Override
	public void run(String... arg0) throws Exception {
		demoService.getAvgPetAge();
	}

}

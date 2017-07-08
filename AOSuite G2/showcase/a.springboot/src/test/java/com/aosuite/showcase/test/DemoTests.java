package com.aosuite.showcase.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.junit4.SpringRunner;

import com.aosuite.showcase.service.DemoService;

@RunWith(SpringRunner.class)
@SpringBootTest(classes=DemoTests.class)
@ComponentScan(basePackages={"com.aosuite"}) 
public class DemoTests {

	@Autowired
	private DemoService demoService;
	
	@Test
	public void contextLoads() {
		demoService.getSum(1);
	}

}

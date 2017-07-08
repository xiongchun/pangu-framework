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
	
	//测试Spring容器初始化是否成功
	@Test
	public void contextLoads() {
		
	}
	
	//测试SpringBean注入功能
	@Test
	public void beanLoad() {
		demoService.getSum(2);
	}
	
	//测试Logback日志输出功能
	@Test
	public void logback() {
		
	}

}

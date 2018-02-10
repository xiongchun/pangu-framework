package com.gitee.myclouds.admin.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.junit4.SpringRunner;

import com.gitee.myclouds.admin.common.MyCxt;
import com.gitee.myclouds.admin.modules.cache.CacheCfgService;

@RunWith(SpringRunner.class)
@SpringBootTest(classes=TempTest.class)
@ComponentScan(basePackages={"com.gitee.myclouds"}) 
public class TempTest {

	@Autowired
	private MyCxt myCxt;
	@Autowired
	private CacheCfgService cacheCfgService;
	
	@Test
	public  void test1() {
		System.out.println(1);
	}

}

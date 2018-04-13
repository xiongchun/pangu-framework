package com.gitee.myclouds.admin.test;

import org.springframework.beans.factory.annotation.Autowired;

import com.gitee.myclouds.admin.modules.cache.CacheCfgService;
import com.gitee.myclouds.common.MyCacheCxt;

/*@RunWith(SpringRunner.class)
@SpringBootTest(classes=TempTest.class)
@ComponentScan(basePackages={"com.gitee.myclouds"})*/ 
public class TempTest {

	@Autowired
	private MyCacheCxt myCacheCxt;
	@Autowired
	private CacheCfgService cacheCfgService;
	
	/*@Test*/
	public  void test1() {
		System.out.println(1);
	}

}

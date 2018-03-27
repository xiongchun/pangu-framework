package com.gitee.myclouds.admin.test;

import org.springframework.beans.factory.annotation.Autowired;

import com.gitee.myclouds.admin.common.MyCxt;
import com.gitee.myclouds.admin.modules.cache.CacheCfgService;

/*@RunWith(SpringRunner.class)
@SpringBootTest(classes=TempTest.class)
@ComponentScan(basePackages={"com.gitee.myclouds"})*/ 
public class TempTest {

	@Autowired
	private MyCxt myCxt;
	@Autowired
	private CacheCfgService cacheCfgService;
	
	/*@Test*/
	public  void test1() {
		System.out.println(1);
	}

}

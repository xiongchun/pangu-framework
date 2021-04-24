package org.g4studio.demo.online.web;

import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.common.web.BaseAction;
import org.g4studio.core.metatype.Dto;
import org.g4studio.demo.online.service.DemoService;

public class DoTransactionClient {

	/**
	 * 演示事务控制
	 * 
	 * @author OSWorks-XC
	 * @since 2011-2-30
	 * @see BaseAction
	 */
	public static void main(String[] args) {
		DemoService demoService = (DemoService)SpringBeanLoader.getSpringBean("demoService");
		Dto outDto = demoService.doTransactionTest();
		System.out.println("返回值:\n" + outDto);
	}

}

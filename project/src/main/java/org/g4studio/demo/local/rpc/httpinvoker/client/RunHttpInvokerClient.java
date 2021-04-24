package org.g4studio.demo.local.rpc.httpinvoker.client;

import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.core.metatype.Dto;

/**
 * 测试调用HttpInvoker服务
 * 
 * @author OSWorks-XC
 *
 */
public class RunHttpInvokerClient {

	public static void main(String[] args) {
		sayHello();
		//queryBalanceInfo();
	}
	
	private static void sayHello(){
		 
		HelloWorldClient client = (HelloWorldClient)SpringBeanLoader.getSpringBean("client_httpinvoker");
		client.sayHello("中国");
		long start = System.currentTimeMillis();
		//for (int i = 0; i < 100000; i++) {
			String outString = client.sayHello("中国");
			//System.out.println("Client:" + outString);
	//}
		 long alltime = System.currentTimeMillis() - start;
		 System.out.println("耗时：" + alltime + "ms");
	}
	
	private static void queryBalanceInfo(){
		HelloWorldClient client = (HelloWorldClient)SpringBeanLoader.getSpringBean("client_httpinvoker");
		Dto outDto = client.queryBalanceInfo("BJLK1000000003900");
		System.out.println(outDto);
	}
	
}

package org.g4studio.demo.local.rpc.httpinvoker.client;

import org.g4studio.core.metatype.Dto;

/**
 * Httpinvoker接口
 * 
 * @author OSWorks-XC
 * @since 2010-10-13
 */
public interface HelloWorldClient {
	/**
	 * sayHello
	 * 
	 * @param text
	 * @return
	 */
	public String sayHello(String text);

	/**
	 * 查询一条结算明细测试数据
	 * 
	 * @param jsbh
	 * @return XML字符串
	 */
	public Dto queryBalanceInfo(String jsbh);

}

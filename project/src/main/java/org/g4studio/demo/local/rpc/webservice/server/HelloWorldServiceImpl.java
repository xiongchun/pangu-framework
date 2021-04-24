package org.g4studio.demo.local.rpc.webservice.server;

import javax.jws.WebService;

import org.g4studio.common.dao.Reader;
import org.g4studio.common.util.SpringBeanLoader;
import org.g4studio.core.metatype.BaseDomain;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.xml.XmlHelper;
import org.g4studio.demo.local.rpc.webservice.HelloWorldService;

/**
 * WebService实现类
 * 
 * @author OSWorks-XC
 * @since 2010-10-13
 * @see BaseDomain
 */
@WebService
public class HelloWorldServiceImpl implements HelloWorldService {
	
	/**
	 * sayHello
	 */
	public String sayHello(String text) {
		return "Hello," + text;
	}
	
	/**
	 * 查询一条结算明细测试数据
	 * @param jsbh
	 * @return XML字符串
	 */
	public String queryBalanceInfo(String jsbh){
		Reader reader = (Reader)SpringBeanLoader.getSpringBean("g4Reader");
		Dto inDto = new BaseDto("sxh", jsbh);
		Dto outDto = (BaseDto)reader.queryForObject("Demo.queryBalanceInfo", inDto);
		String outXml = XmlHelper.parseDto2Xml(outDto, "root", "balanceInfo");
		return outXml;
	}

}

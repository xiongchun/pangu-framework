package cn.osworks.aos.temp;

import cn.osworks.aos.core.asset.AOSBeanLoader;
import cn.osworks.aos.system.service.AOSService;



public class Temp1 {
	
	public static void main(String[] argStrings) {
		AOSService aosService = (AOSService)AOSBeanLoader.getSpringBean("aosService");
		System.out.println("a");
		System.out.println(aosService.getValueByParamKey("copyright_"));
		System.out.println("b");
		System.out.println(aosService.getValueByParamKey("copyright_"));
		System.out.println("c");
		System.out.println(aosService.getValueByParamKey("copyright_"));
		try {
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
}

package aos.system.modules.demo;

import org.springframework.stereotype.Service;

/**
 * 范例
 * 
 * @author xiongchun
 *
 */
@Service
public class DemoService {
	
	/**
	 * 
	 * @param name
	 */
	public static void demo1(String name){
		System.out.println("Hi，" + name + "!");
	}
	
	public void demo2(String name){
		System.out.println("Hellow，" + name + "!");
	}
	
	public void demo3(String name){
		System.out.println("Hey，" + name + "!");
	}
	
}

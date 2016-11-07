package aos.system.modules.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aos.system.dao.Aos_cmpDao;

/**
 * 范例
 * 
 * @author xiongchun
 *
 */
@Service
public class DemoService {
	
	@Autowired
	Aos_cmpDao aos_cmpDao;
	
	public static void demo1(String name){
		System.out.println("Hi，" + name + "!");
		
	}
	
	public void demo2(String name){
		System.out.println("Hello，" + name + "!");
	}
	
	public void demo3(String name){
		System.out.println("Hey，" + name + "!");
	}
	
}

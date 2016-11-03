package aos.system.modules.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import aos.framework.core.typewrap.Dtos;
import aos.framework.dao.Test1Dao;
import aos.framework.dao.Test1PO;
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
	@Autowired
	Test1Dao test1Dao;
	
	public static void demo1(String name){
		System.out.println("Hi，" + name + "!");
		
	}
	
	public void demo2(String name){
		System.out.println("Hello，" + name + "!");
	}
	
	public void demo3(String name){
		System.out.println("Hey，" + name + "!");
	}
	
	@Transactional
	public void demo4(String name){
		Test1PO test1po = new Test1PO();
		test1po.setId_("2");
		test1po.setName_("A3");
		test1Dao.insert(test1po);
	}
	
	@Transactional
	public void demo5() throws InterruptedException{
		Thread.sleep(30000);
		test1Dao.list(Dtos.newDto());
	}
	
}

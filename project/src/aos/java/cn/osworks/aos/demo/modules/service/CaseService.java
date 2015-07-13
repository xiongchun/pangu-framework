package cn.osworks.aos.demo.modules.service;

import org.springframework.stereotype.Service;



/**
 * <b>范例Service</b>
 * 
 * @author OSWorks-XC
 * @date 2008-06-06
 */
@Service
public class CaseService {
	
	/**
	 * sayHi
	 * 
	 * @param nameString
	 */
	public void sayHi(String nameString){
		System.out.println("hi, " + nameString + "!");
	}

}

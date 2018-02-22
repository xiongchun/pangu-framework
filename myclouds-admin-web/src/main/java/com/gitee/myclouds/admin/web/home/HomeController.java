package com.gitee.myclouds.admin.web.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页
 * 
 * @author xiongchun
 *
 */
@Controller
public class HomeController {

	@RequestMapping("/")
    public String index(ModelMap map) {
		
        return "index";  
    }
	
	@RequestMapping("login")
    public String test(ModelMap map) {
        map.addAttribute("host", "hi,mw!");
        return "login";  
    }
	
}

package com.gitee.myclouds.admin.web.index;

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
public class IndexController {

	@RequestMapping("/")
    public String index(ModelMap map) {
		
        return "index";  
    }
	
}

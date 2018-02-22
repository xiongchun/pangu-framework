package com.gitee.myclouds.admin.web.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 登录页
 * 
 * @author xiongchun
 *
 */
@Controller
public class LoginController {

	@RequestMapping("/")
    public String login(ModelMap map) {
		
        return "login";  
    }
	
}

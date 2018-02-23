package com.gitee.myclouds.admin.web.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 登录页
 * 
 * @author xiongchun
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@RequestMapping("login")
    public String login(ModelMap map) {
		
        return "login";  
    }
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "login/go", method = { RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public Dto loginCheck(HttpServletRequest request) {
		Dto inDto = Dtos.newDto(request);
		return Dtos.newDto();
	}
	
}

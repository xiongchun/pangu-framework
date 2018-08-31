package com.gitee.myclouds.admin.modules.login;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 登录验证 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("login")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	/**
	 * 登录验证
	 * 
	 * @param inMap
	 * @return
	 */
	@RequestMapping(value = "validate",method = { RequestMethod.POST}, produces = "application/json")
	public Dto validate(@RequestParam Map<String,Object> inMap){
		Dto outDto = loginService.validate(Dtos.newDto(inMap));
		return outDto;
	}
	
}

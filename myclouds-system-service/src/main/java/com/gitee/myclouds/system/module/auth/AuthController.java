package com.gitee.myclouds.system.module.auth;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.wrapper.Dtos;

import cn.hutool.core.map.MapUtil;

/**
 * 身份认证 服务发布
 * 
 * @author xiongchun
 *
 */
@RestController
@RequestMapping("admin/system/auth")
public class AuthController {

	@Autowired
	private AuthService authService;
	
	/**
	 * 登录验证
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "login", produces = "application/json")
	public OutVO login(@RequestBody Map<String,Object> inMap){
		OutVO outVO = new OutVO(0);
		outVO.setData(authService.login(Dtos.newDto(inMap)));
		outVO.setMsg("身份认证通过");
		return outVO;
	}
	
	/**
	 * 注销
	 * 
	 * @param inMap
	 * @return
	 */
	@PostMapping(value = "logout", produces = "application/json")
	public OutVO logout(@RequestBody Map<String,Object> inMap){
		OutVO outVO = new OutVO(0);
		authService.logout(MapUtil.getStr(inMap, "token"));
		outVO.setMsg("用户注销成功");
		return outVO;
	}
}

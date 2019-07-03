package com.gitee.myclouds.system.module.auth;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

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
		Dto outDto = authService.login(Dtos.newDto(inMap));
		outVO.setData(outDto.getMyCat());
		outVO.setCode(outDto.getInteger("code") == null ? 0 : outDto.getInteger("code"));
		outVO.setCode(outDto.getInteger("code") == null ? 0 : outDto.getInteger("code"));
		if (MyUtil.isNotEmpty(outDto.getInteger("code"))) {
			outVO.setCode(outDto.getInteger("code"));
			outVO.setMsg(outDto.getString("msg"));
		}else {
			outVO.setMsg(outDto.getString("用户认证通过"));
		}
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
		OutVO outVO = authService.logout(Dtos.newDto(inMap));
		return outVO;
	}
}

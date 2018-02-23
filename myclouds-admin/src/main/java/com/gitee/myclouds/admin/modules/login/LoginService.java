package com.gitee.myclouds.admin.modules.login;

import org.springframework.stereotype.Service;

import com.gitee.myclouds.admin.domain.myparam.MyParamEntity;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 * 登录服务
 * 
 * @author xiongchun
 *
 */
@Service
public class LoginService {
	
	/**
	 * 用户登录验证
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto loginCheck(Dto inDto) {
		Dto outDto = null;
		MyParamEntity myParamEntity = new MyParamEntity().copyFrom(inDto);
		if (true) {
			outDto = Dtos.newPlainDto("code:1", "msg:键值参数保存成功");
		} else {
			outDto = Dtos.newPlainDto("code:-1", "msg:参数键已经存在，请重新输入...");
		}
		return outDto;
	}
}

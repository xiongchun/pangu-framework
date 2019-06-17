package com.gitee.myclouds.system.module.auth;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.domain.myorg.MyOrgEntity;
import com.gitee.myclouds.system.domain.myorg.MyOrgMapper;
import com.gitee.myclouds.system.domain.myuser.MyUserEntity;
import com.gitee.myclouds.system.domain.myuser.MyUserMapper;

import cn.hutool.core.date.DateUtil;

/**
 * 身份认证
 * 
 * @author xiongchun
 *
 */
@Service
public class AuthService {

	@Autowired
	private MyUserMapper myUserMapper;
	@Autowired
	private MyOrgMapper myOrgMapper;

	/**
	 * 用户登录验证
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO login(Dto inDto) {
		OutVO outVO = new OutVO(0);
		MyUserEntity myUserEntity = myUserMapper.selectByUkey1(inDto.getString("account"));
		if (MyUtil.isEmpty(myUserEntity)) {
			outVO.setCode(1).setMsg("用户名错误，请重新输入");
			return outVO;
		}
		if (!StringUtils.equals(MyUtil.password(MyCons.PWD_KEY, inDto.getString("password")),
				myUserEntity.getPassword())) {
			outVO.setCode(2).setMsg("密码错误，请重新输入");
			return outVO;
		}
		//TODO 验证码校验

		//返回当前用户相关信息
		Dto userInfoDto = Dtos.newDto();
		MyUtil.copyProperties(myUserEntity, userInfoDto);
		userInfoDto.set("login_time", DateUtil.now());
		MyOrgEntity myOrgEntity = myOrgMapper.selectByKey(myUserEntity.getOrg_id());
		userInfoDto.set("org", myOrgEntity);
		outVO.setData(userInfoDto);
		outVO.setMsg("身份认证通过");
		return outVO;
	}
}

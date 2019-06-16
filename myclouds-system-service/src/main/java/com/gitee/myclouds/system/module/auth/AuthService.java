package com.gitee.myclouds.system.module.auth;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.base.vo.UserVO;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.domain.myuser.MyUserEntity;
import com.gitee.myclouds.system.domain.myuser.MyUserMapper;

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
	private SqlSession sqlSession;
	
	/**
	 * 用户登录验证
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto login(Dto inDto) {
		Dto outDto = Dtos.newDto().set("code", "1").set("msg", "用户登录验证通过");
		MyUserEntity myUserEntity = myUserMapper.selectByUkey1(inDto.getString("account"));
		if (MyUtil.isEmpty(myUserEntity)) {
			outDto.set("code", "-1").set("msg", "登录账号输入错误，请重新输入");
		}else {
			if (!StringUtils.equals(MyUtil.password(MyCons.PWD_KEY, inDto.getString("password")), myUserEntity.getPassword())) {
				outDto.set("code", "-1").set("msg", "密码输入错误，请重新输入");
			}
		}
		if (MyCons.YesOrNo.YES.getValue() == outDto.getInteger("code").intValue()) {
			UserVO myUser = new UserVO();
			myUser.setId(myUserEntity.getId());
			myUser.setAccount(myUserEntity.getAccount());
			myUser.setName(myUserEntity.getName());
			myUser.setOrgId(myUserEntity.getOrg_id());
			outDto.put("myUser", myUser);
			//--------获取用户所属角色ID集合
			List<String> roleIds = sqlSession.selectList("sql.login.selectRoleIdsByUserId", myUserEntity.getId());
			outDto.put("roleIds", roleIds);
		}
		return  outDto;
	}
}

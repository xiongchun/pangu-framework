package com.gitee.myclouds.admin.modules.login;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.admin.domain.myuser.MyUserEntity;
import com.gitee.myclouds.admin.domain.myuser.MyUserMapper;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.vo.MyUserVO;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 登录服务
 * 
 * @author xiongchun
 *
 */
@Service
public class LoginService {

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
	public Dto validate(Dto inDto) {
		Dto outDto = Dtos.newDto().put2("code", "1").put2("msg", "用户登录验证通过");
		MyUserEntity myUserEntity = myUserMapper.selectByUkey1(inDto.getString("account"));
		if (MyUtil.isEmpty(myUserEntity)) {
			outDto.put2("code", "-1").put2("msg", "登录账号输入错误，请重新输入");
		}else {
			if (!StringUtils.equals(MyUtil.password(MyCons.PWD_KEY, inDto.getString("password")), myUserEntity.getPassword())) {
				outDto.put2("code", "-1").put2("msg", "密码输入错误，请重新输入");
			}
		}
		if (MyCons.YesOrNo.YES.getValue() == outDto.getInteger("code").intValue()) {
			MyUserVO myUser = new MyUserVO();
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

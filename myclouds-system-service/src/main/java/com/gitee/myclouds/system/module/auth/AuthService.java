package com.gitee.myclouds.system.module.auth;

import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.base.util.BaseCons;
import com.gitee.myclouds.base.vo.OrgVO;
import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.base.vo.UserVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.system.domain.myorg.MyOrgEntity;
import com.gitee.myclouds.system.domain.myorg.MyOrgMapper;
import com.gitee.myclouds.system.domain.myuser.MyUserEntity;
import com.gitee.myclouds.system.domain.myuser.MyUserMapper;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;

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
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private StringRedisTemplate stringRedisTemplate;

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
		if (!StringUtils.equals(MyUtil.password(BaseCons.PWD_KEY, inDto.getString("password")),
				myUserEntity.getPassword())) {
			outVO.setCode(2).setMsg("密码错误，请重新输入");
			return outVO;
		}
		// TODO 验证码校验

		// TEMP CODE 数据收集
		sqlSession.insert("sql.auth.insertTemp", inDto.getString("device"));

		// 返回当前用户相关信息
		UserVO userVO = new UserVO();
		MyUtil.copyProperties(myUserEntity, userVO);
		MyOrgEntity myOrgEntity = myOrgMapper.selectByKey(myUserEntity.getOrg_id());
		OrgVO orgVO = new OrgVO();
		MyUtil.copyProperties(myOrgEntity, orgVO);
		userVO.setOrgVO(orgVO);
		outVO.setData(createToken(userVO));
		outVO.setMsg("身份认证通过");
		return outVO;
	}

	/**
	 * 生成Token
	 * <p>
	 * 这里只是简单的使用UUID作为Token，且后端会进行存储。（对于Web后端项目，建议这样简单处理就够了）
	 * <p>
	 * 你也可以自由扩展为引入业务字段、时间戳、设备识别码、MD5签名组合后再加密的复杂token。后端也可以不存储，使用类JWT自验证的模式。
	 * 
	 * @return
	 */
	private UserVO createToken(UserVO userVO) {
		String token = IdUtil.simpleUUID().toUpperCase();
		userVO.setToken(token);
		String key = BaseCons.RedisKey.Token.getValue() + token;
		stringRedisTemplate.opsForHash().put(key, "id", token);
		stringRedisTemplate.opsForHash().put(key, "createTime", DateUtil.now());
		stringRedisTemplate.opsForHash().put(key, "userVO", JSON.toJSONString(userVO));
		stringRedisTemplate.expire(key, 60*8, TimeUnit.MINUTES);
		return userVO;
	}
	
	/**
	 * 用户注销
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO logout(Dto inDto) {
		OutVO outVO = new OutVO(0);
		String token = inDto.getString("token");
		if (MyUtil.isNotEmpty(token)) {
			String key = BaseCons.RedisKey.Token.getValue() + token;
			stringRedisTemplate.delete(key);
		}
		outVO.setMsg("用户注销成功");
		return outVO;
	}
}

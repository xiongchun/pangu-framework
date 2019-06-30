package com.gitee.myclouds.base;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.base.util.BaseCons;
import com.gitee.myclouds.base.vo.UserVO;
import com.gitee.myclouds.common.util.MyUtil;

/**
 * Web应用上下文
 * 
 * @author xiongchun
 *
 */
@Component
public class WebContext {
	
	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	/**
	 * 获取后台系统登录用户对象
	 * 
	 * @param request
	 */
	public UserVO getUserVO(HttpServletRequest request) {
		String token = request.getHeader(BaseCons.Common.Token.getValue());
		UserVO userVO = getUserVO(token);
		return userVO;
	}

	/**
	 * 获取后台系统登录用户对象
	 * 
	 * @param token
	 * @return
	 */
	public UserVO getUserVO(String token) {
		UserVO userVO = null;
		String key = BaseCons.RedisKey.Token.getValue() + token;
		String userVOJson = (String)stringRedisTemplate.opsForHash().get(key, "userVO");
		if (MyUtil.isNotEmpty(userVOJson)) {
			userVO = JSON.parseObject(userVOJson, UserVO.class);
		}
		return userVO;
	}
}

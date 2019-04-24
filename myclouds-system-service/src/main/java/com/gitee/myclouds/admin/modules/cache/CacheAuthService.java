package com.gitee.myclouds.admin.modules.cache;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.admin.domain.myrole.MyRoleEntity;
import com.gitee.myclouds.admin.domain.myrole.MyRoleMapper;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

import cn.hutool.core.date.DateUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * 授权信息缓存服务
 * 
 * @author xiongchun
 *
 */
@Service
@Slf4j
public class CacheAuthService {
	
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MyRoleMapper myRoleMapper;

	/**
	 * 缓存/刷新角色授权信息到Set数据结构中
	 * 
	 * <p>
	 * 一个角色对应一个Set。可用于快速判断url是否在Set中，用于URL合法检测
	 */
	public void cacheOrRefreshRoleAuthToSet(Integer roleId) {
		String key = MyCons.CacheKeyOrPrefix.RoleAuth.getValue() + ":" + roleId;
		// 支持刷新
		stringRedisTemplate.delete(key);
		List<String> authList = sqlSession.selectList("sql.cache.listRoleAuthUrls", roleId);
		for (String url : authList) {
			stringRedisTemplate.opsForSet().add(key, url);
		}
		if (MyUtil.isNotEmpty(authList)) {
			stringRedisTemplate.opsForHash().put(MyCons.CacheKeyOrPrefix.LastCacheTime.getValue(), MyCons.CacheKeyOrPrefix.RoleAuth.getValue(), DateUtil.now());
		}
		log.info("缓存/刷新角色授权信息成功。roleId：{}。", roleId);
	}
	
	/**
	 * 缓存/刷新所有角色授权信息到Set数据结构中
	 * 
	 * <p>
	 * 一个角色对应一个Set。可用于快速判断url是否在Set中，用于URL合法检测
	 */
	public Dto cacheOrRefreshAllRolesAuthToSet() {
		List<MyRoleEntity> myRoleEntities = myRoleMapper.list(Dtos.newDto().put2("is_enable", MyCons.YesOrNo.YES.getValue()));
		for (MyRoleEntity myRoleEntity : myRoleEntities) {
			cacheOrRefreshRoleAuthToSet(myRoleEntity.getId());
		}
		return Dtos.newDto().put2("code", "1").put2("msg", "缓存/刷新角色授权信息成功。");
	}
	
	

}

package com.gitee.myclouds.admin.modules.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;

/**
 * 系统启动时的缓存服务
 * 
 * @author xiongchun
 *
 */
@Service
public class SysInitCacheService {

	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	@Autowired
	private CacheCfgService cacheCfgService;
	@Autowired
	private CacheMiscService cacheMiscService;
	@Autowired
	private CacheAuthService cacheAuthService;

	/**
	 * 系统启动时的缓存加载逻辑
	 * 
	 * <p>只会在缓存服务器中没有检测到已缓存标识Key的情况下才加载缓存。强制刷缓存请使用其他API。
	 */
	public void init() {
		if (MyUtil.isEmpty(stringRedisTemplate.opsForHash().get(MyCons.CacheKeyOrPrefix.LastCacheTime.getValue(),
				MyCons.CacheKeyOrPrefix.MyParam.getValue()))) {
			cacheCfgService.initCacheParams();
		}
		if (MyUtil.isEmpty(stringRedisTemplate.opsForHash().get(MyCons.CacheKeyOrPrefix.LastCacheTime.getValue(),
				MyCons.CacheKeyOrPrefix.MyEnum.getValue()))) {
			cacheCfgService.initCacheEnums();
		}
		if (MyUtil.isEmpty(stringRedisTemplate.opsForHash().get(MyCons.CacheKeyOrPrefix.LastCacheTime.getValue(),
				MyCons.CacheKeyOrPrefix.MyModule.getValue()))) {
			cacheMiscService.cacheModules();
		}
		if (MyUtil.isEmpty(stringRedisTemplate.opsForHash().get(MyCons.CacheKeyOrPrefix.LastCacheTime.getValue(),
				MyCons.CacheKeyOrPrefix.RoleAuth.getValue()))) {
			cacheAuthService.cacheOrRefreshAllRolesAuthToSet();
		}
	}
}

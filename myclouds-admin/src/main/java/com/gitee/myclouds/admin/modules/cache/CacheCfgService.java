package com.gitee.myclouds.admin.modules.cache;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.admin.domain.myenum.MyEnumEntity;
import com.gitee.myclouds.admin.domain.myenum.MyEnumMapper;
import com.gitee.myclouds.admin.domain.myparam.MyParamEntity;
import com.gitee.myclouds.admin.domain.myparam.MyParamMapper;
import com.gitee.myclouds.toolbox.util.MyCons;
import com.gitee.myclouds.toolbox.util.MyUtil;

/**
 * 配置项缓存服务
 * 
 * @author xiongchun
 *
 */
@Service
public class CacheCfgService {

	private static Logger log = LoggerFactory.getLogger(CacheCfgService.class);

	@Autowired
	private MyParamMapper myParamMapper;
	@Autowired
	private MyEnumMapper myEnumMapper;
	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	/**
	 * 初始化缓存参数
	 */
	public void initCacheCfg() {
		initCacheParams();
		initCacheEnums();
	}

	/**
	 * 初始化缓存键值参数
	 */
	public void initCacheParams() {
		List<MyParamEntity> myParamEntities = myParamMapper.list(null);
		for (MyParamEntity myParamEntity : myParamEntities) {
			String key = MyCons.CacheKeyPrefix.MyParam.getValue() + myParamEntity.getParam_key();
			stringRedisTemplate.opsForValue().set(key, myParamEntity.toJson());
		}
		log.info("完成键值参数初始化缓存");
	}

	/**
	 * 初始化缓存枚举参数
	 */
	public void initCacheEnums() {
		List<MyEnumEntity> myEnumEntities = myEnumMapper.list(null);
		for (MyEnumEntity myEnumEntity : myEnumEntities) {
			String key = MyCons.CacheKeyPrefix.myEnum.getValue() + myEnumEntity.getEnum_key();
			stringRedisTemplate.opsForHash().put(key, myEnumEntity.getElement_key(), myEnumEntity.toJson());
		}
		log.info("完成枚举参数初始化缓存");
	}

	/**
	 * 缓存\刷新指定键值参数
	 * 
	 * @param myParamEntity
	 */
	public void cacheParam(MyParamEntity myParamEntity) {
		if (MyUtil.isNotEmpty(myParamEntity)) {
			String key = MyCons.CacheKeyPrefix.MyParam.getValue() + myParamEntity.getParam_key();
			stringRedisTemplate.opsForValue().set(key, myParamEntity.toJson());
			log.info("缓存或刷新指定键值参数成功");
		}
	}

	/**
	 * 从缓存系统中删除指定键值参数
	 * 
	 * @param myParamEntity
	 */
	public void deleteParamFromCache(String paramKey) {
		if (MyUtil.isNotEmpty(paramKey)) {
			String key = MyCons.CacheKeyPrefix.MyParam.getValue() + paramKey;
			stringRedisTemplate.delete(key);
			log.info("删除指定键值参数成功");
		}
	}
	
	/**
	 * 从缓存系统中删除指定枚举元素
	 * 
	 * @param myParamEntity
	 */
	public void deleteEnumFromCache(String enumKey, String elementKey) {
		if (MyUtil.isNotEmpty(enumKey) && MyUtil.isNotEmpty(elementKey)) {
			String key = MyCons.CacheKeyPrefix.myEnum.getValue() + enumKey;
			stringRedisTemplate.opsForHash().delete(key, elementKey);
			log.info("删除指定枚举元素成功");
		}
	}

}

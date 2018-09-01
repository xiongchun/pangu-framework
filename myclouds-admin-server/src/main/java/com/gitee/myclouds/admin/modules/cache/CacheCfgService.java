package com.gitee.myclouds.admin.modules.cache;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.admin.domain.myenum.MyEnumEntity;
import com.gitee.myclouds.admin.domain.myenum.MyEnumMapper;
import com.gitee.myclouds.admin.domain.myparam.MyParamEntity;
import com.gitee.myclouds.admin.domain.myparam.MyParamMapper;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

import cn.hutool.core.date.DateUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * 配置项缓存服务
 * 
 * @author xiongchun
 *
 */
@Service
@Slf4j
public class CacheCfgService {

	@Autowired
	private MyParamMapper myParamMapper;
	@Autowired
	private MyEnumMapper myEnumMapper;
	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	/**
	 * 同步配置类缓存
	 */
	public Dto syncCfgCache(Dto inDto) {
		String type = inDto.getString("type");
		Dto outDto = Dtos.newDto("code", "1");
		if (MyUtil.isEmpty(type)) {
			initCacheParams();
			initCacheEnums();
			outDto.put("msg", "键值参数缓存同步成功。枚举类型参数缓存同步成功。");
		} else {
			if (StringUtils.equals(type, "enum")) {
				initCacheEnums();
				outDto.put("msg", "枚举类型参数缓存同步成功。");
			} else if (StringUtils.equals(type, "kv")) {
				initCacheParams();
				outDto.put("msg", "键值参数缓存同步成功。");
			}
		}
		return outDto;
	}

	/**
	 * 初始化缓存键值参数
	 */
	public void initCacheParams() {
		List<MyParamEntity> myParamEntities = myParamMapper.list(null);
		for (MyParamEntity myParamEntity : myParamEntities) {
			String key = MyCons.CacheKeyOrPrefix.MyParam.getValue() + ":" + myParamEntity.getParam_key();
			stringRedisTemplate.opsForValue().set(key, myParamEntity.toJson());
		}
		stringRedisTemplate.opsForHash().put(MyCons.CacheKeyOrPrefix.LastCacheTime.getValue(), MyCons.CacheKeyOrPrefix.MyParam.getValue(), DateUtil.now());
		log.info("完成键值参数Redis缓存");
	}

	/**
	 * 初始化缓存枚举参数
	 */
	public void initCacheEnums() {
		List<MyEnumEntity> myEnumEntities = myEnumMapper.list(null);
		for (MyEnumEntity myEnumEntity : myEnumEntities) {
			String key = MyCons.CacheKeyOrPrefix.MyEnum.getValue() + ":" + myEnumEntity.getEnum_key();
			stringRedisTemplate.opsForHash().put(key, myEnumEntity.getElement_key(), myEnumEntity.toJson());
		}
		stringRedisTemplate.opsForHash().put(MyCons.CacheKeyOrPrefix.LastCacheTime.getValue(), MyCons.CacheKeyOrPrefix.MyEnum.getValue(), DateUtil.now());
		log.info("完成枚举参数Redis缓存");
	}

	/**
	 * 缓存\刷新指定键值参数
	 * 
	 * @param myParamEntity
	 */
	public void cacheParam(MyParamEntity myParamEntity) {
		if (MyUtil.isNotEmpty(myParamEntity)) {
			String key = MyCons.CacheKeyOrPrefix.MyParam.getValue() + ":" + myParamEntity.getParam_key();
			stringRedisTemplate.opsForValue().set(key, myParamEntity.toJson());
			log.info("缓存或刷新指定键值参数成功");
		}
	}

	/**
	 * 缓存\刷新指定枚举元素
	 * 
	 * @param myParamEntity
	 */
	public void cacheEnum(MyEnumEntity myEnumEntity) {
		if (MyUtil.isNotEmpty(myEnumEntity)) {
			String key = MyCons.CacheKeyOrPrefix.MyEnum.getValue() + ":" + myEnumEntity.getEnum_key();
			stringRedisTemplate.opsForHash().put(key, myEnumEntity.getElement_key(), myEnumEntity.toJson());
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
			String key = MyCons.CacheKeyOrPrefix.MyParam.getValue() + ":" + paramKey;
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
			String key = MyCons.CacheKeyOrPrefix.MyEnum.getValue() + ":" + enumKey;
			stringRedisTemplate.opsForHash().delete(key, elementKey);
			log.info("删除指定枚举元素成功");
		}
	}

}

package com.gitee.myclouds.common;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.myenum.MyEnumEntity;
import com.gitee.myclouds.admin.domain.mymodule.MyModuleEntity;
import com.gitee.myclouds.admin.domain.myparam.MyParamEntity;
import com.gitee.myclouds.toolbox.util.MyCons;
import com.gitee.myclouds.toolbox.util.MyListUtil;
import com.gitee.myclouds.toolbox.util.MyUtil;
import com.gitee.myclouds.toolbox.wrap.Dtos;
import com.google.common.collect.Lists;

/**
 * 缓存上下文服务
 * 
 * <p>仅用于取出不用于压入
 * 
 * @author xiongchun
 *
 */
@Service
public class MyCacheCxt {
	
	private static Logger log = LoggerFactory.getLogger(MyCacheCxt.class);

	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	/**
	 * 获取键值参数对象
	 * 
	 * @param paramKey
	 * @return
	 */
	public MyParamEntity getParam(String paramKey) {
		String key = MyCons.CacheKeyOrPrefix.MyParam.getValue() + ":" + paramKey;
		MyParamEntity myParamEntity = null;
		try {
			String json = stringRedisTemplate.opsForValue().get(key);
			myParamEntity = JSON.parseObject(json, MyParamEntity.class);
		} catch (Exception e) {
			log.error("获取键值参数：【{}】时反生错误", paramKey);
			e.printStackTrace();
		}
		return myParamEntity;
	}
	
	/**
	 * 获取键值参数值
	 * 
	 * @param paramKey
	 * @return
	 */
	public String getParamValue(String paramKey) {
		MyParamEntity myParamEntity = getParam(paramKey);
		return MyUtil.isEmpty(myParamEntity) ? StringUtils.EMPTY : myParamEntity.getValue();
	}
	
	/**
	 * 获取键值参数值
	 * 
	 * @param paramKey
	 * @param defaultValue
	 * @return
	 */
	public String getParamValue(String paramKey, String defaultValue) {
		String value = getParamValue(paramKey);
		return MyUtil.isEmpty(value) ? defaultValue : value;
	}
	
	/**
	 * 获取枚举元素列表
	 * 
	 * @param elementKey
	 * @return
	 */
	public List<MyEnumEntity> getEnum(String enumKey){
		String key = MyCons.CacheKeyOrPrefix.MyEnum.getValue() + ":" + enumKey;
		List<MyEnumEntity> myEnumEntities = Lists.newArrayList();
		try {
			List<Object> enumObjs = stringRedisTemplate.opsForHash().values(key);
			for (Object obj : enumObjs) {
				myEnumEntities.add(JSON.parseObject(String.valueOf(obj), MyEnumEntity.class));
			}
		} catch (Exception e) {
			log.error("获取枚举类型：【{}】时反生错误", enumKey);
			e.printStackTrace();
		}
		return myEnumEntities;
	}
	
	/**
	 * 获取枚举元素对象
	 * 
	 * @param enumKey
	 * @param elementKey
	 * @return
	 */
	public MyEnumEntity getEnumElement(String enumKey, String elementKey) {
		List<MyEnumEntity> myEnumEntities = getEnum(enumKey);
		String jql = "SELECT * FROM :MyList WHERE element_key = :elementKey";
		MyEnumEntity myEnumEntity = (MyEnumEntity)MyListUtil.selectOne(myEnumEntities, MyEnumEntity.class, jql, Dtos.newDto("elementKey", elementKey));
		return myEnumEntity;
	}
	
	/**
	 * 获取枚举元素值
	 * 
	 * @param enumKey
	 * @param elementKey
	 * @return
	 */
	public String getEnumElementValue(String enumKey, String elementKey) {
		MyEnumEntity myEnumEntity = getEnumElement(enumKey, elementKey);
		return MyUtil.isEmpty(myEnumEntity) ? StringUtils.EMPTY : myEnumEntity.getElement_value();
	}
	
	/**
	 * 获取枚举元素值
	 * 
	 * @param enumKey
	 * @param elementKey
	 * @param defaultValue
	 * @return
	 */
	public String getEnumElementValue(String enumKey, String elementKey, String defaultValue) {
		String value = getEnumElementValue(enumKey, elementKey);
		return MyUtil.isEmpty(value) ? defaultValue : value;
	}
	
	/**
	 * 根据ID从缓存中获取模块菜单实体
	 * 
	 * @param id
	 * @return
	 */
	public MyModuleEntity getMyModuleEntityFromCacheById(String id) {
		Object object = stringRedisTemplate.opsForHash().get(MyCons.CacheKeyOrPrefix.MyModule.getValue(), id);
		if (MyUtil.isEmpty(object)) {
			return null;
		}
		return JSON.parseObject(object.toString(), MyModuleEntity.class);
	}
}

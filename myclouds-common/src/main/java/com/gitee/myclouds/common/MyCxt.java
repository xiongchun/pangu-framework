package com.gitee.myclouds.common;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyListUtil;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.vo.EnumVO;
import com.gitee.myclouds.common.vo.ModuleVO;
import com.gitee.myclouds.common.vo.ParamVO;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.google.common.collect.Lists;

/**
 * 平台上下文服务
 * 
 * <p>为了不污染依赖工程，此处不使用@Service注解。由依赖工程的启动类决定是否去@import这个资源。
 * <br>比如，有的工程并不需要连接redis连接，如果这里直接@Service的话会使依赖myclouds-common的工程强制依赖redis。
 * 
 * @author xiongchun
 *
 */
public class MyCxt {
	
	private static Logger log = LoggerFactory.getLogger(MyCxt.class);

	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	/**
	 * 获取键值参数对象
	 * 
	 * @param paramKey
	 * @return
	 */
	public ParamVO getParamVO(String paramKey) {
		String key = MyCons.CacheKeyOrPrefix.MyParam.getValue() + ":" + paramKey;
		ParamVO paramVO = null;
		try {
			String json = stringRedisTemplate.opsForValue().get(key);
			paramVO = JSON.parseObject(json, ParamVO.class);
		} catch (Exception e) {
			log.error("获取键值参数：【{}】时反生错误", paramKey);
			e.printStackTrace();
		}
		return paramVO;
	}
	
	/**
	 * 获取键值参数值
	 * 
	 * @param paramKey
	 * @return
	 */
	public String getParamValue(String paramKey) {
		ParamVO paramVO = getParamVO(paramKey);
		return MyUtil.isEmpty(paramVO) ? StringUtils.EMPTY : paramVO.getValue();
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
	public List<EnumVO> getEnum(String enumKey){
		String key = MyCons.CacheKeyOrPrefix.MyEnum.getValue() + ":" + enumKey;
		List<EnumVO> myEnumEntities = Lists.newArrayList();
		try {
			List<Object> enumObjs = stringRedisTemplate.opsForHash().values(key);
			for (Object obj : enumObjs) {
				myEnumEntities.add(JSON.parseObject(String.valueOf(obj), EnumVO.class));
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
	public EnumVO getEnumVO(String enumKey, String elementKey) {
		List<EnumVO> myEnumEntities = getEnum(enumKey);
		String jql = "SELECT * FROM :MyList WHERE element_key = :elementKey";
		EnumVO enumVO = (EnumVO)MyListUtil.selectOne(myEnumEntities, EnumVO.class, jql, Dtos.newDto("elementKey", elementKey));
		return enumVO;
	}
	
	/**
	 * 获取枚举元素值
	 * 
	 * @param enumKey
	 * @param elementKey
	 * @return
	 */
	public String getEnumElementValue(String enumKey, String elementKey) {
		EnumVO enumVO = getEnumVO(enumKey, elementKey);
		return MyUtil.isEmpty(enumVO) ? StringUtils.EMPTY : enumVO.getElement_value();
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
	public ModuleVO getModuleVOFromCacheById(String id) {
		Object object = stringRedisTemplate.opsForHash().get(MyCons.CacheKeyOrPrefix.MyModule.getValue(), id);
		if (MyUtil.isEmpty(object)) {
			return null;
		}
		return JSON.parseObject(object.toString(), ModuleVO.class);
	}
}

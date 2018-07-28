package com.gitee.myclouds.admin.test;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.myenum.MyEnumEntity;
import com.gitee.myclouds.admin.domain.myparam.MyParamEntity;
import com.gitee.myclouds.common.MyCacheCxt;

/**
 * 单元测试（综合、杂项）
 * 
 * @author xiongchun
 *
 */
public class CfgCacheApiTest {
	
	private static Logger log = LoggerFactory.getLogger(CfgCacheApiTest.class);
	
	private MyCacheCxt myCacheCxt;
	
	/**
	 * 演示基础配置数据 API
	 */
	public void testBasicCfgDataApi() {
		//获取键值参数对象
		MyParamEntity myParamEntity = myCacheCxt.getParam("default_theme");
		log.info("键值参数对象JSON序列化值：{}", myParamEntity.toJson());
		//直接获取键值参数值
		String paramValue = myCacheCxt.getParamValue("default_theme");
		log.info("键值参数值：{}", paramValue);
		//获取枚举元素对象列表
		List<MyEnumEntity> myEnumEntities = myCacheCxt.getEnum("sex");
		log.info("枚举元素对象列表JSON序列化值：{}", JSON.toJSON(myEnumEntities));
		//获取枚举元素对象
		MyEnumEntity myEnumEntity = myCacheCxt.getEnumElement("sex", "1");
		log.info("枚举元素对象JSON序列化值：{}", myEnumEntity.toJson());
		//直接获取枚举元素参数值
		String enumElementValue = myCacheCxt.getEnumElementValue("sex", "2");
		log.info("枚举元素参数值：{}", enumElementValue);
		assertNotNull(paramValue);
		assertNotNull(enumElementValue);
	}
	
}

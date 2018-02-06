package com.gitee.myclouds.admin.test;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.common.MyCxt;
import com.gitee.myclouds.admin.domain.myenum.MyEnumEntity;
import com.gitee.myclouds.admin.domain.myparam.MyParamEntity;

/**
 * 单元测试（综合、杂项）
 * 
 * @author xiongchun
 *
 */
public class MiscTest {
	
	private static Logger log = LoggerFactory.getLogger(MiscTest.class);
	
	private MyCxt myCxt;
	
	/**
	 * 演示基础配置数据API
	 */
	public void testBasicCfgDataApi() {
		//获取键值参数对象
		MyParamEntity myParamEntity = myCxt.getParam("default_theme");
		log.info("键值参数对象JSON序列化值：{}", myParamEntity.toJson());
		//直接获取键值参数值
		String paramValue = myCxt.getParamValue("default_theme");
		log.info("键值参数值：{}", paramValue);
		//获取枚举元素对象列表
		List<MyEnumEntity> myEnumEntities = myCxt.getEnum("sex");
		log.info("枚举元素对象列表JSON序列化值：{}", JSON.toJSON(myEnumEntities));
		//获取枚举元素对象
		MyEnumEntity myEnumEntity = myCxt.getEnumElement("sex", "1");
		log.info("枚举元素对象JSON序列化值：{}", myEnumEntity.toJson());
		//直接获取枚举元素参数值
		String enumElementValue = myCxt.getEnumElementValue("sex", "1");
		log.info("枚举元素参数值：{}", enumElementValue);
		assertNotNull(paramValue);
		assertNotNull(enumElementValue);
	}
	
}

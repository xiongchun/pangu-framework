package com.osworks.test.testcase;

import java.util.List;

import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.modules.cache.DicVO;

/**
 * 缓存测试
 * 
 * @author xiongchun
 *
 */
public class CacheTest {

	public static void main(String[] args) {
		initCache();
	}
	
	private static void initCache() {
		//获取全局参数
		String app_title_ = AOSCxt.getParam("app_title_");
		System.out.println(app_title_);
		//获取字典集合
		List<DicVO> dicVOs = AOSCxt.getDicList("org_type_");
		System.out.println(AOSJson.toJson(dicVOs));
		String desc = AOSCxt.getDicDesc("org_type_", "1");
		System.out.println(desc);
	}

}

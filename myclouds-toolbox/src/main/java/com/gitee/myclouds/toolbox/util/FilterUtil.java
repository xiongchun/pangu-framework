package com.gitee.myclouds.toolbox.util;

import org.apache.commons.lang3.StringUtils;

/**
 * 过滤器工具类
 * 
 * @author xiongchun
 */
public class FilterUtil {

	/**
	 * 检查排除列表
	 * 
	 * TODO 排除算法后期需要优，这里简单实现一个版本。
	 * 
	 * @return
	 */
	public static boolean checkExcludes(String uri, String[] excludeKeysArray) {
		boolean isExclude = false;
		for (String key : excludeKeysArray) {
			if (StringUtils.indexOf(StringUtils.lowerCase(uri), StringUtils.lowerCase(key)) > -1) {
				isExclude = true;
				continue;
			}
		}
		return isExclude;
	}
	
}

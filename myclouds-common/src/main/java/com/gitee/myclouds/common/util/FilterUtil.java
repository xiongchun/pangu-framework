package com.gitee.myclouds.common.util;

import cn.hutool.core.util.StrUtil;

/**
 * 过滤器工具类
 * 
 * @author xiongchun
 */
public class FilterUtil {

	/**
	 * 检查排除列表
	 * 
	 * @return
	 */
	public static boolean checkExcludes(String uri, String[] excludeKeysArray) {
		boolean isExclude = false;
		for (String key : excludeKeysArray) {
			if (StrUtil.startWithIgnoreCase(uri, key)) {
				isExclude = true;
				break;
			}
		}
		return isExclude;
	}
	
	public static void main(String[] args) {
		String[] excludeKeysArray = {"/login/","/theme"};
		String uri = "/login";
		System.out.println(checkExcludes(uri, excludeKeysArray));
	}
	
}

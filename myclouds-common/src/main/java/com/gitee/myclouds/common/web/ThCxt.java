package com.gitee.myclouds.common.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.common.MyCxt;

/**
 * Thymeleaf模版引擎上下文
 * 
 * <p>提示：此类仅提供模版文件中调用后台服务使用
 * 
 * @author xiongchun
 *
 */
@Service
public class ThCxt {
	
	@Autowired
	private MyCxt myCxt;
	
	/**
	 * 获取键值参数值
	 * 
	 * @param paramKey
	 * @return
	 */
	public String param(String paramKey) {
		return myCxt.getParamValue(paramKey);
	}
	
}

package com.gitee.myclouds.toolbox.wrap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.gitee.myclouds.toolbox.util.WebCxt;
import com.gitee.myclouds.toolbox.wrap.impl.HashDto;


/**
 * <b>数据传输对象实例化辅助类</b>
 * 
 * @author xiongchun
 * @date 2008-07-06
 */
public class Dtos {

	/**
	 * 创建一个常规的Dto对象
	 * 
	 */
	public static Dto newDto() {
		return new HashDto();
	}
	
	/**
	 * 在Map的基础上克隆一个常规Dto对象
	 * @param map
	 * @return
	 */
	public static Dto newDto(Map<String, ?> map) {
		Dto newDto = new HashDto();
		newDto.putAll(map);
		return newDto;
	}
	

	/**
	 * 创建一个常规的Dto对象，并初始化一个键值对。
	 * 
	 * @param keyString
	 * @param valueObject
	 * @return
	 */
	public static Dto newDto(String keyString, Object valueObject) {
		Dto dto = new HashDto();
		dto.put(keyString, valueObject);
		return dto;
	}
	
	/**
	 * 创建一个常规携带Request参数的Dto对象
	 * 
	 * @param request
	 * @return
	 */
	public static Dto newDto(HttpServletRequest request) {
		return WebCxt.getParamAsDto(request);
	}

}

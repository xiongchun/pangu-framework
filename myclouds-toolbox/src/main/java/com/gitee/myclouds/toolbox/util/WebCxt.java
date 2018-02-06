package com.gitee.myclouds.toolbox.util;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.impl.HashDto;

/**
 * <b>Web上下文</b>
 * 
 * @author xiongchun
 */
public class WebCxt {

	/**
	 * 将Request请求参数封装为Dto对象
	 * 
	 * @param request
	 * @return
	 */
	public static Dto getParamAsDto(HttpServletRequest request) {
		Dto dto = new HashDto();
		Map<String, String[]> map = request.getParameterMap();
		@SuppressWarnings({ "rawtypes", "unchecked" })
		Iterator<String> keyIterator = (Iterator) map.keySet().iterator();
		while (keyIterator.hasNext()) {
			String key = (String) keyIterator.next();
			String value = map.get(key)[0];
			dto.put(key, value);
		}
		return dto;
	}
	
}

package com.gitee.myclouds.common.wrapper;

import java.util.Map;

import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.impl.HashDto;


/**
 * <b>数据传输对象实例化辅助类</b>
 * 
 * @author xiongchun
 * @date 2008-07-06
 */
public class Dtos {
	
	private static final String PAGE_START = "start";
	private static final String PAGE_LENGTH = "length";

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
		if (map != null) {
			newDto.putAll(map);
		}
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
	 * 创建一个分页Dto对象
	 * <p>这里会对分页参数做一些校验和转换
	 * 
	 * @param map
	 * @return
	 */
	public static Dto newPageDto(Map<String, ?> map) {
		Dto newDto = new HashDto();
		if (map != null) {
			newDto.putAll(map);
		}
		if (MyUtil.isEmpty(newDto.get("page")) || MyUtil.isEmpty(newDto.get("limit"))) {
			//如果使用了pageDto，但又缺失分页参数，则抛出异常
			throw new RuntimeException("列表查询出错。分页参数（page | limit）缺失，请确认。");
		}else {
			int length =  newDto.getInteger("limit");
			newDto.put(PAGE_START, (newDto.getInteger("page")-1) * length);
			newDto.put(PAGE_LENGTH, length);
		}
		return newDto;
	}

}

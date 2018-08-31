package com.gitee.myclouds.common.wrapper;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.impl.HashDto;

/**
 * <b>值对象</b>
 * 
 * @author xiongchun
 * @since 1.0
 * @date 2008-10-06
 */
public class VO implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 将当前对象转换为Dto对象
	 * 
	 * @return dto 返回的Dto对象
	 */
	public Dto toDto() {
		Dto dto = new HashDto();
		MyUtil.copyProperties(this, dto);
		
		return dto;
	}

	/**
	 * 将当前对象转换为JSON字符串
	 * 
	 * @return String 返回的JSON格式字符串
	 */
	public String toJson() {
		//TODO null处理
		String jsonString = JSON.toJSONString(this);
		return jsonString;
	}
	
	/**
	 * 将参数对象中的属性复制到源对象中
	 * 
	 */
	public void copyProperties(Object inObj) {
			MyUtil.copyProperties(inObj, this);
	}

	/**
	 * 清除当前对象属性
	 */
	public void reset() {
		Method[] methods = this.getClass().getMethods();
		for (int i = 0, n = methods.length; i < n; i++) {
			try {
				Method method = methods[i];
				if ((method.getModifiers() & Modifier.PUBLIC) == 1) {
					String methodName = method.getName();
					if (methodName.startsWith("set")) {
						method.invoke(this, new Object[] { null });
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}

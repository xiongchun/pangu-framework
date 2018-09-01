package com.gitee.myclouds.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import org.apache.commons.beanutils.Converter;

import lombok.extern.slf4j.Slf4j;

/**
 * Bean属性复制工具类的日期类型转换器
 * 
 * @author xiongchun
 * @date 2015-10-25
 */
@Slf4j
public class BeanUtilsDateConverter implements Converter {

	@SuppressWarnings("unchecked")
	@Override
	public <T> T convert(Class<T> myClass, Object myObj) {
		if (myObj == null) {
			return null;
		}
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return (T) df.parse(myObj.toString());
		} catch (ParseException e) {
			try {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				return (T) df.parse(myObj.toString());
			} catch (ParseException e1) {
				try {
					SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日");
					return (T) df.parse(myObj.toString());
				} catch (ParseException e2) {
					try {
						SimpleDateFormat dfParse = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
						return (T) dfParse.parse(myObj.toString());
					} catch (ParseException e3) {
						log.warn("对象间日期类型属性复制时由于格式问题解析失败，属性值【{}】复制失败。", myObj.toString());
						e3.printStackTrace();
					}
				}
			}
		}
		return null;
	}

}

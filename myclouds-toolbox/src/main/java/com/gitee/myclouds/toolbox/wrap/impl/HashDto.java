package com.gitee.myclouds.toolbox.wrap.impl;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.util.TypeConvertUtil;

/**
 * <b>数据传输对象实现</b>
 * <p>
 * 对原生Java Map类型的二次包装，提供<b><i>更加方便的存取API、更强的容错和类型转换机制。</i></b>
 * 在平台二次开发过程中具有很强的实用价值。 开发人员需熟练掌握其提供的相关API。
 * </p>
 * 
 * @author xiongchun
 * @date 2008-07-06
 */
public class HashDto extends HashMap<String, Object> implements Dto {
	
	private static final long serialVersionUID = 1L;

	public static final String ORDER_KEY = "_order"; 

	/**
	 * 缺省构造函数
	 */
	public HashDto() {

	}

	/**
	 * 以Integer类型返回属性
	 * 
	 * @param pKey
	 * @return Integer 键值
	 * @throws Exception
	 */
	@Override
	public Integer getInteger(String pKey) {
		Object obj = TypeConvertUtil.convert(get(pKey), "Integer", null);
		if (obj != null)
			return (Integer) obj;
		else
			return null;
	}
	
	/**
	 * 以BigInteger类型返回属性
	 * 
	 * @param pKey
	 * @return BigInteger 键值
	 */
	public BigInteger getBigInteger(String pKey){
		BigInteger outValue = null;
		Object obj = get(pKey);
		if (obj instanceof BigInteger) {
			outValue = (BigInteger) obj;
		}else{
			outValue = new BigInteger(getString(pKey));
		}
		return outValue;
	}

	/**
	 * 以Long类型返回属性
	 * 
	 * @param pKey
	 * @return Long 键值
	 */
	@Override
	public Long getLong(String pKey) {
		Object obj = TypeConvertUtil.convert(get(pKey), "Long", null);
		if (obj != null)
			return (Long) obj;
		else
			return null;
	}

	/**
	 * 以String类型返回属性
	 * 
	 * @param pKey
	 * @return String 键值
	 */
	@Override
	public String getString(String pKey) {
		Object obj = TypeConvertUtil.convert(get(pKey), "String", null);
		if (obj != null)
			return (String) obj;
		else
			return "";
	}

	/**
	 * 以BigDecimal类型返回属性
	 * 
	 * @param pKey
	 * @return BigDecimal 键值
	 */
	@Override
	public BigDecimal getBigDecimal(String pKey) {
		Object obj = TypeConvertUtil.convert(get(pKey), "BigDecimal", null);
		if (obj != null)
			return (BigDecimal) obj;
		else
			return null;
	}

	/**
	 * 以Date类型返回属性
	 * 
	 * @param pKey
	 * @return Date 键值(yyyy-MM-dd)
	 */
	@Override
	public Date getDate(String pKey) {
		Object obj = TypeConvertUtil.convert(get(pKey), "Date", "yyyy-MM-dd");
		if (obj != null)
			return (Date) obj;
		else
			return null;
	}

	/**
	 * 以Timestamp类型返回属性
	 * 
	 * @param pKey
	 * @return Timestamp 键值(yyyy-MM-dd HH:mm:ss)
	 */
	@Override
	public Timestamp getTimestamp(String pKey) {
		Object obj = TypeConvertUtil.convert(get(pKey), "Timestamp", "yyyy-MM-dd HH:mm:ss");
		if (obj != null)
			return (Timestamp) obj;
		else
			return null;
	}

	/**
	 * 以Boolean类型返回属性
	 * 
	 * @param pKey
	 * @return Boolean 键值
	 */
	@Override
	public Boolean getBoolean(String pKey) {
		Object obj = TypeConvertUtil.convert(get(pKey), "Boolean", null);
		if (obj != null)
			return (Boolean) obj;
		else
			return null;
	}

	/**
	 * 以List类型返回属性
	 * 
	 * @param pKey
	 * @return List 键值
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<? extends Object> getList(String pKey) {
		return (List<? extends Object>) get(pKey);
	}

	/**
	 * 返回分页查询偏移起始位置
	 * 
	 * @return int
	 */
	@Override
	public Integer getPageStart() {
		return getInteger("start");
	}

	/**
	 * 返回分页查询偏移步长
	 * 
	 * @return int
	 */
	@Override
	public Integer getPageLimit() {
		return getInteger("limit");
	}

	/**
	 * 设置分页查询偏移起始位置
	 * 
	 */
	@Override
	public void setPageStart(int pStart) {
		put("start", pStart);
	}

	/**
	 * 设置分页查询偏移步长
	 * 
	 */
	@Override
	public void setPageLimit(int pLimit) {
		put("limit", pLimit);
	}

	/**
	 * 设置排序器
	 * 
	 * @param order
	 */
	@Override
	public void setOrder(String order) {
		put(ORDER_KEY, order);
	}

	/**
	 * 获取排序器
	 * 
	 * @return
	 */
	@Override
	public String getOrder() {
		return getString(ORDER_KEY);
	}

}

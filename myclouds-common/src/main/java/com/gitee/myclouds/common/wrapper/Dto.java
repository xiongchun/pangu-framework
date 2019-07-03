package com.gitee.myclouds.common.wrapper;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * <b>数据传输对象接口</b>
 * <p>
 * 对原生Java Map类型的二次包装，提供<b><i>更加方便的存取API、更强的容错和类型转换机制。</i></b>
 * 在平台二次开发过程中具有很强的实用价值。 开发人员需熟练掌握其提供的相关API。
 * </p>
 * 
 * @author xiongchun
 * @date 2008-07-06
 */
public interface Dto extends Map<String, Object> {
	
	// Dto里的一个缺省叫mycat的键
	public static final String KEY_MYCAT = "myCat";

	/**
	 * 以Integer类型返回属性
	 * 
	 * @param pKey
	 * @return Integer 键值
	 */
	Integer getInteger(String pKey);

	/**
	 * 以BigInteger类型返回属性
	 * 
	 * @param pKey
	 * @return BigInteger 键值
	 */
	BigInteger getBigInteger(String pKey);

	/**
	 * 以Long类型返回属性
	 * 
	 * @param pKey
	 * @return Long 键值
	 */
	Long getLong(String pKey);

	/**
	 * 以String类型返回属性
	 * 
	 * @param pKey
	 * @return String 键值
	 */
	String getString(String pKey);

	/**
	 * 以BigDecimal类型返回属性
	 * 
	 * @param pKey
	 * @return BigDecimal 键值
	 */
	BigDecimal getBigDecimal(String pKey);

	/**
	 * 以Date类型返回属性
	 * 
	 * @param pKey
	 * @return Date 键值(yyyy-MM-dd)
	 */
	Date getDate(String pKey);

	/**
	 * 以Timestamp类型返回属性
	 * 
	 * @param pKey
	 * @return Timestamp 键值(yyyy-MM-dd HH:mm:ss)
	 */
	Timestamp getTimestamp(String pKey);

	/**
	 * 以Boolean类型返回属性
	 * 
	 * @param pKey
	 * @return Boolean 键值
	 */
	Boolean getBoolean(String pKey);

	/**
	 * 以List类型返回属性
	 * 
	 * @param pKey
	 * @return List 键值
	 */
	List<? extends Object> getList(String pKey);

	/**
	 * 获取缺省对象：myCat
	 * 
	 * @return
	 */
	Object getMyCat();
	
	/**
	 * 设置缺省对象：myCat
	 * 
	 * @param myCat
	 */
	void setMyCat(Object myCat);
	
	/**
	 * 支持链式put
	 * 
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @return 当前对象
	 */
	Dto set(String key, Object value);

}

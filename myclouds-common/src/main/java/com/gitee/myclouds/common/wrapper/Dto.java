package com.gitee.myclouds.common.wrapper;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.gitee.myclouds.common.vo.MyUserVO;

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
	 * 返回分页查询偏移起始位置
	 * 
	 * @return int
	 */
	Integer getPageStart();

	/**
	 * 返回分页查询步长
	 * 
	 * @return int
	 */
	Integer getPageLength();

	/**
	 * 设置分页查询偏移起始位置
	 * 
	 */
	void setPageStart(int pStart);

	/**
	 * 设置分页查询偏移步长
	 * 
	 */
	void setPageLength(int pLength);

	/**
	 * 支持链式put
	 * 
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @return 当前对象
	 */
	Dto put2(String key, Object value);

	/**
	 * 获取当前用户对象（管理后台的登录用户）
	 * 
	 * @return
	 */
	MyUserVO getCurUser();
}

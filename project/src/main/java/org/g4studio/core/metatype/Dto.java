package org.g4studio.core.metatype;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * 数据传输对象接口<br>
 * 
 * @author XiongChun
 * @since 2008-07-06
 * @see java.util.Map
 */
public interface Dto extends Map {

	/**
	 * 以Integer类型返回键值
	 * 
	 * @param key
	 *            键名
	 * @return Integer 键值
	 */
	public Integer getAsInteger(String pStr);

	/**
	 * 以Long类型返回键值
	 * 
	 * @param key
	 *            键名
	 * @return Long 键值
	 */
	public Long getAsLong(String pStr);

	/**
	 * 以String类型返回键值
	 * 
	 * @param key
	 *            键名
	 * @return String 键值
	 */
	public String getAsString(String pStr);

	/**
	 * 取出属性值
	 * 
	 * @param pStr
	 *            属性Key
	 * @return Integer
	 */
	public BigDecimal getAsBigDecimal(String pStr);

	/**
	 * 取出属性值
	 * 
	 * @param pStr
	 *            :属性Key
	 * @return Integer
	 */
	public Date getAsDate(String pStr);

	/**
	 * 以List类型返回键值
	 * 
	 * @param key
	 *            键名
	 * @return List 键值
	 */
	public List getAsList(String key);

	/**
	 * 以Timestamp类型返回键值
	 * 
	 * @param key
	 *            键名
	 * @return Timestamp 键值
	 */
	public Timestamp getAsTimestamp(String pStr);
	
	/**
	 * 以Boolean类型返回键值
	 * 
	 * @param key
	 *            键名
	 * @return Timestamp 键值
	 */
	public Boolean getAsBoolean(String key);

	/**
	 * 给Dto压入第一个默认List对象<br>
	 * 为了方便存取(省去根据Key来存取和类型转换的过程)
	 * 
	 * @param pList
	 *            压入Dto的List对象
	 */
	public void setDefaultAList(List pList);

	/**
	 * 给Dto压入第二个默认List对象<br>
	 * 为了方便存取(省去根据Key来存取和类型转换的过程)
	 * 
	 * @param pList
	 *            压入Dto的List对象
	 */
	public void setDefaultBList(List pList);

	/**
	 * 获取第一个默认List对象<br>
	 * 为了方便存取(省去根据Key来存取和类型转换的过程)
	 * 
	 * @param pList
	 *            压入Dto的List对象
	 */
	public List getDefaultAList();

	/**
	 * 获取第二个默认List对象<br>
	 * 为了方便存取(省去根据Key来存取和类型转换的过程)
	 * 
	 * @param pList
	 *            压入Dto的List对象
	 */
	public List getDefaultBList();

	/**
	 * 给Dto压入一个默认的Json格式字符串
	 * 
	 * @param jsonString
	 */
	public void setDefaultJson(String jsonString);

	/**
	 * 获取默认的Json格式字符串
	 * 
	 * @return
	 */
	public String getDefaultJson();

	/**
	 * 将此Dto对象转换为XML格式字符串
	 * 
	 * @param pStyle
	 *            XML生成方式(可选：节点属性值风格和节点元素值风格)
	 * @return string 返回XML格式字符串
	 */
	public String toXml(String pStyle);

	/**
	 * 将此Dto对象转换为XML格式字符串<br>
	 * 默认为节点元素值风格
	 * 
	 * @return string 返回XML格式字符串
	 */
	public String toXml();

	/**
	 * 将此Dto对象转换为Json格式字符串<br>
	 * 
	 * @return string 返回Json格式字符串
	 */
	public String toJson();
	
	/**
	 * 打印DTO对象<br>
	 * 
	 */
	public void println();

	/**
	 * 将此Dto对象转换为Json格式字符串(带日期时间型)<br>
	 * 
	 * @return string 返回Json格式字符串
	 */
	public String toJson(String pFormat);
	
	/**
	 * 设置交易状态
	 * 
	 * @param pSuccess
	 */
	public void setSuccess(Boolean pSuccess);
	
	/**
	 * 获取交易状态
	 * 
	 * @param pSuccess
	 */
	public Boolean getSuccess();
	
	/**
	 * 设置交易提示信息
	 * 
	 * @param pSuccess
	 */
	public void setMsg(String pMsg);
	
	/**
	 * 获取交易提示信息
	 * 
	 * @param pSuccess
	 */
	public String getMsg();
	
	
	
}

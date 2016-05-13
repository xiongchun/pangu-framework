package cn.osworks.aos.core.typewrap.impl;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.TypeConvertUtil;
import cn.osworks.aos.system.modules.dao.vo.UserInfoVO;

/**
 * <b>数据传输对象实现</b>
 * <p>
 * 对原生Java Map类型的二次包装，提供<b><i>更加方便的存取API、更强的容错和类型转换机制。</i></b>
 * 在平台二次开发过程中具有很强的实用价值。 开发人员需熟练掌握其提供的相关API。
 * </p>
 * 
 * @author OSWorks-XC
 * @date 2008-07-06
 */
public class HashDto extends HashMap<String, Object> implements Dto {

	private static Log log = LogFactory.getLog(HashDto.class);

	private static final long serialVersionUID = 1L;

	/**
	 * 缺省构造函数
	 */
	public HashDto() {

	}

	/**
	 * <b>创建一个带有初始化参数的Dto对象</b>
	 * <p>
	 * 参数包含：1、界面提交的请求参数；2、当前用户对象(UserInfoVO)，通过getUserInfo()获得。
	 * 
	 * @param request
	 */
	public HashDto(HttpServletRequest request) {
		putAll(WebCxt.getParamAsDto(request));
		put(AOSCons.USERINFOKEY, WebCxt.getUserInfo(request.getSession()));
	}

	/**
	 * 从Dto容器中获取当前用户对象
	 * 
	 * @return
	 */
	public UserInfoVO getUserInfo() {
		return (UserInfoVO) get(AOSCons.USERINFOKEY);
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
	 * 设置分页查询记录总数
	 */
	@Override
	public void setPageTotal(int pCount) {
		put(AOSCons.READER_TOTAL_PROPERTY, pCount);
	}

	/**
	 * 返回分页查询记录总数
	 * <p>
	 * 当非分页查询时候返回-1
	 * </p>
	 * 
	 * @return int
	 */
	@Override
	public int getPageTotal() {
		Integer countInteger = getInteger(AOSCons.READER_TOTAL_PROPERTY);
		if (AOSUtils.isNotEmpty(countInteger)) {
			return countInteger.intValue();
		}
		return -1;
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
	 * 分页参数,设置分页使能参数
	 * 
	 */
	@Override
	public void setPageEnable(boolean pEnable) {
		put("pageEnable", pEnable);
	}

	/**
	 * 分页参数,获取分页使能参数
	 * 
	 */
	@Override
	public Boolean getPageEnable() {
		return getBoolean("pageEnable");
	}

	/**
	 * 获取前端UI选择模型选中的标识字段的数组。前端请求参数key应为：aos_rows_，方能取到。
	 * <p>
	 * 返回选中行指定字段的返回类型为字符串数组
	 * <p>
	 * 返回选中行所有字段的返回类型为List<Dto>
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <T> T getRows() {
		String rows = getString(AOSCons.AOS_ROWS_);
		if (AOSUtils.isEmpty(rows)) {
			if (log.isDebugEnabled()) {
				log.debug(":-( 获取选中数据标识键数组为空。如果这和您的预期不符，请检查AOS.ajax()中选中数组参数的参数key是否为aos_rows_。");
			}
		}
		if (StringUtils.startsWith(rows, "[")) {
			List<Dto> list = AOSJson.fromJson(rows);
			return (T) list;
		} else {
			if (AOSUtils.isEmpty(rows)) {
				return (T) ArrayUtils.EMPTY_STRING_ARRAY;
			}
			return (T) rows.split(",");
		}
	}
	
	/**
	 * 获取前端传输JSON数组的参数。
	 * <p>
	 * 返回选中行指定字段的返回类型为字符串数组
	 * <p>
	 * 返回选中行所有字段的返回类型为List<Dto>
	 * 
	 * @param rowsKey 前端参数的Key
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public  <T> T getRows(String rowsKey){
		String rows = getString(rowsKey);
		if (StringUtils.startsWith(rows, "[")) {
			List<Dto> list = AOSJson.fromJson(rows);
			return (T) list;
		} else {
			if (AOSUtils.isEmpty(rows)) {
				return (T) ArrayUtils.EMPTY_STRING_ARRAY;
			}
			return (T) rows.split(",");
		}
	}
	

	/**
	 * 压入交易状态信息
	 * 
	 * @param appMsg
	 */
	@Override
	public void setAppMsg(String appMsg) {
		put(AOSCons.APPMSG_KEY, appMsg);
	}

	/**
	 * 获取交易状态信息
	 */
	@Override
	public String getAppMsg() {
		return getString(AOSCons.APPMSG_KEY);
	}

	/**
	 * 压入交易状态码
	 * 
	 * @param appCode
	 */
	@Override
	public void setAppCode(int appCode) {
		put(AOSCons.APPCODE_KEY, appCode);
	}

	/**
	 * 获取交易状态码
	 */
	@Override
	public int getAppCode() {
		return getInteger(AOSCons.APPCODE_KEY);
	}

	/**
	 * 设置缺省字符串对象
	 */
	@Override
	public void setStringA(String stringA) {
		put(AOSCons.DEFAULT_STRING_KEY, stringA);
	}

	/**
	 * 获取缺省字符串对象
	 */
	@Override
	public String getStringA() {
		return getString(AOSCons.DEFAULT_STRING_KEY);
	}

	/**
	 * 设置缺省集合对象
	 */
	@Override
	public void setListA(List<?> listA) {
		put(AOSCons.DEFAULT_LIST_KEY, listA);
	}

	/**
	 * 获取缺省集合对象
	 */
	@Override
	public List<?> getListA() {
		return getList(AOSCons.DEFAULT_LIST_KEY);
	}

	/**
	 * 设置缺省BigDecimal对象
	 */
	@Override
	public void setBigDecimalA(BigDecimal bigDecimalA) {
		put(AOSCons.DEFAULT_BIGDECIMAL_KEY, bigDecimalA);
	}

	/**
	 * 获取缺省BigDecimal对象
	 */
	@Override
	public BigDecimal getBigDecimalA() {
		return getBigDecimal(AOSCons.DEFAULT_BIGDECIMAL_KEY);
	}

	/**
	 * 设置缺省Integer对象
	 */
	@Override
	public void setIntegerA(Integer integerA) {
		put(AOSCons.DEFAULT_INTEGER_KEY, integerA);
	}

	/**
	 * 获取缺省Integer对象
	 */
	@Override
	public Integer getIntegerA() {
		return getInteger(AOSCons.DEFAULT_INTEGER_KEY);
	}

	/**
	 * 设置缺省Boolean对象
	 */
	@Override
	public void setBooleanA(Boolean booleanA) {
		put(AOSCons.DEFAULT_BOOLEAN_KEY, booleanA);
	}

	/**
	 * 获取缺省Boolean对象
	 */
	@Override
	public Boolean getBooleanA() {
		return getBoolean(AOSCons.DEFAULT_BOOLEAN_KEY);
	}

	/**
	 * 设置排序器
	 * 
	 * @param order
	 */
	@Override
	public void setOrder(String order) {
		put(AOSCons.ORDER_KEY, order);
	}

	/**
	 * 获取排序器
	 * 
	 * @return
	 */
	@Override
	public String getOrder() {
		return getString(AOSCons.ORDER_KEY);
	}

	/**
	 * 控制台打印DTO对象,辅助调试
	 */
	@Override
	public void println() {
		if (log.isDebugEnabled()) {
			System.out.println(AOSCons.CONSOLE_FLAG1 + this.toString());
		}
	}

}

package cn.osworks.aos.core.asset;

import java.lang.reflect.Type;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

/**
 * <b>JSON资料格式处理类</b>
 * 
 * @author OSWorks-XC
 * @since 1.0
 * @date 2009-10-06
 */
public class AOSJson {

	@SuppressWarnings("unused")
	private static Log log = LogFactory.getLog(AOSJson.class);

	private static Gson gson;

	static {
		GsonBuilder builder = new GsonBuilder();
		gson = builder.create();
	}

	/**
	 * 将Java对象进行JSON序列化
	 * <p>
	 * 支持自定义日期时间类型格式
	 * <p>
	 * 
	 * @param pObject
	 * @param pDateFormat
	 *            日期时间类型格式字符串
	 * @return
	 */
	public static final String toJson(Object pObject, String pDateFormat) {
		String jsonString = "";
		if (AOSUtils.isEmpty(pDateFormat)) {
			pDateFormat = AOSCons.DATATIME;
		}
		GsonBuilder builder = new GsonBuilder();
		if (AOSCons.JSON_FORMAT.equals(WebCxt.getCfgOfDB("json_format"))) {
			builder.setPrettyPrinting();
		}
		builder.setDateFormat(pDateFormat);
		Gson gson = builder.create();
		jsonString = gson.toJson(pObject);
		return jsonString;
	}

	/**
	 * 将Java对象进行JSON序列化
	 * <p>
	 * 缺省的日期时间类型为：yyyy-MM-dd HH:mm:ss
	 * <p>
	 * 
	 * @param pObject
	 * @return
	 */
	public static final String toJson(Object pObject) {
		String jsonString = toJson(pObject, AOSCons.DATATIME);
		return jsonString;
	}

	/**
	 * 将Java集合对象序列化为表格分页所需的Json对象<b>(服务器端分页)</b>
	 * <p>
	 * 缺省的日期时间类型为：yyyy-MM-dd HH:mm:ss
	 * <p>
	 * 
	 * @param pList 集合对象
	 * @param total 集合总数 
	 * @return
	 */
	public static final String toGridJson(List<? extends Object> pList, int total) {
		Dto tempDto = new HashDto();
		tempDto.put(AOSCons.READER_ROOT_PROPERTY, pList);
		tempDto.put(AOSCons.READER_TOTAL_PROPERTY, total);
		String jsonString = toJson(tempDto, AOSCons.DATATIME);
		return jsonString;
	}
	
	/**
	 * 将Java集合对象序列化为表格分页所需的Json对象<b>(前台客户端分页或不分页)</b>
	 * <p>
	 * 缺省的日期时间类型为：yyyy-MM-dd HH:mm:ss
	 * <p>
	 * 
	 * @param pList 集合对象
	 * @return
	 */
	public static final String toGridJson(List<? extends Object> pList) {
		String jsonString = toJson(pList, AOSCons.DATATIME);
		return jsonString;
	}

	/**
	 * 将Json字符串转换为Java对象
	 * 
	 * @param json
	 * @param type
	 *            如果Java对象是一个普通类则直接JsonUtils.fromJson(json,
	 *            HashDto.class);即可。如果是一个泛型类(如一个dto集合类)则需要
	 *            使用如下方式传参：JsonUtils.fromJson(json, new
	 *            TypeToken<List<HashDto>>() {}.getType());
	 * @return
	 */
	public static final <T> T fromJson(String json, Type type) {
		T list = gson.fromJson(json, type);
		return (T) list;
	}

	/**
	 * 将json转换为List<Dto>集合对象的简便方法
	 * 
	 * @param json
	 * @return
	 */
	public static final List<Dto> fromJson(String json) {
		List<Dto> list = fromJson(json, new TypeToken<List<HashDto>>() {
		}.getType());
		return list;
	}
}
package aos.framework.core.utils;

import java.lang.reflect.Type;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.reflect.TypeToken;

import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.impl.HashDto;

/**
 * <b>JSON资料格式处理类</b>
 * 
 * @author xiongchun
 * @since 1.0
 * @date 2009-10-06
 */
public class AOSJson {

	private static Logger log = LoggerFactory.getLogger(AOSJson.class);

	private static Gson gson;

	static {
		GsonBuilder builder = new GsonBuilder();
		// 注册日期时间类型反序列化时的适配器(针对反序列化到JavaBean的情况，Map类型不需要处理)
		builder.registerTypeAdapter(Date.class, new JsonDeserializer<Date>() {
			public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
					throws JsonParseException {
				return AOSUtils.stringToDate(json.getAsString());
			}
		});
		
/*		builder.registerTypeAdapter(new TypeToken<TreeMap<String, Object>>() {
		}.getType(), new JsonDeserializer<TreeMap<String, Object>>() {
			public TreeMap<String, Object> deserialize(JsonElement json, Type typeOfT,
					JsonDeserializationContext context) throws JsonParseException {
				TreeMap<String, Object> treeMap = new TreeMap<>();
				JsonObject jsonObject = json.getAsJsonObject();
				Set<Map.Entry<String, JsonElement>> entrySet = jsonObject.entrySet();
				for (Map.Entry<String, JsonElement> entry : entrySet) {
					Object ot = entry.getValue();
					if (ot instanceof JsonPrimitive) {
						treeMap.put(entry.getKey(), ((JsonPrimitive) ot).getAsString());
					} else {
						treeMap.put(entry.getKey(), ot);
					}
				}
				return treeMap;
			}
		});*/
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
		if (pObject == null) {
			log.debug("JSON序列化对象为null，请确认。");
			return null;
		}
		String jsonString = "";
		if (AOSUtils.isEmpty(pDateFormat)) {
			pDateFormat = AOSCons.DATATIME;
		}
		GsonBuilder builder = new GsonBuilder();
		// 可将null字段输出
		// GsonBuilder builder = new GsonBuilder().serializeNulls();
		// builder.setPrettyPrinting(); 是否格式化输出JSON
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
	 * @param pList
	 *            集合对象
	 * @param total
	 *            集合总数
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
	 * @param pList
	 *            集合对象
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
	 *            使用如下方式传参：JsonUtils.fromJson(json, new TypeToken<List
	 *            <HashDto>>() {}.getType());
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
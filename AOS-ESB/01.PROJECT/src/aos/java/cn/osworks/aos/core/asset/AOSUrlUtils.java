package cn.osworks.aos.core.asset;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import cn.osworks.aos.core.asset.AOSUtils;

/**
 * URL工具类
 * 
 * @author OSWorks-XC
 * @date 2009-10-06
 */
public class AOSUrlUtils {

	/**
	 * 字符串url编码
	 * 
	 * @param
	 * @return
	 */
	private static String urlEncode(String s) {
		try {
			return URLEncoder.encode(s, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new UnsupportedOperationException(e);
		}
	}

	/**
	 * Map类型参数URL编码
	 * 
	 * @param map
	 * @return
	 */
	public static String urlEncode(Map<?, ?> map) {
		StringBuilder sb = new StringBuilder();
		for (Map.Entry<?, ?> entry : map.entrySet()) {
			String keyString = entry.getKey().toString();
			if (AOSUtils.isNotEmpty(entry.getValue())) {
				if (sb.length() > 0) {
					sb.append("&");
				}
				sb.append(String.format("%s=%s", urlEncode(keyString), urlEncode(entry.getValue().toString())));
			}
		}
		return sb.toString();
	}

	/**
	 * 测试
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p1", 12);
		map.put("p2", "cat");
		map.put("p3", "中文");
		System.out.println(urlEncode(map));
	}

}

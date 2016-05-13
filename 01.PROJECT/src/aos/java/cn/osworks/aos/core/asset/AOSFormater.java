package cn.osworks.aos.core.asset;

import java.util.List;

/**
 * <b>格式转换器</b>
 * 
 * @author OSWorks-XC
 * @date 2009-10-06
 */
public class AOSFormater {

	/**
	 * 将字符串数组转换为由,分割的字符串
	 * 
	 * @param arrStrings
	 *            输入数组
	 * @return
	 */
	public static String toString(String[] arrStrings) {
		String outString = toSeparatString(arrStrings, ",");
		return outString;
	}

	/**
	 * 将字符串数组转换为由指定分隔符分割的字符串
	 * 
	 * @param arrStrings
	 *            输入数组
	 * @param separator
	 *            指定分隔符
	 * @return
	 */
	public static String toSeparatString(String[] arrStrings, String separator) {
		String outString = "";
		if (arrStrings != null && arrStrings.length > 0) {
			for (int i = 0; i < arrStrings.length; i++) {
				outString += arrStrings[i] + separator;
			}
		}
		outString = outString.substring(0, outString.length() - 1);
		return outString;
	}

	/**
	 * 将List转换为由,分割的字符串
	 * 
	 * @param list
	 *            输入List
	 * @return
	 */
	public static String toString(List<?> list) {
		String outString = toSeparatString(list, ",");
		return outString;
	}

	/**
	 * 将List转换为由指定分隔符分割的字符串
	 * 
	 * @param list
	 *            输入List
	 * @param separator
	 *            分隔符
	 * @return
	 */
	public static String toSeparatString(List<?> list, String separator) {
		StringBuilder sb = new StringBuilder();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (i < list.size() - 1) {
					sb.append(list.get(i) + separator);
				} else {
					sb.append(list.get(i));
				}
			}
		}
		return sb.toString();
	}
}

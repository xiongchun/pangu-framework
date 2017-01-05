package aos.framework.core.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import org.apache.commons.beanutils.Converter;

/**
 * Bean属性复制工具类的日期类型转换器
 * 
 * @author xiongchun
 * @date 2015-10-25
 */
public class BeanUtilsDateConverter implements Converter {

	@SuppressWarnings("unchecked")
	@Override
	public <T> T convert(Class<T> myClass, Object myObj) {
		if (AOSUtils.isEmpty(myObj)) {
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
						e3.printStackTrace();
					}
				}
			}
		}
		return null;
	}

}

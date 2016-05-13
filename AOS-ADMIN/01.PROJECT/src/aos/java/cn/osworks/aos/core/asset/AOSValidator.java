package cn.osworks.aos.core.asset;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.core.exception.AOSException;

/**
 * <b>验证器</b>
 * 
 * <p>JSR303实现并不适合AOS平台，请使用此工具类对数据进行后台验证。
 * 
 * @author OSWorks-XC
 */
@SuppressWarnings("rawtypes")
public class AOSValidator {

	/**
	 * 校验属性在对象中非空
	 * 
	 * @param object 目标对象 （支持：Map、Dto、JavaBean）
	 * @param properties 待验证的字段列表，多个字段用逗号分隔。
	 */
	public static void notEmpty(Object object, String properties) {
		if (object == null) {
			return;
		}
		String[] fields = StringUtils.split(properties, ",");
		if (object instanceof HashMap) {
			Map map = (HashMap) object;
			for (String field : fields) {
				if (AOSUtils.isEmpty(map.get(field))) {
					throw new AOSException(AOSUtils.merge("目标对象[{0}]中属性值[{1}]不能为空，请检查。", object, field));
				}
			}
		} else {
			for (String field : fields) {
				if (AOSUtils.isEmpty(AOSReflector.getFieldValue(object, field))) {
					throw new AOSException(AOSUtils.merge("目标对象[{0}]中属性值[{1}]不能为空，请检查。", object, field));
				}
			}
		}
	}
	
}

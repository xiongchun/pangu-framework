package cn.osworks.aos.core.asset;

import java.math.BigDecimal;
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
	
	/**
	 * Email验证
	 * 
	 * @param object 目标对象 （支持：Map、Dto、JavaBean）
	 * @param properties 待验证的字段列表，多个字段用逗号分隔。
	 */
	public static void email(Object object, String properties) {
		
	}
	
	/**
	 * 数值字段最大值验证，验证字段<=最大值
	 * 
	 * @param object 目标对象 （支持：Map、Dto、JavaBean）
	 * @param properties 待验证的字段列表，多个字段用逗号分隔。
	 * @param max 最大值
	 */
	public static void max(Object object, String properties, BigDecimal max) {
		
	}
	
	/**
	 * 数值字段最小值验证，验证字段>=最小值
	 * 
	 * @param object 目标对象 （支持：Map、Dto、JavaBean）
	 * @param properties 待验证的字段列表，多个字段用逗号分隔。
	 * @param min 最小值
	 */
	public static void min(Object object, String properties, BigDecimal min) {
		
	}
	
	/**
	 * 字符串的长度验证 字符串长度 <= length
	 * 
	 * @param object 目标对象 （支持：Map、Dto、JavaBean）
	 * @param properties 待验证的字段列表，多个字段用逗号分隔。
	 * @param length 长度
	 */
	public static void length(Object object, String properties, int length) {
		
	}
	
	/**
	 * 验证身份证号
	 * 
	 * @param object 目标对象 （支持：Map、Dto、JavaBean）
	 * @param properties 待验证的字段列表，多个字段用逗号分隔。
	 * @param length 长度
	 */
	public static void id(Object object, String properties, int length) {
		if (object == null) {
			return;
		}
		String[] fields = StringUtils.split(properties, ",");
		if (object instanceof HashMap) {
			Map map = (HashMap) object;
			for (String field : fields) {
				if (!AOSUtils.isIdentity(String.valueOf(map.get(field)))) {
					throw new AOSException(AOSUtils.merge("目标对象[{0}]中身份证号[{1}]不符合规范，请检查。", object, field));
				}
			}
		} else {
			for (String field : fields) {
				if (!AOSUtils.isIdentity(String.valueOf(AOSReflector.getFieldValue(object, field)))) {
					throw new AOSException(AOSUtils.merge("目标对象[{0}]中身份证号[{1}]不符合规范，请检查。", object, field));
				}
			}
		}
	}

}

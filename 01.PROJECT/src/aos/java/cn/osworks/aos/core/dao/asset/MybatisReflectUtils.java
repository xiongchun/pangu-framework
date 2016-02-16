package cn.osworks.aos.core.dao.asset;

import java.lang.reflect.Field;

/**
 * <b>分页反射工具类</b>
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2013-08-10
 */
public class MybatisReflectUtils {

	/**
	 * 获取obj对象fieldName的Field
	 * 
	 * @param obj
	 * @param fieldName
	 * @return
	 */
	public static Field getFieldByFieldName(Object obj, String fieldName) {
		for (Class<?> superClass = obj.getClass(); superClass != Object.class; superClass = superClass.getSuperclass()) {
			try {
				return superClass.getDeclaredField(fieldName);
			} catch (NoSuchFieldException e) {
			}
		}
		return null;
	}

	/**
	 * 获取obj对象fieldName的属性值
	 * 
	 * @param obj
	 * @param fieldName
	 * @return
	 */
	public static Object getValueByFieldName(Object obj, String fieldName) throws SecurityException,
			NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
		Field field = getFieldByFieldName(obj, fieldName);
		Object value = null;
		if (field != null) {
			if (field.isAccessible()) {
				value = field.get(obj);
			} else {
				field.setAccessible(true);
				value = field.get(obj);
				field.setAccessible(false);
			}
		}
		return value;
	}

	/**
	 * 设置obj对象fieldName的属性值
	 * 
	 * @param obj
	 * @param fieldName
	 * @param value
	 */
	public static void setValueByFieldName(Object obj, String fieldName, Object value) throws SecurityException,
			NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
		Field field = obj.getClass().getDeclaredField(fieldName);
		if (field.isAccessible()) {
			field.set(obj, value);
		} else {
			field.setAccessible(true);
			field.set(obj, value);
			field.setAccessible(false);
		}
	}
}

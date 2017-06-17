package aos.framework.core.typewrap;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import aos.framework.core.typewrap.impl.HashDto;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.core.utils.AOSXmlUtils;


/**
 * <b>值对象</b>
 * 
 * @author xiongchun
 * @since 1.0
 * @date 2008-10-06
 */
public class VO implements Serializable {

	private static final long serialVersionUID = 1L;

	private static Logger log = LoggerFactory.getLogger(VO.class);

	/**
	 * 将当前对象转换为Dto对象
	 * 
	 * @return dto 返回的Dto对象
	 */
	public Dto toDto() {
		Dto dto = new HashDto();
		AOSUtils.copyProperties(this, dto);
		return dto;
	}

	/**
	 * 将当前对象转换为XML字符串
	 * 
	 * @param pStyle
	 *            XML文档风格
	 * @return String 返回的XML格式字符串
	 */
	public String toXml() {
		String xmlString = AOSXmlUtils.toNodeXmlFromDto(this.toDto(), "root");
		return xmlString;
	}

	/**
	 * 将当前对象转换为JSON字符串
	 * 
	 * @return String 返回的JSON格式字符串
	 */
	public String toJson() {
		String jsonString = AOSJson.toJson(this);
		return jsonString;
	}
	
	/**
	 * 将参数对象中的属性复制到源对象中
	 * 
	 */
	public void copyProperties(Object inObj) {
			AOSUtils.copyProperties(inObj, this);
	}

	/**
	 * 清除当前对象属性
	 */
	public void clear() {
		Method[] methods = this.getClass().getMethods();
		for (int i = 0, n = methods.length; i < n; i++) {
			try {
				Method method = methods[i];
				if ((method.getModifiers() & Modifier.PUBLIC) == 1) {
					String methodName = method.getName();
					if (methodName.startsWith("set")) {
						method.invoke(this, new Object[] { null });
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 将此对象以可读形式打印输出
	 * 
	 */
	public void println() {
		if (log.isDebugEnabled()) {
			System.out.println(AOSCons.CONSOLE_FLAG1 + toJson());
		}
	}
}

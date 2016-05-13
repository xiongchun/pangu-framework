package cn.osworks.aos.core.typewrap;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlUtils;
import cn.osworks.aos.core.typewrap.impl.HashDto;


/**
 * <b>值对象</b>
 * 
 * @author OSWorks-XC
 * @since 1.0
 * @date 2008-10-06
 */
public class VO implements Serializable {

	private static final long serialVersionUID = 1L;

	private static Log log = LogFactory.getLog(VO.class);

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

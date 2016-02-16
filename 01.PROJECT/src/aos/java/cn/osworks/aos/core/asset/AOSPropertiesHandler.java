package cn.osworks.aos.core.asset;

import java.io.InputStream;
import java.util.Properties;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.exception.AOSException;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.impl.HashDto;

/**
 * <b>读取属性配置文件</b>
 * 
 * 
 * @author OSWorks-XC
 * @since 1.0
 * @date 2009-10-06
 * @lastmodify 2013-08-18
 */
public class AOSPropertiesHandler {
	
	private static Log log = LogFactory.getLog(AOSPropertiesHandler.class);
	
	private static Dto parametersDto = null;

	private static Properties defaultProperties;
	
	public static final String DEFAULT = "default";
	
	//to add other properties
	//public static final String OTHER = "other";
	
	static {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		if (classLoader == null) {
			classLoader = AOSPropertiesHandler.class.getClassLoader();
		}
		try {
			if (log.isDebugEnabled()) {
				log.debug("开始装载属性资源参数文件...");
			}
			parametersDto = new HashDto();
			//application.properties
			InputStream is = classLoader.getResourceAsStream("misc/aos.options.properties");
			defaultProperties = new Properties();
			defaultProperties.load(is);
			parametersDto.put(DEFAULT, defaultProperties);
			//to add other properties
		} catch (Exception e) {
			throw new AOSException("装载属性资源参数文件出错.", e);
		}
	}
	
	/**
	 * 返回缺省属性文件[application.properties]属性值
	 * 
	 * @param pKey
	 * @return String
	 */
	public static String getProperty(String pKey) {
		String value = defaultProperties.getProperty(pKey, "");
		return value;
	}
	
	/**
	 * 返回指定属性文件的属性值
	 * 
	 * @param pKey
	 * @return String
	 */
	public static String getProperty(String pKey, String pType) {
		Properties properties = (Properties)parametersDto.get(pType);
		String value = properties.getProperty(pKey, "");
		return value;
	}
}

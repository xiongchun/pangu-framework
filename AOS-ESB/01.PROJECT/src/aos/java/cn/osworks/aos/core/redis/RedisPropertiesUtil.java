package cn.osworks.aos.core.redis;

import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.exception.AOSException;

/**
 * <b>读取属性配置文件</b>
 * 
 * 
 * @author XiongChun
 * 
 */
public class RedisPropertiesUtil {
	
	private static Log log = LogFactory.getLog(RedisPropertiesUtil.class);
	
	private static Properties defaultProperties;
	
	static {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		if (classLoader == null) {
			classLoader = RedisPropertiesUtil.class.getClassLoader();
		}
		try {
			if (log.isDebugEnabled()) {
				log.debug("开始装载属性资源参数文件...");
			}
			InputStream is = classLoader.getResourceAsStream("misc/redis.properties");
			defaultProperties = new Properties();
			defaultProperties.load(is);
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
}

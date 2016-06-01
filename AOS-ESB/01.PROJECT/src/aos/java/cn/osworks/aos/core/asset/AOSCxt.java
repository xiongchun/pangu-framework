package cn.osworks.aos.core.asset;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.modules.cache.CacheService;
import cn.osworks.aos.modules.cache.DicVO;
import cn.osworks.aos.modules.context.AOSService;


/**
 * <b>应用系统上下文</b>
 * 
 * @author OSWorks-XC
 */
@SuppressWarnings("all")
public class AOSCxt {

	private static Log log = LogFactory.getLog(AOSCxt.class);

	/**
	 * 缺省的SqlDao组件
	 */
	public static SqlDao sqlDao = getSqlDao("sqlDao");

	/**
	 * 系统服务组件AosService
	 */
	public static AOSService aosService = getAosService();

	/**
	 * 从Spring容器上下文中获取SpringBean组件
	 * 
	 * @param springBeaID
	 *            SpringBeaID
	 * @return
	 */
	public static Object getBean(String springBeaID) {
		Object bean = AOSBeanLoader.getSpringBean(springBeaID);
		return bean;
	}

	/**
	 * 获取系统服务组件AppService
	 * 
	 * @return
	 */
	public static AOSService getAosService() {
		AOSService aosService = (AOSService) getBean("aosService");
		return aosService;
	}

	/**
	 * 获取指定ID的SqlDao组件
	 * 
	 * @param springBeaID
	 * @return
	 */
	public static SqlDao getSqlDao(String sqlDaoID) {
		SqlDao sqlDao = (SqlDao) getBean(sqlDaoID);
		return sqlDao;
	}
	
	/**
	 * 从XML参数配置文中根据参数键获取参数值
	 * 
	 * @param key
	 *            参数键
	 * @return
	 */
	public static String getCfgOfXML(String key) {
		String valueString = AOSXmlOptionsHandler.getValue(key);
		return valueString;
	}

	/**
	 * 从Properties参数配置文中根据参数键获取参数值
	 * 
	 * @param key
	 *            参数键
	 * @return
	 */
	public static String getCfgOfProperties(String key) {
		String valueString = AOSPropertiesHandler.getProperty(key);
		return valueString;
	}
	
	/**
	 * 从缓存中获取全局参数配置值
	 * @param key
	 * @return
	 */
	public static String getParam(String key){
		CacheService cacheService = (CacheService)getBean("cacheService");
		return cacheService.getParam(key);
	}
	
	/**
	 * 从缓存中获取字典对照集合
	 * @param key
	 * @return
	 */
	public static List<DicVO> getDicList(String key){
		CacheService cacheService = (CacheService)getBean("cacheService");
		return cacheService.getDicList(key);
	}
	
	/**
	 * 从缓存中获取字典对照描述
	 * @param key
	 * @param code
	 * @return
	 */
	public static String getDicDesc(String key, String code){
		CacheService cacheService = (CacheService)getBean("cacheService");
		return cacheService.getDicDesc(key, code);
	}

}

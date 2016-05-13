package cn.osworks.aos.core.asset;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;

import org.activiti.engine.ProcessEngine;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.system.service.AOSService;


/**
 * <b>应用系统上下文</b>
 * 
 * @author OSWorks-XC
 */
@SuppressWarnings("all")
public class AOSCxt {

	private static Log log = LogFactory.getLog(AOSCxt.class);
	
	//缓存容器
	public static  final class CACHE{
		//字典、参数缓存
		public static final String AOSRESOURCECACHE = "aosResourceCache";
		//会话缓存
		public static final String AOSSESSIONCACHE = "aosSessionCache";
	}
	
	/**
	 * 缓存管理器
	 */
	private static CacheManager cacheManager = getCacheManager();

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
	 * 获取缓存管理器
	 * 
	 * @return
	 */
	public static CacheManager getCacheManager() {
		CacheManager cacheManager = (CacheManager) getBean("cacheManager");
		return cacheManager;
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
	 * 获取缺省流程处理引擎
	 * 
	 * @return
	 */
	public static ProcessEngine getProcessEngine() {
		ProcessEngine processEngine = (ProcessEngine) getBean("processEngine");
		return processEngine;
	}
	
	/**
	 * 获取指定的Cache
	 * 
	 * @param cacheID
	 */
	public static Cache getCache(String cacheID){
		Cache cache = cacheManager.getCache(cacheID);
		return cache;
	}

}

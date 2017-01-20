package aos.framework.core.utils;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import aos.framework.core.asset.AOSBeanLoader;
import aos.framework.core.cache.CacheMasterDataService;
import aos.framework.core.dao.SqlDao;
import aos.framework.dao.po.AosDicPO;
import aos.system.common.model.UserModel;
import aos.system.modules.cache.CacheUserDataService;


/**
 * <b>应用系统上下文</b>
 * 
 * @author xiongchun
 */
@SuppressWarnings("all")
public class AOSCxt {

	private static Logger log = LoggerFactory.getLogger(AOSCxt.class);
	
	private static CacheUserDataService cacheUserDataService = (CacheUserDataService)AOSBeanLoader.getSpringBean("cacheUserDataService");
	private static CacheMasterDataService cacheMasterDataService = (CacheMasterDataService)AOSBeanLoader.getSpringBean("cacheMasterDataService");


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
	 * 从Spring容器上下文中获取SpringBean组件
	 * 
	 * @param springBeaID
	 *            SpringBeaID
	 * @return
	 */
	public static SqlDao getSqlDao() {
		return  (SqlDao)AOSBeanLoader.getSpringBean(AOSCons.SQLDAO);
	}
	
	/**
	 * 从XML参数配置文中根据参数键获取参数值
	 * 
	 * @param key
	 *            参数键
	 * @return
	 */
	public static String getCfgOfXML(String key) {
		String valueString = AOSCfgHandler.getValue(key);
		return valueString;
	}
	
	/**
	 * 从缓存中获取全局参数配置值
	 * @param key
	 * @return
	 */
	public static String getParam(String key){
		return cacheMasterDataService.getParam(key);
	}
	
	/**
	 * 从缓存中获取字典对照集合
	 * @param key
	 * @return
	 */
	public static List<AosDicPO> getDicList(String key){
		return cacheMasterDataService.getDicList(key);
	}
	
	/**
	 * 从缓存中获取字典对照描述
	 * @param key
	 * @param code
	 * @return
	 */
	public static String getDicDesc(String key, String code){
		return cacheMasterDataService.getDicDesc(key, code);
	}
	
	/**
	 * 获取UserModel对象
	 * 
	 * @param juid
	 * @return
	 */
	public static UserModel getUserModel(String juid){
		UserModel userModel = cacheUserDataService.getUserModel(juid);
		return userModel;
	}

}

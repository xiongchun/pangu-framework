package aos.framework.core.asset;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import aos.framework.core.cache.CacheMasterDataService;
import aos.framework.core.redis.JedisUtil;
import aos.system.common.utils.SystemCons;


/**
 * <b>系统启动监听器</b>
 * 
 * @author xiongchun
 * @date 2010-04-13
 */
public class AOSInitListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			initCache(sce);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 初始缓存加载
	 */
	private void initCache(ServletContextEvent sce){
		CacheMasterDataService cacheMasterDataService = (CacheMasterDataService)AOSBeanLoader.getSpringBean("cacheMasterDataService");
		cacheMasterDataService.cacheParamData();
		cacheMasterDataService.cacheDicData();
		JedisUtil.setString(SystemCons.CXT, sce.getServletContext().getContextPath(), 0);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}

package cn.osworks.aos.core.asset;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.modules.cache.CacheService;


/**
 * <b>系统启动监听器</b>
 * 
 * @author OSWorks-XC
 * @date 2010-04-13
 */
public class AOSInitListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			initSystemVars(sce.getServletContext());
			String cacheFlag = AOSPropertiesHandler.getProperty("cache_init_config_resource");
			if (StringUtils.equalsIgnoreCase(cacheFlag, "true")) {
				initBaseCache();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 设置系统变量
	 * 
	 * @param servletContext
	 */
	private void initSystemVars(ServletContext servletContext){
		String cxtString = servletContext.getContextPath();
		System.setProperty(AOSCons.CXT_KEY, cxtString);
	}
	
	/**
	 * 初始缓存加载(全局参数 | 字典)
	 */
	private void initBaseCache(){
		CacheService cacheService = (CacheService)AOSBeanLoader.getSpringBean("cacheService");
		cacheService.cacheParamData();
		cacheService.cacheDicData();
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}

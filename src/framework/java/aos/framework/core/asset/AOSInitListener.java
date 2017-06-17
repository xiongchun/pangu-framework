package aos.framework.core.asset;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import aos.framework.core.cache.CacheMasterDataService;
import aos.framework.core.exception.AOSException;
import aos.framework.core.redis.JedisUtil;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSCxt;
import aos.system.modules.cache.CacheUserDataService;
import redis.clients.jedis.Jedis;


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
	 * 初始缓存或重建缓存
	 */
	private void initCache(ServletContextEvent sce){
		
		checkRedisValid();
		
		//初始或重建基础数据
		CacheMasterDataService cacheMasterDataService = (CacheMasterDataService)AOSCxt.getBean("cacheMasterDataService");
		cacheMasterDataService.cacheParamData();
		cacheMasterDataService.cacheDicData();
		JedisUtil.setString(AOSCons.KEYS.CXT, sce.getServletContext().getContextPath(), 0);
		
		//启动时清除菜单授权数据，以免一些特殊情况导致授权数据不一致。
		CacheUserDataService cacheUserDataService = (CacheUserDataService)AOSCxt.getBean("cacheUserDataService");
		cacheUserDataService.clearGrantData();
		
		// 后台管理端在线用户数据是否清除？建议可以删除。如果做了App的后台的话，对于C端客户的在线状态，可以在重启的时候不清除。可以根据项目需求调整。
		// !!后来发现，管理后台也不能删除哦。否则会开发过程会影响其他队友。会话集中管理后，系统重启就不对会话重置了。会话依然保持！
		
	}
	
	/**
	 * 检测Redis有效性
	 */
	public void checkRedisValid(){
		try {
			Jedis jedis = JedisUtil.getJedisClient();
			JedisUtil.close(jedis);
		} catch (Exception e) {
			throw new AOSException(14);
		}	
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}

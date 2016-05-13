package cn.osworks.aos.testcase;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import cn.osworks.aos.core.asset.AOSBeanLoader;

/**
 * 测试缓存
 * 
 * @author XChun
 *
 */
public class EhcacheTest {

	/**
	 * Main
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		CacheManager cacheManager = (CacheManager)AOSBeanLoader.getSpringBean("cacheManager");
		Cache cache = cacheManager.getCache("aosCfgCache");
		Element element = new Element("aos_cahce_test_1", "熊嘉靖");
		cache.put(element);
		Element element2 = cache.get("aos_cahce_test_1");
		System.out.println(element2.getObjectValue());
		
	}
	
	

}

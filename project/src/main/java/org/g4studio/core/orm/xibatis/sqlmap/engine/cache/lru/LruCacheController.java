package org.g4studio.core.orm.xibatis.sqlmap.engine.cache.lru;

import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheController;
import org.g4studio.core.orm.xibatis.sqlmap.engine.cache.CacheModel;

/**
 * LRU (least recently used) cache controller implementation
 */
public class LruCacheController implements CacheController {

	private int cacheSize;
	private Map cache;
	private List keyList;

	/**
	 * Default constructor
	 */
	public LruCacheController() {
		this.cacheSize = 100;
		this.cache = Collections.synchronizedMap(new HashMap());
		this.keyList = Collections.synchronizedList(new LinkedList());
	}

	public int getCacheSize() {
		return cacheSize;
	}

	public void setCacheSize(int cacheSize) {
		this.cacheSize = cacheSize;
	}

	/**
	 * Configures the cache
	 * 
	 * @param props
	 *            Optionally can contain properties
	 *            [reference-type=WEAK|SOFT|STRONG]
	 */
	public void setProperties(Properties props) {
		String size = props.getProperty("cache-size");
		if (size == null) {
			size = props.getProperty("size");
		}
		if (size != null) {
			cacheSize = Integer.parseInt(size);
		}
	}

	/**
	 * Add an object to the cache
	 * 
	 * @param cacheModel
	 *            The cacheModel
	 * @param key
	 *            The key of the object to be cached
	 * @param value
	 *            The object to be cached
	 */
	public void putObject(CacheModel cacheModel, Object key, Object value) {
		cache.put(key, value);
		keyList.add(key);
		if (keyList.size() > cacheSize) {
			try {
				Object oldestKey = keyList.remove(0);
				cache.remove(oldestKey);
			} catch (IndexOutOfBoundsException e) {
				// ignore
			}
		}
	}

	/**
	 * Get an object out of the cache.
	 * 
	 * @param cacheModel
	 *            The cache model
	 * @param key
	 *            The key of the object to be returned
	 * @return The cached object (or null)
	 */
	public Object getObject(CacheModel cacheModel, Object key) {
		Object result = cache.get(key);
		keyList.remove(key);
		if (result != null) {
			keyList.add(key);
		}
		return result;
	}

	public Object removeObject(CacheModel cacheModel, Object key) {
		keyList.remove(key);
		return cache.remove(key);
	}

	/**
	 * Flushes the cache.
	 * 
	 * @param cacheModel
	 *            The cache model
	 */
	public void flush(CacheModel cacheModel) {
		cache.clear();
		keyList.clear();
	}

}

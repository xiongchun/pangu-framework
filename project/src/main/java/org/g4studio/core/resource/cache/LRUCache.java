package org.g4studio.core.resource.cache;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import org.g4studio.core.resource.CacheException;

/**
 * LRUCache
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-10-13
 */
public class LRUCache extends AbstractCache {
	private final Map cacheMap = new HashMap();

	private final LinkedList keyList = new LinkedList();

	private int maxSize = 100;

	public void setMaxSize(int maxSize) {
		if (maxSize < 0) {
			throw new IllegalArgumentException("maxSize必须大于0!当前值是:" + maxSize);
		}
		this.maxSize = maxSize;
	}

	public void put(Object key, Object value) throws CacheException {
		cacheMap.put(key, value);
		keyList.add(key);
		if (keyList.size() > maxSize) {
			try {
				Object oldKey = keyList.removeFirst();
				cacheMap.remove(oldKey);
			} catch (IndexOutOfBoundsException e) {
				// ignore
			}
		}
	}

	public Object get(Object key) throws CacheException {
		Object result = cacheMap.get(key);
		keyList.remove(key);
		if (result != null) {
			keyList.add(key);
		}
		return result;
	}

	public void remove(Object key) throws CacheException {
		keyList.remove(key);
		cacheMap.remove(key);
	}

	public void clear() throws CacheException {
		cacheMap.clear();
		keyList.clear();
	}

	public String toString() {
		return "LRUCache: " + maxSize;
	}

}
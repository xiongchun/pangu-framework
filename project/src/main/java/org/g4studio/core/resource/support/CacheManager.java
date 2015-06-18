package org.g4studio.core.resource.support;

import org.g4studio.core.resource.Cache;
import org.g4studio.core.resource.CacheException;
import org.g4studio.core.resource.Resource;

/**
 * CacheManager
 * 
 * @author HuangYunHui|XiongChun
 * @since 2010-2-5
 */
public class CacheManager {
	private final Cache cache;

	public CacheManager(Cache pCache) {
		this.cache = pCache;
	}

	public void put(Resource pResource) throws CacheException {
		cache.put(pResource.getUri(), pResource);
	}

	public Resource get(String pUri) throws CacheException {
		return (Resource) cache.get(pUri);
	}

}

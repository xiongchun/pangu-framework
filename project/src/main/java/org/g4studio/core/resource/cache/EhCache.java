package org.g4studio.core.resource.cache;

import java.io.Serializable;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.resource.Cache;
import org.g4studio.core.resource.CacheException;

/**
 * EhCache
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-10-13
 */
public class EhCache implements Cache {

	private CacheManager manager;
	net.sf.ehcache.Cache ehcache = null;
	private final Log logger = LogFactory.getLog(this.getClass());

	private static final String G4_RESOURCE_GROUP = "g4ResourceCache";

	/**
	 * Builds a Cache.
	 * <p>
	 * Even though this method provides properties, they are not used.
	 * Properties for EHCache are specified in the ehcache.xml file.
	 * Configuration will be read from ehcache.xml for a cache declaration where
	 * the name attribute matches the name parameter in this builder.
	 * 
	 * @param name
	 *            the name of the cache. Must match a cache configured in
	 *            ehcache.xml
	 * @param properties
	 *            not used
	 * @return a newly built cache will be built and initialised
	 * @throws CacheException
	 *             inter alia, if a cache of the same name already exists
	 */
	public void init() throws CacheException {
		try {
			manager = new CacheManager();
			ehcache = manager.getCache(G4_RESOURCE_GROUP);
			if (ehcache == null) {
				logger.warn("Could not find configuration [" + G4_RESOURCE_GROUP + "]; using defaults.");
				manager.addCache(G4_RESOURCE_GROUP);
				ehcache = manager.getCache(G4_RESOURCE_GROUP);
				logger.debug("started EHCache region: " + G4_RESOURCE_GROUP);
			}
		} catch (net.sf.ehcache.CacheException e) {
			throw new CacheException(e);
		}

	}

	public void put(Object key, Object pValue) throws CacheException {
		try {
			Element element = new Element((Serializable) key, (Serializable) pValue);
			ehcache.put(element);
		} catch (IllegalArgumentException e) {
			throw new CacheException(e);
		} catch (IllegalStateException e) {
			throw new CacheException(e);
		}
	}

	public Object get(Object key) throws CacheException {
		try {
			if (key == null) {
				return null;
			} else {
				Element element = ehcache.get((Serializable) key);
				if (element == null) {
					if (logger.isDebugEnabled()) {
						logger.debug("Element for " + key + " is null");
					}
					return null;
				} else {
					return element.getValue();
				}
			}
		} catch (net.sf.ehcache.CacheException e) {
			throw new CacheException(e);
		}
	}

	public void remove(Object key) throws CacheException {
		try {
			ehcache.remove((Serializable) key);
		} catch (ClassCastException e) {
			throw new CacheException(e);
		} catch (IllegalStateException e) {
			throw new CacheException(e);
		}
	}

	public void clear() throws CacheException {
		try {
			ehcache.removeAll();
		} catch (IllegalStateException e) {
			throw new CacheException(e);
		}
	}

	public void destroy() throws CacheException {
		if (manager != null) {
			manager.shutdown();
		}

	}

}

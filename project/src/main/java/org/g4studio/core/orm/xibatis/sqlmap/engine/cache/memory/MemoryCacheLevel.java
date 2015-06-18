package org.g4studio.core.orm.xibatis.sqlmap.engine.cache.memory;

import java.util.HashMap;
import java.util.Map;

import org.g4studio.core.orm.xibatis.sqlmap.client.SqlMapException;

/**
 * An enumeration for the values for the memory cache levels
 */
public final class MemoryCacheLevel {

	private static Map cacheLevelMap = new HashMap();

	/**
	 * Constant for weak caching This cache model is probably the best choice in
	 * most cases. It will increase performance for popular results, but it will
	 * absolutely release the memory to be used in allocating other objects,
	 * assuming that the results are not currently in use.
	 */
	public final static MemoryCacheLevel WEAK;

	/**
	 * Constant for soft caching. This cache model will reduce the likelihood of
	 * running out of memory in case the results are not currently in use and
	 * the memory is needed for other objects. However, this is not the most
	 * aggressive cache-model in that regard. Hence, memory still might be
	 * allocated and unavailable for more important objects.
	 */
	public final static MemoryCacheLevel SOFT;

	/**
	 * Constant for strong caching. This cache model will guarantee that the
	 * results stay in memory until the cache is explicitly flushed. This is
	 * ideal for results that are:
	 * <ol>
	 * <li>very small</li>
	 * <li>absolutely static</li>
	 * <li>used very often</li>
	 * </ol>
	 * The advantage is that performance will be very good for this particular
	 * query. The disadvantage is that if the memory used by these results is
	 * needed, then it will not be released to make room for other objects
	 * (possibly more important objects).
	 */
	public final static MemoryCacheLevel STRONG;

	private String referenceType;

	static {
		WEAK = new MemoryCacheLevel("WEAK");
		SOFT = new MemoryCacheLevel("SOFT");
		STRONG = new MemoryCacheLevel("STRONG");

		cacheLevelMap.put(WEAK.referenceType, WEAK);
		cacheLevelMap.put(SOFT.referenceType, SOFT);
		cacheLevelMap.put(STRONG.referenceType, STRONG);
	}

	/**
	 * Creates a new instance of CacheLevel
	 */
	private MemoryCacheLevel(String type) {
		this.referenceType = type;
	}

	/**
	 * Getter for the reference type
	 * 
	 * @return the type of reference type used
	 */
	public String getReferenceType() {
		return this.referenceType;
	}

	/**
	 * Gets a MemoryCacheLevel by name
	 * 
	 * @param refType
	 *            the name of the reference type
	 * @return the MemoryCacheLevel that the name indicates
	 */
	public static MemoryCacheLevel getByReferenceType(String refType) {
		MemoryCacheLevel cacheLevel = (MemoryCacheLevel) cacheLevelMap.get(refType);
		if (cacheLevel == null) {
			throw new SqlMapException("Error getting CacheLevel (reference type) for name: '" + refType + "'.");
		}
		return cacheLevel;
	}
}

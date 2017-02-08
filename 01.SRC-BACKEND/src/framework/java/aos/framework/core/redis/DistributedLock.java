package aos.framework.core.redis;

import redis.clients.jedis.Jedis;

/**
 * 基于Redis单线程原理实现分布式锁
 * 
 * @author xiongchun
 *
 */
public class DistributedLock {

	private static final int DEFAULT_EXPIRE = 30;
	
	/**
	 * 简单入口
	 * 
	 * @param key
	 * @return
	 */
	public static Jedis tryLock(String key) {
		return tryLock(key, DEFAULT_EXPIRE);
	}

	/**
	 * 尝试申请持有锁
	 * <p>
	 * 注意：同一个业务线程里用不同的redis连接去操作同一个key(锁标识)，在高并发压力的时候会有问题。
	 * 所以，在tryLock方法返回redis连接，供释放锁时候使用。
	 * 
	 * @param key
	 * @return
	 */
	public static Jedis tryLock(String key, int timeOut) {
		Jedis jedis = JedisUtil.getJedisClient();
		while (true) {
			if (jedis.setnx(key, key) == 1) {
				jedis.expire(key, timeOut > 0 ? timeOut : DEFAULT_EXPIRE);
				break;
			}
		}
		return jedis;
	}

	/**
	 * 释放锁
	 * 
	 * @param key
	 * @param jedis
	 */
	public static void unLock(String key, Jedis jedis) {
		jedis.del(key);
		JedisUtil.close(jedis);
	}
}

package aos.framework.core.redis;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import aos.framework.core.utils.AOSCfgHandler;
import aos.framework.core.utils.AOSUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * <b>Redis客户端</b>
 * 
 * @author xiongchun
 */
@SuppressWarnings("deprecation")
public class JedisUtil {

	private static Logger logger = LoggerFactory.getLogger(JedisUtil.class);

	// 连接池对象
	private static JedisPool jedisPool;

	static {
		String host = AOSCfgHandler.getValue("redis_host");
		int port = Integer.valueOf(AOSCfgHandler.getValue("redis_port"));
		JedisPoolConfig config = new JedisPoolConfig();
		config.setTestOnBorrow(true);
		config.setTestOnReturn(true);
		config.setTestWhileIdle(true);
		config.setMinEvictableIdleTimeMillis(60000l);
		config.setTimeBetweenEvictionRunsMillis(3000l);
		config.setNumTestsPerEvictionRun(-1);
		jedisPool = new JedisPool(config, host, port);
	}

	/**
	 * 获取Jedis连接池
	 * 
	 * @param pKey
	 * @return
	 */
	public static JedisPool getJedisPool() {
		return jedisPool;
	}

	/**
	 * 安全回收资源
	 * 
	 * @param jedis
	 */
	public static void close(Jedis jedis) {
		try {
			jedisPool.returnResource(jedis);
		} catch (Exception e) {
			if (jedis.isConnected()) {
				jedis.quit();
				jedis.disconnect();
			}
		}
	}

	/**
	 * 设置字符串型数据
	 * 
	 * @param key
	 *            存储键
	 * @param value
	 *            存储值
	 * @param timeout
	 *            超时时间(单位：秒） 设置为0，则无时效性。
	 * @return
	 */
	public static void setString(String key, String value, int timeout) {
		if (AOSUtils.isEmpty(key)) {
			throw new NullPointerException("Key不能为空!");
		}
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.set(key, value);
			if (timeout > 0) {
				jedis.expire(key, timeout);
			}
		} catch (Exception e) {
			jedisPool.returnBrokenResource(jedis);
			logger.error("操作Redis失败", e);
		} finally {
			close(jedis);
		}
	}
	
	/**
	 * 设置字符串型数据过期时间
	 * 
	 * @param key
	 *            存储键
	 * @param timeout
	 *            超时时间(单位：秒）
	 * @param key
	 */
	public static void exprString(String key, int timeout) {
		if (AOSUtils.isEmpty(key)) {
			return;
		}
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.expire(key, timeout);
		} catch (Exception e) {
			jedisPool.returnBrokenResource(jedis);
			logger.error("操作Redis失败", e);
		} finally {
			close(jedis);
		}
	}

	/**
	 * 设置序列化对象数据
	 * 
	 * @param key
	 *            存储键
	 * @param value
	 *            存储值
	 * @param timeout
	 *            超时时间(单位：秒） 设置为0，则无时效性。
	 * @return
	 */
	public static void setObj(String key, byte[] value, int timeout) {
		if (AOSUtils.isEmpty(key)) {
			throw new NullPointerException("Key不能为空!");
		}
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.set(key.getBytes(), value);
			if (timeout > 0) {
				jedis.expire(key, timeout);
			}
		} catch (Exception e) {
			jedisPool.returnBrokenResource(jedis);
			logger.error("操作Redis失败", e);
		} finally {
			close(jedis);
		}
	}

	/**
	 * 获取字符串型数据
	 * 
	 * @param key
	 * @return
	 */
	public static String getString(String key) {
		if (AOSUtils.isEmpty(key)) {
			throw new NullPointerException("Key不能为空!");
		}
		String value = null;
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			value = jedis.get(key);
		} catch (Exception e) {
			jedisPool.returnBrokenResource(jedis);
			logger.error("操作Redis失败", e);
		} finally {
			close(jedis);
		}
		return value;
	}

	/**
	 * 获取序列化对象数据
	 * 
	 * @param key
	 * @return
	 */
	public static byte[] getObj(String key) {
		if (AOSUtils.isEmpty(key)) {
			throw new NullPointerException("Key不能为空!");
		}
		byte[] value = null;
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			value = jedis.get(key.getBytes());
		} catch (Exception e) {
			jedisPool.returnBrokenResource(jedis);
			logger.error("操作Redis失败", e);
		} finally {
			close(jedis);
		}
		return value;
	}

	/**
	 * 删除对象数据
	 * 
	 * @param key
	 */
	public static void delObj(String key) {
		if (AOSUtils.isEmpty(key)) {
			return;
		}
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.del(key.getBytes());
		} catch (Exception e) {
			jedisPool.returnBrokenResource(jedis);
			logger.error("操作Redis失败", e);
		} finally {
			close(jedis);
		}
	}

	/**
	 * 删除字符串数据
	 * 
	 * @param key
	 */
	public static void delString(String key) {
		if (AOSUtils.isEmpty(key)) {
			return;
		}
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.del(key);
		} catch (Exception e) {
			jedisPool.returnBrokenResource(jedis);
			logger.error("操作Redis失败", e);
		} finally {
			close(jedis);
		}
	}
	
	/**
	 * 清除DB
	 * 
	 * @param key
	 */
	public static void flushDB() {
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.flushDB();
			logger.info("Redsi缓存DB重置成功。");
		} catch (Exception e) {
			jedisPool.returnBrokenResource(jedis);
			logger.error("操作Redis失败", e);
		} finally {
			close(jedis);
		}
	}

	/**
	 * 测试
	 */
	public static void main(String[] args) {
		flushDB();
	}

}

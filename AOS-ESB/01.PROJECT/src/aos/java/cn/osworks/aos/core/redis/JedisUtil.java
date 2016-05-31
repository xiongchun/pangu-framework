package cn.osworks.aos.core.redis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import cn.osworks.aos.core.asset.AOSUtils;

/**
 * <b>Redis客户端</b>
 * 
 * @author OSWorks-XC
 */
@SuppressWarnings("deprecation")
public class JedisUtil {
	
	//连接池对象
	private static JedisPool jedisPool;

	static {
		String host = RedisPropertiesUtil.getProperty("redis.host");
		int port = Integer.valueOf(RedisPropertiesUtil.getProperty("redis.port"));
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxIdle(Integer.valueOf(RedisPropertiesUtil.getProperty("redis.maxIdle")));
        config.setTestOnBorrow(Boolean.valueOf(RedisPropertiesUtil.getProperty("redis.testOnBorrow")));
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
     * @param key 存储键
     * @param value 存储值
     * @param timeout 超时时间(单位：秒） 设置为0，则无时效性。
     * @return
     */
    public static void set(String key, String value, int timeout) {
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
            e.printStackTrace();
        } finally {
            close(jedis);
        }
    }
    
    /**
     * 设置序列化对象数据
     * 
     * @param key 存储键
     * @param value 存储值
     * @param timeout 超时时间(单位：秒） 设置为0，则无时效性。
     * @return
     */
    public static void set(byte[] key, byte[] value, int timeout) {
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
            e.printStackTrace();
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
    public static String get(String key) {
        String value = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            value = jedis.get(key);
        } catch (Exception e) {
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
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
    public static byte[] get(byte[] key) {
        byte[] value = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            value = jedis.get(key);
        } catch (Exception e) {
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            close(jedis);
        }
        return value;
    }
    
    /**
     * 删除数据
     * 
     * @param key
     */
    public static void del(byte[] key) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.del(key);
        } catch (Exception e) {
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            close(jedis);
        }
    }
    
    /**
     * 删除数据
     * 
     * @param key
     */
    public static void del(String key) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.del(key);
        } catch (Exception e) {
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            close(jedis);
        }
    }
    
    /**
     * 测试
     */
    public static void main(String[] args){
    	JedisUtil.set("A1", "曹操", 5);
    	System.out.println(JedisUtil.get("A1"));
    }

}

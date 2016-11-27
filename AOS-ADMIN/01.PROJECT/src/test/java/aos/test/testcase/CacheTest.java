package aos.test.testcase;

import aos.framework.core.redis.JedisUtil;
import redis.clients.jedis.Jedis;

/**
 * 缓存测试
 * 
 * @author xiongchun
 *
 */
public class CacheTest {

	public static void main(String[] args) {
		Jedis jedis = JedisUtil.getJedisClient();
		System.out.println(jedis.info());
	}

}

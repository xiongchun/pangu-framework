package cn.osworks.aos.testcase;

import redis.clients.jedis.Jedis;

/**
 * Redis队列实现
 * 用Redis来模拟队列（redis中lpush（rpop）或rpush(lpop)可以满足要求）
 * @author xiongchun
 *
 */
public class JedisQueueTest {
	
	private static Jedis jedis = new Jedis("192.168.7.253", 6379);

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//lpush();
		rpop();
	}
	
	/**
	 * 往队列压入数据
	 */
	public static void lpush(){
		jedis.lpush("Queue1","测试1");  
        jedis.lpush("Queue1","测试2");  
        jedis.lpush("Queue1","测试3");
        // 第一个是key，第二个是起始位置，第三个是结束位置，jedis.llen获取长度 -1表示取得所有  
        System.out.println(jedis.lrange("Queue1",0,-1));
	}
	
	/**
	 * 从队列取出数据
	 */
	public static void rpop(){
		System.out.println(jedis.rpop("Queue1"));
		System.out.println(jedis.lrange("Queue1",0,-1));
	}

}

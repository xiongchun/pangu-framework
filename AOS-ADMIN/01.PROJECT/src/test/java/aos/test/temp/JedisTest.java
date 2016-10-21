package aos.test.temp;

import java.util.List;

import aos.framework.core.redis.JedisUtil;
import aos.framework.core.utils.AOSJson;
import redis.clients.jedis.Jedis;

/**
 * 
 * @author xiongchun
 */
public class JedisTest {

	public static void main(String[] args) {
		testList2();
	}
	
	public void testMap(){
		Jedis jedis  = JedisUtil.getJedisPool().getResource();
		jedis.hset("users", "001", "用户001");
		jedis.hset("users", "002", "用户002");
		jedis.hset("users", "003", "用户003");
		//查询map中指定key的value
		System.out.println(jedis.hget("users", "002"));
		//取出map中的多个key，以List形式返回
		List<String> listValues = jedis.hmget("users", "001", "002");
		System.out.println(AOSJson.toJson(listValues));
		
		System.out.println(jedis.hlen("users")); //返回key为user的键中存放的值的个数2 
        System.out.println(jedis.exists("users"));//是否存在key为user的记录 返回true  
        System.out.println(jedis.hkeys("users"));//返回map对象中的所有key  
        System.out.println(jedis.hvals("users"));//返回map对象中的所有value
	}
	
    /** 
     * jedis操作Set 
     */  
    public static void testSet(){ 
    	Jedis jedis  = JedisUtil.getJedisPool().getResource();
        //添加
    	jedis.del("user1");
        jedis.sadd("user1","liuling");  
        jedis.sadd("user1","xinxin");  
        jedis.sadd("user1","ling");  
        jedis.sadd("user1","zhangxinxin");
        jedis.sadd("user1","who");  

        //移除noname  
        jedis.srem("user1","who");  
        System.out.println(jedis.smembers("user1"));//获取所有加入的value  
        System.out.println(jedis.sismember("user1", "who"));//判断 who 是否是user集合的元素  
        System.out.println(jedis.srandmember("user1"));  //随机获取
        System.out.println(jedis.scard("user1"));//返回集合的元素个数  
        
    } 
	
	public static void testList(){
		Jedis jedis  = JedisUtil.getJedisPool().getResource();
        //开始前，先移除所有的内容  
        jedis.del("java framework");  
        System.out.println(jedis.lrange("java framework",0,-1));  
        //先向key java framework中存放三条数据  
        jedis.lpush("java framework","spring");  
        jedis.lpush("java framework","struts");  
        jedis.lpush("java framework","hibernate");  
        //再取出所有数据jedis.lrange是按范围取出，  
        // 第一个是key，第二个是起始位置，第三个是结束位置，jedis.llen获取长度 -1表示取得所有  
        System.out.println(jedis.lrange("java framework",0,-1));  
        System.out.println(jedis.llen("java framework")); 
        
        jedis.del("java framework");
        jedis.rpush("java framework","spring");  
        jedis.rpush("java framework","struts");  
        jedis.rpush("java framework","hibernate"); 
        System.out.println(jedis.lrange("java framework",0,-1));
        JedisUtil.close(jedis);
	}
	
	public static void testList2(){
		Jedis jedis  = JedisUtil.getJedisPool().getResource();
		for (int i = 0; i < 1000; i++) {
			//使用rpush能保证取出时按顺序取出
			jedis.lpush("TEST", "LIST：" + i);
		}
		System.out.println("集合总数：" + jedis.llen("TEST"));
		List<String> list = jedis.lrange("TEST",0,9);  
		for (String string : list) {
			System.out.println(string);
		}
		jedis.del("TEST");
        JedisUtil.close(jedis);
	}

}

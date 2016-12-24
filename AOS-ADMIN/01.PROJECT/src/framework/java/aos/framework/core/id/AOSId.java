package aos.framework.core.id;

import java.math.BigInteger;
import java.util.UUID;

import aos.framework.core.asset.AOSBeanLoader;
import aos.framework.core.exception.AOSException;
import aos.framework.core.redis.JedisUtil;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSUtils;
import redis.clients.jedis.Jedis;

/**
 * <b>ID工具类</b>
 * 
 * @author xiongchun
 * @date 2014-06-01
 */
public class AOSId {
	
	/**
	 * 返回去除连接符-的UUID
	 * 
	 * @return
	 */
	public static String uuid() {
		String uuid = rawUuid();
		return uuid.replaceAll("-", "");
	}
	
	/**
	 * 返回原生UUID
	 * 
	 * @return
	 */
	public static String rawUuid() {
		return UUID.randomUUID().toString();
	}
	
	/**
	 * <p>获取规则序列号：基于Redis生成</p>
	 * 生成规则：[前缀] + 时间戳 + 递增重复循环的序列
	 * 
	 * @param idType ID类型 用于作为Redis Key的一部分。标识ID的唯一性。
	 * @param timeFormat 时间戳的格式 缺省值：yyMMddHHmmss
	 * @param maxIncr 循环递增序列最大值 9999
	 * @return
	 */
	public static String appId(String idType, String timeFormat, String maxIncr){
		if (AOSUtils.isEmpty(idType)) {
			throw new AOSException("idType不能为空，请分配ID类型标识。");
		}
		Jedis jedis = JedisUtil.getJedisClient();
		String id = null;
		String IDSET = "IDSET";
		String key = AOSCons.KEYS.ID + idType;
		timeFormat = AOSUtils.isEmpty(timeFormat) ? "yyMMddHHmmss" : timeFormat;
		maxIncr = AOSUtils.isEmpty(maxIncr) ? "9999" : maxIncr;
		while (true) {
			long myIncrLong = jedis.incr(key);
			if (myIncrLong > Integer.valueOf(maxIncr)) {
				jedis.del(key);
				myIncrLong = jedis.incr(key);
			}
			String myIncrStr = String.format("%" + maxIncr.length() + "d", myIncrLong).replace(" ", "0");
			String myPrefix = AOSUtils.getDateStr(timeFormat);
			id = myPrefix + myIncrStr;
			if (!jedis.sismember(IDSET, id)) {
				jedis.sadd(IDSET, id);
				break;
			}
		}
		JedisUtil.close(jedis);
		return id;
	}
	
	/**
	 * * <p>获取数值型规则序列号</p>
	 * 
	 * @param idType
	 * @return
	 */
	public static String appId(String idType){
		return appId(idType, null, null);
	}

	/**
	 * 调用数据库的Sequence返回一个ID。
	 *  
	 * @param sequenceName
	 *            数据库Sequence名称
	 * @return
	 */
	public static BigInteger nextVal(String sequenceName) {
		IdService idService = (IdService)AOSBeanLoader.getSpringBean("idService");
		return idService.nextVal(sequenceName);
	}

}

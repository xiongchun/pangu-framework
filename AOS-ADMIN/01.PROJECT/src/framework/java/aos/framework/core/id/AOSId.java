package aos.framework.core.id;

import java.math.BigInteger;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;

import aos.framework.core.asset.AOSBeanLoader;
import aos.framework.core.redis.JedisUtil;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSUtils;

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
	 * 生成规则：[前缀] + 年月日时分秒 + 4位递增重复循环的序列
	 * 
	 * @param idType ID类型 用于作为Redis Key的一部分。标识ID的唯一性。
	 * @param prefix ID的前缀 如不需要前缀，可以传null或空字符串
	 * @return
	 */
	public static String appId(String idType, String prefix){
		String key = AOSCons.KEYS.ID + idType;
		String seq = prefix == null ? "" : prefix + AOSUtils.getDateStr("yyMMddHHmmss");
		String temp = JedisUtil.getString(key);
		if (AOSUtils.isEmpty(temp)) {
			temp = "0";
			JedisUtil.setString(key, temp, 0);
		}else {
			if (Integer.valueOf(temp) == 9999) {
				temp = "0";
				JedisUtil.setString(key, temp, 0);
			}else {
				temp =String.valueOf( Integer.valueOf(temp) + 1);
				JedisUtil.setString(key, temp, 0);
			}
		}
		temp = String.format("%4d", Integer.valueOf(temp)).replace(" ", "0");
		seq = seq + temp;
		return seq;
	}
	
	/**
	 * * <p>获取数值型规则序列号</p>
	 * 
	 * @param idType
	 * @return
	 */
	public static String appId(String idType){
		return appId(idType, StringUtils.EMPTY);
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

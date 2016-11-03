package aos.framework.core.cache;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import aos.framework.core.redis.JedisUtil;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.dao.Aos_dicDao;
import aos.framework.dao.Aos_dicPO;
import aos.framework.dao.Aos_paramsDao;
import aos.framework.dao.Aos_paramsPO;
import aos.system.common.service.AOSBaseService;
import redis.clients.jedis.Jedis;

/**
 * <b>主数据缓存服务</b>
 * 
 * @author xiongchun
 */
@Service
public class CacheMasterDataService extends AOSBaseService{

	private static Logger log = LoggerFactory.getLogger(CacheMasterDataService.class);
	
	@Autowired
	private Aos_dicDao aos_dicDao;
	@Autowired
	private Aos_paramsDao aos_paramsDao;

	/**
	 * 将全局参数信息刷到缓存
	 */
	public void cacheParamData() {
		List<Aos_paramsPO> aos_paramsPOs = aos_paramsDao.list(null);
		Map<String, String> cacheMap = Maps.newHashMap();
		for (Aos_paramsPO aos_paramsPO : aos_paramsPOs) {
			cacheMap.put(aos_paramsPO.getKey_(), aos_paramsPO.getValue_());
		}
		if (AOSUtils.isNotEmpty(cacheMap)) {
			Jedis jedis = JedisUtil.getJedisClient();
			jedis.hmset(AOSCons.KEYS.PARAM_KEY, cacheMap);
			JedisUtil.close(jedis);
		}
	}
	
	/**
	 * 将单个参数配置项刷到缓存，如果已存在则覆盖
	 * @param fieldKey 参数KEY
	 * @param value 参数值
	 */
	public void cacheParamOption(String fieldKey, String value) {
		Jedis jedis = JedisUtil.getJedisClient();
		jedis.hset(AOSCons.KEYS.PARAM_KEY, fieldKey, value);
		JedisUtil.close(jedis);
	}
	
	/**
	 * 将单个参数配置项刷从缓存中删除
	 * @param fieldKey 参数KEY
	 */
	public void delParamOption(String fieldKey) {
		Jedis jedis = JedisUtil.getJedisClient();
		jedis.hdel(AOSCons.KEYS.PARAM_KEY, fieldKey);
		JedisUtil.close(jedis);
	}

	/**
	 * 从缓存中获取全局参数配置值
	 * 
	 * @param key
	 * @return
	 */
	public String getParam(String key) {
		String value = StringUtils.EMPTY;
		if (AOSUtils.isEmpty(key)) {
			log.error("获取参数失败：全局参数配置Key不能为空。");
			return value;
		}
		Jedis jedis = JedisUtil.getJedisClient();
		value = jedis.hget(AOSCons.KEYS.PARAM_KEY, key);
		JedisUtil.close(jedis);
		return value;
	}

	/**
	 * 将字典表刷到缓存
	 */
	public void cacheDicData() {
		List<Aos_dicPO> aos_dicPOs = aos_dicDao.list(Dtos.newDto("is_enable_", AOSCons.IS.YES));
		Jedis jedis = JedisUtil.getJedisClient();
		// 将字典对照项目载入缓存
		for (Aos_dicPO aos_dicPO : aos_dicPOs) {
			jedis.hset(AOSCons.KEYS.DIC_KEY + aos_dicPO.getKey_(), aos_dicPO.getCode_(), AOSJson.toJson(aos_dicPO));
		}
		JedisUtil.close(jedis);
	}
	
	/**
	 * 将单个字典刷到缓存
	 */
	public void cacheDic(Aos_dicPO aos_dicPO) {
		Jedis jedis = JedisUtil.getJedisClient();
		jedis.hset(AOSCons.KEYS.DIC_KEY + aos_dicPO.getKey_(), aos_dicPO.getCode_(), AOSJson.toJson(aos_dicPO));
		JedisUtil.close(jedis);
	}
	
	/**
	 * 将单个字典从缓存中删除
	 */
	public void delDic(Aos_dicPO aos_dicPO) {
		Jedis jedis = JedisUtil.getJedisClient();
		jedis.hdel(AOSCons.KEYS.DIC_KEY + aos_dicPO.getKey_(), aos_dicPO.getCode_());
		JedisUtil.close(jedis);
	}

	/**
	 * 从缓存中获取字典对照集合
	 * 
	 * @param key
	 * @return
	 */
	public List<Aos_dicPO> getDicList(String key) {
		List<Aos_dicPO> aos_dicPOs = Lists.newArrayList();
		if (AOSUtils.isEmpty(key)) {
			log.error("获取字典对照失败：字典Key不能为空。");
			return aos_dicPOs;
		}
		Jedis jedis = JedisUtil.getJedisClient();
		List<String> dicList = jedis.hvals(AOSCons.KEYS.DIC_KEY + key);
		JedisUtil.close(jedis);
		if (AOSUtils.isEmpty(dicList)) {
			log.error(AOSUtils.merge("没有获取到Key为[{0}]的数据字典。", key));
		}else {
			for (String dicString : dicList) {
				aos_dicPOs.add((Aos_dicPO)AOSJson.fromJson(dicString, Aos_dicPO.class));
			}
		}
		return aos_dicPOs;
	}

	/**
	 * 从缓存中获取字典对照描述
	 * 
	 * @param key
	 * @param code
	 * @return
	 */
	public String getDicDesc(String key, String code) {
		String desc = StringUtils.EMPTY;
		if (AOSUtils.isEmpty(key)) {
			log.error("获取字典对照失败：字典Key不能为空。");
			return desc;
		}
		if (AOSUtils.isEmpty(code)) {
			log.error("获取字典对照失败：字典code不能为空。");
			return desc;
		}
		Jedis jedis = JedisUtil.getJedisClient();
		String dicJson = jedis.hget(AOSCons.KEYS.DIC_KEY + key, code);
		JedisUtil.close(jedis);
		if (AOSUtils.isNotEmpty(dicJson)) {
		    Aos_dicPO aos_dicPO = (Aos_dicPO)AOSJson.fromJson(dicJson, Aos_dicPO.class);
		    desc = aos_dicPO.getDesc_();
		}
		return desc;
	}

}

package aos.system.modules.cacheManage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.gson.reflect.TypeToken;

import aos.framework.core.exception.AOSException;
import aos.framework.core.redis.JedisUtil;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.typewrap.Dtos;
import aos.framework.core.typewrap.impl.HashDto;
import aos.framework.core.utils.AOSCfgHandler;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSCxt;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.web.router.HttpModel;
import aos.system.common.utils.SystemCons;
import redis.clients.jedis.Jedis;

/**
 * <b>Redis缓存管理</b>
 * 
 * @author xiongchun
 */
@Service
public class CacheManageService {

	/**
	 * 页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void init(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		httpModel.setAttribute("app_key", AOSCfgHandler.getValue("app_key"));
		httpModel.setAttribute("juid", inDto.getString("juid"));
		httpModel.setViewPath("system/redis.jsp");
	}

	/**
	 * 代码编辑器页面初始化
	 * 
	 * @param httpModel
	 * @return
	 */
	public void initCodeEditor(HttpModel httpModel) {

		httpModel.setViewPath("system/redis.codeEditor.jsp");
	}

	/**
	 * 查询缓存DB中的Key
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listKeys(HttpModel httpModel) {
		Dto inDto = httpModel.getInDto();
		Jedis jedis = JedisUtil.getJedisClient();
		Set<String> keySet = jedis.keys("*" + inDto.getString("key") + "*");
		List<String> keyList = new ArrayList<String>(keySet);
		List<Dto> list = Lists.newArrayList();
		for (String key_ : keyList) {
			Dto dto = Dtos.newDto();
			dto.put("key", key_);
			dto.put("type", jedis.type(key_));
			long ttl_ = jedis.ttl(key_);
			dto.put("ttl", ttl_ == -1 ? "永久有效" : ttl_ + "秒");
			list.add(dto);
		}
		JedisUtil.close(jedis);
		int start = Integer.valueOf(inDto.getString("start"));
		int end = start + Integer.valueOf(inDto.getString("limit"));
		end = end > list.size() ? list.size() : end;
		List<Dto> outList = list.subList(start, end);

		httpModel.setOutMsg(AOSJson.toGridJson(outList, list.size()));
	}

	/**
	 * 显示详情
	 * 
	 * @param httpModel
	 * @return
	 */
	public void listValues(HttpModel httpModel) {
		List<Dto> outList = Lists.newArrayList();
		Dto inDto = httpModel.getInDto();
		Jedis jedis = JedisUtil.getJedisClient();
		String key = inDto.getString("key");
		String type = inDto.getString("type");
		int total = 0;
		if (StringUtils.equalsIgnoreCase(type, "string")) {
			Dto dto = Dtos.newDto();
			dto.put("field", "-");
			dto.put("value", jedis.get(key));
			outList.add(dto);
			total = outList.size();
		} else if (StringUtils.equalsIgnoreCase(type, "hash")) {
			Set<String> fieldSet = jedis.hkeys(key);
			List<String> fiedList = new ArrayList<>(fieldSet);
			int start = Integer.valueOf(inDto.getString("start"));
			int end = start + Integer.valueOf(inDto.getString("limit"));
			total = fiedList.size();
			end = end > fiedList.size() ? fiedList.size() : end;
			fiedList = fiedList.subList(start, end);
			for (String field : fiedList) {
				Dto dto = Dtos.newDto();
				dto.put("field", field);
				dto.put("value", jedis.hget(key, field));
				outList.add(dto);
			}
		} else if (StringUtils.equalsIgnoreCase(type, "list")) {
			int start = inDto.getPageStart();
			int limit = inDto.getPageLimit();
			List<String> valueList = jedis.lrange(key, start, start + limit);
			for (String value : valueList) {
				Dto dto = Dtos.newDto();
				dto.put("field", "-");
				dto.put("value", value);
				outList.add(dto);
			}
			total = jedis.llen(key).intValue();
		} else if (StringUtils.equalsIgnoreCase(type, "set")) {
			// 由于API的限制，不能对SET类型进行有效的分页操作。所以随机取出10000条记录返回。
			List<String> valueList = jedis.srandmember(key, 10000);
			for (String value : valueList) {
				Dto dto = Dtos.newDto();
				dto.put("field", "-");
				dto.put("value", value);
				outList.add(dto);
			}
			total = jedis.scard(key).intValue();
		}

		JedisUtil.close(jedis);
		httpModel.setOutMsg(AOSJson.toGridJson(outList, total));
	}

	/**
	 * 清空缓存
	 * 
	 * @param httpModel
	 * @return
	 */
	public void flushAll(HttpModel httpModel) {
		if (StringUtils.equals(AOSCons.RUN_MODE.DEMO, AOSCxt.getParam("run_mode"))) {
			throw new AOSException(13);
		}
		Jedis jedis = JedisUtil.getJedisClient();
		jedis.flushAll();
		JedisUtil.close(jedis);
		httpModel.setOutMsg("缓存数据库被清空，你必须重启应用服务器完成基础数据缓存重建。");
	}

	/**
	 * 获取缓存服务器信息
	 * 
	 * @param httpModel
	 * @return
	 */
	public void info(HttpModel httpModel) {
		Jedis jedis = JedisUtil.getJedisClient();
		String info = jedis.info();
		JedisUtil.close(jedis);
		httpModel.setOutMsg(info);
	}

	/**
	 * 删除单个缓存键
	 * 
	 * @param httpModel
	 * @return
	 */
	public void delByKey(HttpModel httpModel) {
		if (StringUtils.equals(AOSCons.RUN_MODE.DEMO, AOSCxt.getParam("run_mode"))) {
			throw new AOSException(13);
		}
		Dto inDto = httpModel.getInDto();
		String key = inDto.getString("key");
		JedisUtil.delString(key);
		httpModel.setOutMsg(AOSUtils.merge("键[{0}]已成功删除。", key));
	}

	/**
	 * 执行命令
	 * 
	 * @param httpModel
	 * @return
	 */
	public void saveCmd(HttpModel httpModel) {
		if (StringUtils.equals(AOSCons.RUN_MODE.DEMO, AOSCxt.getParam("run_mode"))) {
			throw new AOSException(13);
		}
		Dto inDto = httpModel.getInDto();
		Jedis jedis = JedisUtil.getJedisClient();
		String key = inDto.getString("key");
		String type_ = inDto.getString("type");
		String content = inDto.getString("content");
		content = StringUtils.replace(content, "\n", "");
		jedis.del(key);
		if (StringUtils.equals(type_, SystemCons.CMD_TYPE.STRING)) {
			jedis.set(key, content);
		} else if (StringUtils.equals(type_, SystemCons.CMD_TYPE.LIST)) {
			if (StringUtils.startsWith(content, "[{")) {
				List<Dto> list = AOSJson.fromJson(content);
				for (Dto dto : list) {
					jedis.lpush(key, AOSJson.toJson(dto));
				}
			}else {
				List<String> list = AOSJson.fromJson(content, new TypeToken<List<String>>() {}.getType());
				for (String string : list) {
					jedis.lpush(key, string);
				}
			}
		} else if (StringUtils.equals(type_, SystemCons.CMD_TYPE.SET)) {
			if (StringUtils.startsWith(content, "[{")) {
				List<Dto> list = AOSJson.fromJson(content);
				for (Dto dto : list) {
					jedis.sadd(key, AOSJson.toJson(dto));
				}
			}else {
				List<String> list = AOSJson.fromJson(content, new TypeToken<List<String>>() {}.getType());
				for (String string : list) {
					jedis.sadd(key, string);
				}
			}

		} else if (StringUtils.equals(type_, SystemCons.CMD_TYPE.MAP)) {
			Dto dto = AOSJson.fromJson(content, HashDto.class);
			Map<String, String> map = Maps.newHashMap();
			@SuppressWarnings({ "rawtypes", "unchecked" })
			Iterator<String> keyIterator = (Iterator) dto.keySet().iterator();
			while (keyIterator.hasNext()) {
				String myKey = (String) keyIterator.next();
				String value = dto.getString(myKey);
				map.put(myKey, value);
			}
			jedis.hmset(key, map);
		}
		if (inDto.getInteger("timeout") > 0) {
			jedis.expire(key, inDto.getInteger("timeout"));
		}
		JedisUtil.close(jedis);
		httpModel.setOutMsg(AOSUtils.merge("键[{0}]已成功加入缓存。", key));
	}

}

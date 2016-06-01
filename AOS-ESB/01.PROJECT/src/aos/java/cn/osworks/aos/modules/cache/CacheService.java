package cn.osworks.aos.modules.cache;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSListUtils;
import cn.osworks.aos.core.asset.AOSSerializeUtil;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.redis.JedisUtil;
import cn.osworks.aos.core.typewrap.Dtos;

/**
 * <b>应用上下文提供一些基础服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-13
 */
@Service
public class CacheService {
	
	private static Log log = LogFactory.getLog(CacheService.class);
	
	@Autowired
	private SqlDao sqlDao;

	/**
	 * 将全局参数信息刷到缓存
	 */
	public void cacheParamData(){
		List<ParamVO> paramVOs = sqlDao.list("Cache.listParamVOs", null);
		for (ParamVO paramVO : paramVOs) {
			String key = AOSCons.CACHE_PREFIX.PARAM + paramVO.getKey_();
			JedisUtil.set(key, paramVO.getValue_(), 0);
		}
	}
	
	/**
	 * 从缓存中获取全局参数配置值
	 * @param key
	 * @return
	 */
	public String getParam(String key){
		String value = StringUtils.EMPTY;
		if (AOSUtils.isEmpty(key)) {
			log.error("获取参数失败：全局参数配置Key不能为空。");
			return value;
		}
		key = AOSCons.CACHE_PREFIX.PARAM + key;
		value = JedisUtil.get(key);
		return value;
	}
	
	/**
	 * 将字典表刷到缓存
	 */
	public void cacheDicData(){
		List<String> dicIndexs = sqlDao.list("Cache.listDicIndexs", null);
		List<DicVO> dicVOs = sqlDao.list("Cache.listDicVOs", null);
		String jql = "SELECT * FROM :AOSList WHERE key_ = :key_";
		for (String key : dicIndexs) {
			List<DicVO> subDicVOs = AOSListUtils.select(dicVOs, DicVO.class, jql, Dtos.newDto("key_", key));
			if (AOSUtils.isNotEmpty(subDicVOs)) {
				key = AOSCons.CACHE_PREFIX.DIC + key;
				JedisUtil.set(key.getBytes(), AOSSerializeUtil.serialize(subDicVOs), 0);
			}
		}
	}
	
	/**
	 * 从缓存中获取字典对照集合
	 * @param key
	 * @return
	 */
	 @SuppressWarnings("unchecked")
	public List<DicVO> getDicList(String key){
			if (AOSUtils.isEmpty(key)) {
				log.error("获取字典对照失败：字典Key不能为空。");
				return null;
			}
			key = AOSCons.CACHE_PREFIX.DIC + key;
			List<DicVO> outList = (List<DicVO>)AOSSerializeUtil.unSerialize(JedisUtil.get(key.getBytes()));
			return outList;
	 }
	 
		/**
		 * 从缓存中获取字典对照描述
		 * @param key
		 * @param code
		 * @return
		 */
		public String getDicDesc(String key, String code){
			    String desc = StringUtils.EMPTY;
				List<DicVO> dicVOs = getDicList(key);
				String jql = "SELECT * FROM :AOSList WHERE code_ = :code_";
				dicVOs = AOSListUtils.select(dicVOs, DicVO.class, jql, Dtos.newDto("code_", code));
				if (AOSUtils.isNotEmpty(dicVOs)) {
					DicVO dicVO = dicVOs.get(0);
					desc = dicVO.getDesc_();
				}
				return desc;
		 }
	
}

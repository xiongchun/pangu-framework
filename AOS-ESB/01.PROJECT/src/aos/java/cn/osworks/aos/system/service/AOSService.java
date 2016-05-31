package cn.osworks.aos.system.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.AOS;
import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSSerializeUtil;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.redis.JedisUtil;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dicMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dic_indexMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_paramMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_dicPO;
import cn.osworks.aos.system.dao.po.Aos_sys_paramPO;

/**
 * <b>提供一些基础服务</b>
 * 
 * @author OSWorks-XC
 * @date 2014-05-13
 */
@Service("aosService")
public class AOSService {
	
	private static Log log = LogFactory.getLog(AOSService.class);
	
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_paramMapper aos_sys_paramMapper;
	@Autowired
	private Aos_sys_dic_indexMapper aos_sys_dic_indexMapper;
	@Autowired
	private Aos_sys_dicMapper aos_sys_dicMapper;

	/**
	 * 将全局参数信息刷到缓存
	 */
	public void refreshParamDataInCache(){
		List<Aos_sys_paramPO> aos_sys_paramPOs = aos_sys_paramMapper.list(null);
		for (Aos_sys_paramPO aos_sys_paramPO : aos_sys_paramPOs) {
			String key = AOSCons.CACHE_PREFIX.PARAM + aos_sys_paramPO.getKey_();
			JedisUtil.set(key.getBytes(), AOSSerializeUtil.serialize(aos_sys_paramPO), 0);
		}
	}
	
	/**
	 * 从缓存中获取全局参数配置对象
	 */
	public Aos_sys_paramPO getAosSysParamPOFromCache(String pKey){
		if (AOSUtils.isEmpty(pKey)) {
			log.error("获取参数失败：全局参数配置Key不能为空。");
			return null;
		}
		String key = AOSCons.CACHE_PREFIX.PARAM + pKey;
		Aos_sys_paramPO aos_sys_paramPO = (Aos_sys_paramPO)AOSSerializeUtil.unSerialize(JedisUtil.get(key.getBytes()));
		return aos_sys_paramPO;
	}
	
	/**
	 * 从缓存中获取全局参数配置值
	 */
	public String getValueByParamKey(String pKey){
		String value = "";
		Aos_sys_paramPO aos_sys_paramPO = getAosSysParamPOFromCache(pKey);
		if (aos_sys_paramPO != null) {
			value = aos_sys_paramPO.getValue_();
		}
		return value;
	}
	
	/**
	 * 从缓存中获取字典对照集合
	 * @return
	 */
	 public List<Aos_sys_dicPO> getAosSysDicPOListFromCache(String pKey){
		 return null;
	 }
	
}

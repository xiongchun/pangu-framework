package cn.osworks.aos.system.service;

import java.util.List;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.dao.SqlDao;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;
import cn.osworks.aos.system.asset.DicCons;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dicMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_dic_indexMapper;
import cn.osworks.aos.system.dao.mapper.Aos_sys_paramMapper;
import cn.osworks.aos.system.dao.po.Aos_sys_dicPO;
import cn.osworks.aos.system.dao.po.Aos_sys_dic_indexPO;
import cn.osworks.aos.system.dao.po.Aos_sys_paramPO;
import cn.osworks.aos.system.modules.dao.vo.ElementVO;

import com.google.common.collect.Lists;

/**
 * 系统缓存服务
 * 
 * @author XChun
 *
 */
@Service("aosCacheService")
public class AOSCacheService {
	
	@Autowired
	private SqlDao sqlDao;
	@Autowired
	private Aos_sys_paramMapper aos_sys_paramMapper;
	@Autowired
	private Aos_sys_dic_indexMapper aos_sys_dic_indexMapper;
	@Autowired
	private Aos_sys_dicMapper aos_sys_dicMapper;
	
	/**
	 * 刷新系统键值参数
	 */
	public void refreshParamCfgCache(){
		
	}
	
	/**
	 * 刷新字典配置缓存
	 */
	public void refreshDicCfgCache(){
		
	}
	
	/**
	 * 根据参数键获取参数对象
	 * 
	 * @param key_
	 *            参数键
	 */
	public Aos_sys_paramPO getParamPOByParamKey(String key_) {
		Aos_sys_paramPO aos_sys_paramPO = null;
		Cache cache = AOSCxt.getCache(AOSCxt.CACHE.AOSRESOURCECACHE);
		Element element = cache.get(AOSCons.CACHE_PREFIX.PARAM + key_);
		if (element != null) {
		    aos_sys_paramPO = (Aos_sys_paramPO)element.getObjectValue();
		}else {
			aos_sys_paramPO = getParamPOByParamKeyFromDB(key_);
			if (aos_sys_paramPO != null) {
				Element newElement = new Element(AOSCons.CACHE_PREFIX.PARAM + key_, aos_sys_paramPO);
				cache.put(newElement);
			}
		}
		return aos_sys_paramPO;
	}
	
	/**
	 * 从数据库中根据参数键获取参数对象
	 * 
	 * @param key_
	 *            参数键
	 */
	private Aos_sys_paramPO getParamPOByParamKeyFromDB(String key_) {
		Aos_sys_paramPO aos_sys_paramPO = aos_sys_paramMapper.selectOne(Dtos.newDto("key_", key_));
		return aos_sys_paramPO;
	}
	
	/**
	 * 根据数据字典标识键获取字典对照集合
	 * 
	 * @param dickey
	 *            数据字典标识键
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Aos_sys_dicPO> getDicList(String dickey) {
		List<Aos_sys_dicPO> dicList = Lists.newArrayList();
		Cache cache = AOSCxt.getCache(AOSCxt.CACHE.AOSRESOURCECACHE);
		Element element = cache.get(AOSCons.CACHE_PREFIX.DIC + dickey);
		if (element != null) {
			dicList = (List<Aos_sys_dicPO>)element.getObjectValue();
		}else {
			dicList = getDicListFromDB(dickey);
			Element newElement = new Element(AOSCons.CACHE_PREFIX.DIC + dickey, dicList);
			cache.put(newElement);
		}
		return dicList;
	}
	
	/**
	 * 根据数据字典标识键从数据库中获取字典对照集合
	 * 
	 * @param dickey
	 *            数据字典标识键
	 * @return
	 */
	private List<Aos_sys_dicPO> getDicListFromDB(String dickey) {
		List<Aos_sys_dicPO> dicList = Lists.newArrayList();
		Aos_sys_dic_indexPO aos_sys_dic_indexPO = aos_sys_dic_indexMapper.selectOne(Dtos.newDto("key_", dickey));
		if (aos_sys_dic_indexPO != null) {
			Dto inDto = Dtos.newDto();
			inDto.put("status_", DicCons.ENABLED_YES);
			inDto.put("dic_index_id_", aos_sys_dic_indexPO.getId_());
			inDto.setOrder("code_, id_");
			dicList = aos_sys_dicMapper.list(inDto);
		}
		return dicList;
	}
	
	/**
	 * 查询用户关联岗位的页面元素授权信息
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ElementVO> getElementsByPost(Dto inDto) {
		List<ElementVO> cmpList = Lists.newArrayList();
		if (AOSUtils.isEmpty(inDto.getString("is_tag_"))) {
			cmpList = sqlDao.list("Auth.getElementsByPost", inDto);
		}else {
			Cache cache = AOSCxt.getCache(AOSCxt.CACHE.AOSRESOURCECACHE);
			String keyString = AOSCons.CACHE_PREFIX.CMP_POST + mergeElementCatcheKey(inDto);
			Element element = cache.get(keyString);
			if (element != null) {
				cmpList = (List<ElementVO>)element.getObjectValue();
			}else {
				cmpList = sqlDao.list("Auth.getElementsByPost", inDto);
				Element newElement = new Element(keyString, cmpList);
				cache.put(newElement);
			}
		}
		return cmpList;
	}

	/**
	 * 查询用户关联角色的页面元素授权信息
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ElementVO> getElementsByRole(Dto inDto) {
		List<ElementVO> cmpList = Lists.newArrayList();
		if (AOSUtils.isEmpty(inDto.getString("is_tag_"))) {
			cmpList = sqlDao.list("Auth.getElementsByRole", inDto);
		}else {
			Cache cache = AOSCxt.getCache(AOSCxt.CACHE.AOSRESOURCECACHE);
			String keyString = AOSCons.CACHE_PREFIX.CMP_ROLE + mergeElementCatcheKey(inDto);
			Element element = cache.get(keyString);
			if (element != null) {
				cmpList = (List<ElementVO>)element.getObjectValue();
			}else {
				cmpList = sqlDao.list("Auth.getElementsByRole", inDto);
				Element newElement = new Element(keyString, cmpList);
				cache.put(newElement);
			}
		}
		return cmpList;
	}

	/**
	 * 查询用户直接自己的页面元素授权信息
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ElementVO> getElementsByUser(Dto inDto) {
		List<ElementVO> cmpList = Lists.newArrayList();
		if (AOSUtils.isEmpty(inDto.getString("is_tag_"))) {
			cmpList = sqlDao.list("Auth.getElementsByUser", inDto);
		}else {
			Cache cache = AOSCxt.getCache(AOSCxt.CACHE.AOSRESOURCECACHE);
			String keyString = AOSCons.CACHE_PREFIX.CMP_USER + mergeElementCatcheKey(inDto);
			Element element = cache.get(keyString);
			if (element != null) {
				cmpList = (List<ElementVO>)element.getObjectValue();
			}else {
				cmpList = sqlDao.list("Auth.getElementsByUser", inDto);
				Element newElement = new Element(keyString, cmpList);
				cache.put(newElement);
			}
		}
		return cmpList;
	}
	
	/**
	 * 组装授权元素的缓存对象KEY
	 * 
	 * @param inDto
	 * @return
	 */
	private String mergeElementCatcheKey(Dto inDto) {
		String keyString = "";
		keyString = inDto.getString("user_id_") + "_" + inDto.getString("module_id_") + "_" + inDto.getString("page_id_");
		return keyString;
	}
	
}

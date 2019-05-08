package com.gitee.myclouds.common.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyListUtil;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.vo.DictVO;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.google.common.collect.Lists;

import lombok.extern.slf4j.Slf4j;

/**
 * 数据字典公用服务类	
 * 
 * <p>为了不污染依赖工程，此处不使用@Service注解。由依赖工程的启动类决定是否去@import这个资源。
 * 
 * @author xiongchun
 *
 */
@Slf4j
public class DictService {
	
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	/**
	 * 获取数据字典列表
	 * 
	 * @param elementKey
	 * @return
	 */
	public List<DictVO> getDict(String dictType){
		String key = MyCons.CacheKeyOrPrefix.MyDict.getValue() + ":" + dictType;
		List<DictVO> dictVOs = Lists.newArrayList();
		try {
			List<Object> enumObjs = stringRedisTemplate.opsForHash().values(key);
			for (Object obj : enumObjs) {
				dictVOs.add(JSON.parseObject(String.valueOf(obj), DictVO.class));
			}
			//解决不同环境下下拉排序的bug。
			String jql = "SELECT * FROM :MyList ORDER BY sort_no ASC";
			dictVOs = MyListUtil.list(dictVOs, DictVO.class, jql, Dtos.newDto());
		} catch (Exception e) {
			log.error("获取数据字典：【{}】时反生错误", dictType);
			e.printStackTrace();
		}
		return dictVOs;
	}
	
	/**
	 * 获取数据字典对象
	 * 
	 * @param dictType
	 * @param dictKey
	 * @return
	 */
	public DictVO getDictVO(String dictType, String dictKey) {
		List<DictVO> myDictVOs = getDict(dictType);
		String jql = "SELECT * FROM :MyList WHERE dict_key = :dictKey";
		DictVO dictVO = (DictVO)MyListUtil.selectOne(myDictVOs, DictVO.class, jql, Dtos.newDto("dict_key", dictKey));
		return dictVO;
	}
	
	/**
	 * 获取数据字典值
	 * 
	 * @param dictType
	 * @param dictKey
	 * @return
	 */
	public String getDictValue(String dictType, String dictKey) {
		DictVO dictVO = getDictVO(dictType, dictKey);
		return MyUtil.isEmpty(dictVO) ? StringUtils.EMPTY : dictVO.getDict_value();
	}
	
	/**
	 * 获取数据字典值
	 * 
	 * @param dictType
	 * @param dictKey
	 * @param defaultValue
	 * @return
	 */
	public String getDictElementValue(String dictType, String dictKey, String defaultValue) {
		String value = getDictValue(dictType, dictKey);
		return MyUtil.isEmpty(value) ? defaultValue : value;
	}
	
}

package com.gitee.myclouds.system.module.dict;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.vo.OptionVO;
import com.gitee.myclouds.base.vo.PageVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.domain.mydict.MyDictEntity;
import com.gitee.myclouds.system.domain.mydict.MyDictMapper;

import cn.hutool.core.util.StrUtil;

/**
 * 数据字典服务
 * 
 * @author xiongchun
 *
 */
@Service
public class DictService {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MyDictMapper myDictMapper;

	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	public PageVO list(Dto inDto) {
		List<MyDictEntity> myDictEntities = sqlSession.selectList("sql.dict.pageDict", inDto);
		Integer count = sqlSession.selectOne("sql.dict.pageDictCount", inDto);
		return new PageVO().setList(myDictEntities).setCount(count);
	}

	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public MyDictEntity get(Integer id) {
		MyDictEntity myDictEntity = myDictMapper.selectByKey(id);
		return myDictEntity;
	}

	/**
	 * 根据条件查询实体
	 * 
	 * @param type
	 * @param key
	 * @return
	 */
	@Cacheable("mydict:entity")
	public MyDictEntity getByTypeAndKey(String type, String key) {
		Dto inDto = Dtos.newDto().set("type", type).set(key, key);
		MyDictEntity myDictEntity = (MyDictEntity) sqlSession.selectList("sql.dict.getByTypeAndKey", inDto);
		return myDictEntity;
	}

	/**
	 * 根据类型查询字典分组:构造下拉项使用
	 * 
	 * @param id
	 * @return
	 */
	@Cacheable("mydict:group")
	public List<OptionVO> listByType(String type) {
		List<OptionVO> optionVOs = sqlSession.selectList("sql.dict.listByType", type);
		return optionVOs;
	}

	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	@CacheEvict(value = { "mydict:group", "mydict:entity" }, allEntries = true, beforeInvocation = true)
	public void add(Dto inDto) {
		MyDictEntity myDictEntity = new MyDictEntity();
		MyUtil.copyProperties(inDto, myDictEntity);
		if (MyUtil.isNotEmpty(myDictMapper.selectByUkey1(myDictEntity.getDict_type(), myDictEntity.getDict_key()))) {
			throw new BizException(-10, "当前字典已经存在，请重新输入...");
		}
		myDictMapper.insert(myDictEntity);
	}

	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	@CacheEvict(value = { "mydict:group", "mydict:entity" }, allEntries = true, beforeInvocation = true)
	public int update(Dto inDto) {
		MyDictEntity myDictEntity = new MyDictEntity();
		MyUtil.copyProperties(inDto, myDictEntity);
		MyDictEntity oldEntity = myDictMapper.selectByKey(myDictEntity.getId());
		if (!StringUtils.equalsIgnoreCase(myDictEntity.getDict_key(), oldEntity.getDict_key())) {
			if (MyUtil
					.isNotEmpty(myDictMapper.selectByUkey1(myDictEntity.getDict_type(), myDictEntity.getDict_key()))) {
				throw new BizException(-11, "当前字典已经存在，请重新输入...");
			}
		}
		int rows = myDictMapper.updateByKey(myDictEntity);
		return rows;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	@CacheEvict(value = { "mydict:group", "mydict:entity" }, allEntries = true, beforeInvocation = true)
	public int delete(Integer id) {
		return myDictMapper.deleteByKey(id);
	}

	/**
	 * 批量删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = { "mydict:group", "mydict:entity" }, allEntries = true, beforeInvocation = true)
	public int batchDelete(String ids) {
		String[] idsArr = StrUtil.split(ids, ",");
		if (idsArr.length == 0) {
			throw new BizException(-19, "请先选中数据字典后再提交");
		}
		for (String id : idsArr) {
			myDictMapper.deleteByKey(Integer.valueOf(id));
		}
		return idsArr.length;
	}

}

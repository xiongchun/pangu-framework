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
import com.gitee.myclouds.base.vo.OutVO;
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
	public OutVO list(Dto inDto) {
		OutVO outVO = new OutVO(0);
		List<MyDictEntity> myDictEntities = sqlSession.selectList("sql.dict.pageDict", inDto);
		Integer count = sqlSession.selectOne("sql.dict.pageDictCount", inDto);
		outVO.setData(myDictEntities).setCount(count);
		return outVO;
	}

	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public OutVO get(Integer id) {
		OutVO outVO = new OutVO(0);
		MyDictEntity myDictEntity = myDictMapper.selectByKey(id);
		outVO.setData(myDictEntity);
		return outVO;
	}
	
	/**
	 * 根据条件查询实体
	 * 
	 * @param type
	 * @param key
	 * @return
	 */
	@Cacheable("mydict:entity")
	public OutVO getByTypeAndKey(String type, String key) {
		OutVO outVO = new OutVO(0);
		Dto inDto = Dtos.newDto().set("type", type).set(key, key);
		MyDictEntity myDictEntity = (MyDictEntity)sqlSession.selectList("sql.dict.getByTypeAndKey", inDto);
		outVO.setData(myDictEntity);
		return outVO;
	}
	
	/**
	 * 根据类型查询字典分组
	 * 
	 * @param id
	 * @return
	 */
	@Cacheable("mydict:group")
	public OutVO listByType(String type) {
		OutVO outVO = new OutVO(0);
		List<MyDictEntity> dictEntities = sqlSession.selectList("sql.dict.listByType", type);
		outVO.setData(dictEntities);
		return outVO;
	}

	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	@CacheEvict(value = {"mydict:group","mydict:entity"}, allEntries=true, beforeInvocation=true)
	public OutVO add(Dto inDto) {
		OutVO outVO = new OutVO(0);
		MyDictEntity myDictEntity = new MyDictEntity();
		MyUtil.copyProperties(inDto, myDictEntity);
		if (MyUtil.isNotEmpty(myDictMapper.selectByUkey1(myDictEntity.getDict_type(), myDictEntity.getDict_key()))) {
			throw new BizException(-10, "当前字典已经存在，请重新输入...");
		}
		myDictMapper.insert(myDictEntity);
		outVO.setMsg("数据字典新增成功");
		return outVO;
	}

	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	@CacheEvict(value = {"mydict:group","mydict:entity"}, allEntries=true, beforeInvocation=true)
	public OutVO update(Dto inDto) {
		OutVO outVO = new OutVO(0);
		MyDictEntity myDictEntity = new MyDictEntity();
		MyUtil.copyProperties(inDto, myDictEntity);
		MyDictEntity oldEntity = myDictMapper.selectByKey(myDictEntity.getId());
		if (!StringUtils.equalsIgnoreCase(myDictEntity.getDict_key(), oldEntity.getDict_key())) {
			if (MyUtil
					.isNotEmpty(myDictMapper.selectByUkey1(myDictEntity.getDict_type(), myDictEntity.getDict_key()))) {
				throw new BizException(-11, "当前字典已经存在，请重新输入...");
			}
		}
		myDictMapper.updateByKey(myDictEntity);
		outVO.setMsg("数据字典修改成功");
		return outVO;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	@CacheEvict(value = {"mydict:group","mydict:entity"}, allEntries=true, beforeInvocation=true)
	public OutVO delete(Integer id) {
		OutVO outVO = new OutVO(0);
		myDictMapper.deleteByKey(id);
		outVO.setMsg("数据字典删除成功");
		return outVO;
	}

	/**
	 * 批量删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = {"mydict:group","mydict:entity"}, allEntries=true, beforeInvocation=true)
	public OutVO batchDelete(Dto inDto) {
		OutVO outVO = new OutVO(0);
		String[] ids = StrUtil.split(inDto.getString("ids"), ",");
		if (ids.length == 0) {
			throw new BizException(-19, "请先选中数据字典后再提交");
		}
		for (String id : ids) {
			myDictMapper.deleteByKey(Integer.valueOf(id));
		}
		outVO.setMsg("数据字典删除成功");
		return outVO;
	}

}

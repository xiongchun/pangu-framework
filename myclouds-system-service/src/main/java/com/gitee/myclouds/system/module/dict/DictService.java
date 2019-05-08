package com.gitee.myclouds.system.module.dict;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.vo.OutVO;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.system.domain.mydict.MyDictEntity;
import com.gitee.myclouds.system.domain.mydict.MyDictMapper;

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
		OutVO outVO  = new OutVO(0);
		List<MyDictEntity> myDictEntities = sqlSession.selectList("sql.dict.pageDict",inDto);
		Integer count = sqlSession.selectOne("sql.dict.pageDictCount", inDto);
		outVO.setData(myDictEntities);
		outVO.setCount(count);
		return outVO;
	}
	
	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public OutVO get(Integer id) {
		OutVO outVO  = new OutVO(0);
		MyDictEntity myDictEntity = myDictMapper.selectByKey(id);
		outVO.setData(myDictEntity);
		return outVO;
	}
	
	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO save(Dto inDto) {
		OutVO outVO  = new OutVO(0);
		MyDictEntity myDictEntity = new MyDictEntity();
		MyUtil.copyProperties(inDto, myDictEntity);
		if (MyUtil.isEmpty(myDictMapper.selectByUkey1(myDictEntity.getDict_type(), myDictEntity.getDict_key()))) {
			myDictMapper.insert(myDictEntity);
			outVO.setMsg("数据字典新增成功");
		} else {
			outVO.setCode(1).setMsg("当前字典已经存在，请重新输入...");
		}
		return outVO;
	}
	
	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO update(Dto inDto) {
		OutVO outVO  = new OutVO(0);
		MyDictEntity myDictEntity = new MyDictEntity();
		MyUtil.copyProperties(inDto, myDictEntity);
		MyDictEntity oldEntity = myDictMapper.selectByKey(myDictEntity.getId());
		if (!StringUtils.equalsIgnoreCase(myDictEntity.getDict_key(), oldEntity.getDict_key())) {
			if (MyUtil.isNotEmpty(myDictMapper.selectByUkey1(myDictEntity.getDict_type(), myDictEntity.getDict_key()))) {
				outVO.setCode(1).setMsg("当前字典已经存在，请重新输入...");
				return outVO;
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
	public OutVO delete(Dto inDto) {
		OutVO outVO  = new OutVO(0);
		myDictMapper.deleteByKey(inDto.getInteger("id"));
		outVO.setMsg("数据字典删除成功");
		return outVO;
	}
	
}

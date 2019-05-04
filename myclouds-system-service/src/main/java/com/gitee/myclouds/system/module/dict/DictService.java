package com.gitee.myclouds.system.module.dict;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
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
	public String list(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<MyDictEntity> myEnumEntities = sqlSession.selectList("sql.dict.pageDict",inDto);
		Integer total = sqlSession.selectOne("sql.dict.pageDictCount", inDto);
		outDto.put("data", myEnumEntities);
		outDto.put("recordsTotal", total);
		outDto.put("recordsFiltered", total);
		return JSON.toJSONString(outDto);
	}
	
	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public String get(Integer id) {
		MyDictEntity myDictEntity = myDictMapper.selectByKey(id);
		return JSON.toJSONString(myDictEntity);
	}
	
	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto save(Dto inDto) {
		Dto outDto = null;
		//拷贝参数对象中的属性到实体对象中
		MyDictEntity myDictEntity = new MyDictEntity().copyFrom(inDto);
		if (MyUtil.isEmpty(myDictMapper.selectByUkey1(myDictEntity.getDict_type(), myDictEntity.getDict_key()))) {
			myDictMapper.insert(myDictEntity);
			outDto = Dtos.newDto().put2("code", "1").put2("msg", "字典保存成功");
		} else {
			outDto = Dtos.newDto().put2("code", "-1").put2("msg", "当前字典已经存在，请重新输入...");
		}
		return outDto;
	}
	
	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto update(Dto inDto) {
		Dto outDto = null;
		MyDictEntity myDictEntity = new MyDictEntity().copyFrom(inDto);
		MyDictEntity oldEntity = myDictMapper.selectByKey(myDictEntity.getId());
		if (!StringUtils.equalsIgnoreCase(myDictEntity.getDict_key(), oldEntity.getDict_key())) {
			if (MyUtil.isNotEmpty(myDictMapper.selectByUkey1(myDictEntity.getDict_type(), myDictEntity.getDict_key()))) {
				outDto = Dtos.newDto().put2("code", "-1").put2("msg", "当前字典已经存在，请重新输入....");
				return outDto;
			}
		}
		myDictMapper.updateByKey(myDictEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "字典修改成功");
		return outDto;
	}
	
	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto delete(Dto inDto) {
		myDictMapper.deleteByKey(inDto.getInteger("id"));
		Dto outDto = Dtos.newDto().put2("code", "1").put2("msg", "字典删除成功");
		return outDto;
	}
	
}

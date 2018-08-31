package com.gitee.myclouds.admin.modules.enums;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.myenum.MyEnumEntity;
import com.gitee.myclouds.admin.domain.myenum.MyEnumMapper;
import com.gitee.myclouds.admin.modules.cache.CacheCfgService;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 * 枚举类型参数服务
 * 
 * @author xiongchun
 *
 */
@Service
public class EnumsService {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private CacheCfgService cacheCfgService;
	@Autowired
	private MyEnumMapper myEnumMapper;
	
	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	public String list(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<MyEnumEntity> myEnumEntities = sqlSession.selectList("sql.enums.pageEnums",inDto);
		Integer total = sqlSession.selectOne("sql.enums.pageEnumsCount", inDto);
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
		MyEnumEntity myEnumEntity = myEnumMapper.selectByKey(id);
		return JSON.toJSONString(myEnumEntity);
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
		MyEnumEntity myEnumEntity = new MyEnumEntity().copyFrom(inDto);
		if (MyUtil.isEmpty(myEnumMapper.selectByUkey1(myEnumEntity.getEnum_key(), myEnumEntity.getElement_key()))) {
			myEnumMapper.insert(myEnumEntity);
			cacheCfgService.cacheEnum(myEnumEntity);
			outDto = Dtos.newDto().put2("code", "1").put2("msg", "枚举元素保存成功");
		} else {
			outDto = Dtos.newDto().put2("code", "-1").put2("msg", "当前枚举元素已经存在，请重新输入...");
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
		MyEnumEntity myEnumEntity = new MyEnumEntity().copyFrom(inDto);
		MyEnumEntity oldEntity = myEnumMapper.selectByKey(myEnumEntity.getId());
		if (!StringUtils.equalsIgnoreCase(myEnumEntity.getElement_key(), oldEntity.getElement_key())) {
			if (MyUtil.isNotEmpty(myEnumMapper.selectByUkey1(myEnumEntity.getEnum_key(), myEnumEntity.getElement_key()))) {
				outDto = Dtos.newDto().put2("code", "-1").put2("msg", "当前枚举元素已经存在，请重新输入....");
				return outDto;
			}
		}
		myEnumMapper.updateByKey(myEnumEntity);
		cacheCfgService.cacheEnum(myEnumEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "枚举元素修改成功");
		return outDto;
	}
	
	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto delete(Dto inDto) {
		myEnumMapper.deleteByKey(inDto.getInteger("id"));
		cacheCfgService.deleteEnumFromCache(inDto.getString("enum_key"), inDto.getString("element_key"));
		Dto outDto = Dtos.newDto().put2("code", "1").put2("msg", "枚举元素删除成功");
		return outDto;
	}
	
}

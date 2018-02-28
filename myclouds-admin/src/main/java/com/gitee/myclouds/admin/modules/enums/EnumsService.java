package com.gitee.myclouds.admin.modules.enums;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.myenum.MyEnumEntity;
import com.gitee.myclouds.admin.domain.myenum.MyEnumMapper;
import com.gitee.myclouds.admin.modules.cache.CacheCfgService;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

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
	 * 查询枚举类型列表
	 * 
	 * @param inDto
	 * @return
	 */
	public String listEnums(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<MyEnumEntity> myEnumEntities = sqlSession.selectList("sql.enums.pageEnums",inDto);
		Integer total = sqlSession.selectOne("sql.enums.pageEnumsCount", inDto);
		outDto.put("data", myEnumEntities);
		outDto.put("recordsTotal", total);
		outDto.put("recordsFiltered", total);
		return JSON.toJSONString(outDto);
	}
	
	/**
	 * 删除枚举类型
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto deleteEnum(Dto inDto) {
		myEnumMapper.deleteByKey(inDto.getInteger("id"));
		cacheCfgService.deleteEnumFromCache(inDto.getString("enum_key"), inDto.getString("element_key"));
		Dto outDto = Dtos.newPlainDto("code:1", "msg:枚举元素删除成功");
		return outDto;
	}
	
}

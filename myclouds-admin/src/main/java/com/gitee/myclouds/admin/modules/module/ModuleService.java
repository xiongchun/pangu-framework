package com.gitee.myclouds.admin.modules.module;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.mymodule.MyModuleEntity;
import com.gitee.myclouds.admin.domain.mymodule.MyModuleMapper;
import com.gitee.myclouds.toolbox.wrap.Dto;
import com.gitee.myclouds.toolbox.wrap.Dtos;

/**
 *  资源模块服务
 * 
 * @author xiongchun
 *
 */
@Service
public class ModuleService {

	@Autowired
	private MyModuleMapper myModuleMapper;
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 查询
	 * 
	 * @param inDto
	 * @return
	 */
	public String list(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<MyModuleEntity> myModuleEntities = myModuleMapper.list(inDto);
		outDto.put("data", myModuleEntities);
		outDto.put("recordsTotal", myModuleEntities.size());
		outDto.put("recordsFiltered", myModuleEntities.size());
		return JSON.toJSONString(outDto);
	}
	
	/**
	 * 保存
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto save(Dto inDto) {
		Dto outDto = null;
		//拷贝参数对象中的属性到实体对象中
		MyModuleEntity myModuleEntity = new MyModuleEntity().copyFrom(inDto);
		myModuleMapper.insert(myModuleEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "资源模块信息保存成功");
		return outDto;
	}
	
	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto delete(Dto inDto) {
		Integer moduleId = inDto.getInteger("id");
		myModuleMapper.deleteByKey(moduleId);
		sqlSession.delete("sql.module.deleteMyRoleModule", moduleId);
		Dto outDto = Dtos.newDto().put2("code", "1").put2("msg", "资源模块删除成功");
		return outDto;
	}
	
}

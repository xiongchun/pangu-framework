package com.gitee.myclouds.system.module.module;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.domain.mymodule.MyModuleEntity;
import com.gitee.myclouds.system.domain.mymodule.MyModuleMapper;

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
	public OutVO list(Dto inDto) {
		OutVO outVO  = new OutVO(0);
		List<MyModuleEntity> myModuleEntitys = sqlSession.selectList("sql.module.pageModule",inDto);
		outVO.setData(myModuleEntitys).setCount(myModuleEntitys.size());
		return outVO;
	}
	
	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public String get(Integer id) {
		MyModuleEntity myModuleEntity = myModuleMapper.selectByKey(id);
		return JSON.toJSONString(myModuleEntity);
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
		MyModuleEntity myModuleEntity = new MyModuleEntity();
		MyUtil.copyProperties(inDto, myModuleEntity);
		myModuleMapper.insert(myModuleEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "资源模块信息保存成功");
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
		MyModuleEntity myModuleEntity = new MyModuleEntity();
		MyUtil.copyProperties(inDto, myModuleEntity);
		myModuleMapper.updateByKey(myModuleEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "资源模块信息修改成功");
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
		Integer cnt = sqlSession.selectOne("sql.module.countSubModules", moduleId);
		if (cnt > 0) {
			return Dtos.newDto().put2("code", "-1").put2("msg", "该节点包含子节点，不能删除。请先删除子节点。");
		}
		myModuleMapper.deleteByKey(moduleId);
		sqlSession.delete("sql.module.deleteMyRoleModule", moduleId);
		Dto outDto = Dtos.newDto().put2("code", "1").put2("msg", "资源模块删除成功");
		return outDto;
	}
	
	/**
	 * 查询资源树
	 * 
	 * @param inDto
	 * @return
	 */
	public String listModuleTree(Dto inDto) {
		return null;
	}
	
}

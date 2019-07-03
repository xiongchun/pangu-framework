package com.gitee.myclouds.system.module.module;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.helper.treebuiler.TreeBuilder;
import com.gitee.myclouds.base.helper.treebuiler.TreeNodeVO;
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
		List<MyModuleEntity> myModuleEntitys = sqlSession.selectList("sql.module.listModule",inDto);
		outVO.setData(myModuleEntitys).setCount(myModuleEntitys.size());
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
		MyModuleEntity myModuleEntity = myModuleMapper.selectByKey(id);
		MyModuleEntity parentEntity = myModuleMapper.selectByKey(myModuleEntity.getParent_id());
		Dto dto = Dtos.newDto();
		MyUtil.copyProperties(myModuleEntity, dto);
		if (MyUtil.isNotEmpty(parentEntity)) {
			dto.put("parent_name", parentEntity.getName());
		}else {
			dto.put("parent_name", "无");
		}
		outVO.setData(dto);
		return outVO;
	}
	
	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO add(Dto inDto) {
		OutVO outVO  = new OutVO(0);
		MyModuleEntity myModuleEntity = new MyModuleEntity();
		MyUtil.copyProperties(inDto, myModuleEntity);
		if (MyUtil.isEmpty(myModuleEntity.getParent_id())) {
			myModuleEntity.setParent_id(0);
		}
		myModuleMapper.insert(myModuleEntity);
		outVO.setMsg("资源模块新增成功");
		return outVO;
	}
	
	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	@CacheEvict(value = "myhome:init", allEntries=true, beforeInvocation=true)
	public OutVO update(Dto inDto) {
		OutVO outVO  = new OutVO(0);
		MyModuleEntity myModuleEntity = new MyModuleEntity();
		MyUtil.copyProperties(inDto, myModuleEntity);
		myModuleMapper.updateByKey(myModuleEntity);
		outVO.setMsg("资源模块修改成功");
		return outVO;
	}
	
	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = "myhome:init", allEntries=true, beforeInvocation=true)
	public OutVO delete(Integer moduleId) {
		OutVO outVO  = new OutVO(0);
		Integer cnt = sqlSession.selectOne("sql.module.countSubModules", moduleId);
		if (cnt > 0) {
			throw new BizException(-12, "操作取消。请先删除子节点。");
		}
		myModuleMapper.deleteByKey(moduleId);
		sqlSession.delete("sql.module.deleteMyRoleModule", moduleId);
		outVO.setMsg("资源模块修改成功");
		return outVO;
	}
	
	/**
	 * 查询资源树（返回树状数据模型）
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO listModuleTree(Dto inDto) {
		OutVO outVO  = new OutVO(0);
		List<TreeNodeVO> treeNodeVOs = sqlSession.selectList("sql.module.listModuleTree", inDto);
		outVO.setData(new TreeBuilder(treeNodeVOs).buildTree());
		return outVO;
	}
	
}

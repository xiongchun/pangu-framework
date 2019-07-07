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
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
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
	public List<MyModuleEntity> list(Dto inDto) {
		List<MyModuleEntity> myModuleEntitys = sqlSession.selectList("sql.module.listModule",inDto);
		return myModuleEntitys;
	}
	
	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public MyModuleEntity get(Integer id) {
		MyModuleEntity myModuleEntity = myModuleMapper.selectByKey(id);
		return myModuleEntity;
	}
	
	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	public void add(Dto inDto) {
		MyModuleEntity myModuleEntity = new MyModuleEntity();
		MyUtil.copyProperties(inDto, myModuleEntity);
		if (MyUtil.isEmpty(myModuleEntity.getParent_id())) {
			myModuleEntity.setParent_id(0);
		}
		myModuleMapper.insert(myModuleEntity);
	}
	
	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	@CacheEvict(value = "myhome:init", allEntries=true, beforeInvocation=true)
	public int update(Dto inDto) {
		MyModuleEntity myModuleEntity = new MyModuleEntity();
		MyUtil.copyProperties(inDto, myModuleEntity);
		int rows = myModuleMapper.updateByKey(myModuleEntity);
		return rows;
	}
	
	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = "myhome:init", allEntries=true, beforeInvocation=true)
	public int delete(Integer moduleId) {
		Integer cnt = sqlSession.selectOne("sql.module.countSubModules", moduleId);
		if (cnt > 0) {
			throw new BizException(-12, "操作取消。请先删除子节点。");
		}
		myModuleMapper.deleteByKey(moduleId);
		int rows = sqlSession.delete("sql.module.deleteMyRoleModule", moduleId);
		return rows;
	}
	
	/**
	 * 查询资源树（返回树状数据模型）
	 * 
	 * @param inDto
	 * @return
	 */
	public List<TreeNodeVO> listModuleTree(Dto inDto) {
		List<TreeNodeVO> treeNodeVOs = sqlSession.selectList("sql.module.listModuleTree", inDto);
		treeNodeVOs = new TreeBuilder(treeNodeVOs).buildTree();
		return treeNodeVOs;
	}
	
}

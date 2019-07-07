package com.gitee.myclouds.system.module.role;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.helper.treebuiler.TreeBuilder;
import com.gitee.myclouds.base.helper.treebuiler.TreeNodeVO;
import com.gitee.myclouds.base.util.BaseCons;
import com.gitee.myclouds.base.vo.PageVO;
import com.gitee.myclouds.base.vo.UserVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.domain.myrole.MyRoleEntity;
import com.gitee.myclouds.system.domain.myrole.MyRoleMapper;
import com.gitee.myclouds.system.domain.myrolemodule.MyRoleModuleEntity;
import com.gitee.myclouds.system.domain.myrolemodule.MyRoleModuleMapper;

import cn.hutool.core.util.StrUtil;

/**
 * 角色与授权服务
 * 
 * @author xiongchun
 *
 */
@Service
public class RoleService {

	@Autowired
	private MyRoleMapper myRoleMapper;
	@Autowired
	private MyRoleModuleMapper myRoleModuleMapper;
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 查询
	 * 
	 * @param inDto
	 * @return
	 */
	public PageVO list(Dto inDto, UserVO userVO) {
		PageVO pageVO = new PageVO();
		inDto.put("activeUserId", userVO.getId());
		List<MyRoleEntity> myRoleEntities = sqlSession.selectList("sql.role.pageRole", inDto);
		Integer count = sqlSession.selectOne("sql.role.pageRoleCount", inDto);
		pageVO.setList(myRoleEntities).setCount(count);
		return pageVO;
	}

	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public MyRoleEntity get(Integer id) {
		MyRoleEntity myRoleEntity = myRoleMapper.selectByKey(id);
		return myRoleEntity;
	}

	/**
	 * 新增角色
	 * 
	 * @param inDto
	 * @return
	 */
	public void add(Dto inDto, UserVO userVO) {
		MyRoleEntity myRoleEntity = new MyRoleEntity();
		MyUtil.copyProperties(inDto, myRoleEntity);
		myRoleEntity.setCreate_by(userVO.getName());
		myRoleEntity.setCreate_by_id(userVO.getId());
		myRoleMapper.insert(myRoleEntity);
	}

	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	public int update(Dto inDto) {
		MyRoleEntity myRoleEntity = new MyRoleEntity();
		MyUtil.copyProperties(inDto, myRoleEntity);
		int rows = myRoleMapper.updateByKey(myRoleEntity);
		return rows;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = "myhome:init", allEntries = true, beforeInvocation = true)
	public int delete(Integer roleId) {
		int rows = myRoleMapper.deleteByKey(roleId);
		sqlSession.delete("sql.role.deleteMyUserRole", roleId);
		sqlSession.delete("sql.role.deleteMyRoleModule", roleId);
		return rows;
	}

	/**
	 * 批量删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = "myhome:init", allEntries = true, beforeInvocation = true)
	public int batchDelete(Dto inDto) {
		String[] ids = StrUtil.split(inDto.getString("ids"), ",");
		if (ids.length == 0) {
			throw new BizException(-18, "请先选中角色后再提交");
		}
		for (String id : ids) {
			Integer roleId = Integer.valueOf(id);
			myRoleMapper.deleteByKey(roleId);
			sqlSession.delete("sql.role.deleteMyUserRole", roleId);
			sqlSession.delete("sql.role.deleteMyRoleModule", roleId);
		}
		return ids.length;
	}

	/**
	 * 查询授权树（返回树状数据模型）
	 * 
	 * @param roleId
	 * @return
	 */
	// TODO 没有支持子部门管理员的授权操作，迭代版本支持
	public List<TreeNodeVO> listGrantTree(Integer roleId) {
		Dto inDto = Dtos.newDto().set("roleId", roleId);
		List<TreeNodeVO> treeNodeVOs = sqlSession.selectList("sql.role.listModuleTree", inDto);
		treeNodeVOs = new TreeBuilder(treeNodeVOs).buildTree();
		for (TreeNodeVO treeNodeVO : treeNodeVOs) {
			if (MyUtil.isNotEmpty(treeNodeVO.getChildren())) {
				// 配合eletree数据模型，取消树枝节点的复选状态
				treeNodeVO.setChecked(null);
			}
		}
		return treeNodeVOs;
	}

	/**
	 * 授权
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = "myhome:init", allEntries = true, beforeInvocation = true)
	public void grant(Dto inDto, UserVO userVO) {
		Integer roleId = inDto.getInteger("roleId");
		sqlSession.delete("sql.role.deleteMyRoleModule", roleId);
		String moduleIds = inDto.getString("moduleIds");
		for (String moduleId : StringUtils.split(moduleIds, ",")) {
			MyRoleModuleEntity myRoleModuleEntity = new MyRoleModuleEntity();
			myRoleModuleEntity.setRole_id(roleId);
			myRoleModuleEntity.setModule_id(Integer.valueOf(moduleId));
			myRoleModuleEntity.setGrant_type(BaseCons.GrantType.BIZ.getValue());
			myRoleModuleEntity.setCreate_by(userVO.getId());
			myRoleModuleMapper.insert(myRoleModuleEntity);
		}
	}

}

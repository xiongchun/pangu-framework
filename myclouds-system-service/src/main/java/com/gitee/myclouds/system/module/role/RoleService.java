package com.gitee.myclouds.system.module.role;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.helper.treebuiler.TreeBuilder;
import com.gitee.myclouds.base.helper.treebuiler.TreeNodeVO;
import com.gitee.myclouds.base.util.BaseCons;
import com.gitee.myclouds.base.vo.OutVO;
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
	public OutVO list(Dto inDto, UserVO userVO) {
		OutVO outVO = new OutVO(0);
		inDto.put("activeUserId", userVO.getId());
		List<MyRoleEntity> myRoleEntities = sqlSession.selectList("sql.role.pageRole", inDto);
		Integer count = sqlSession.selectOne("sql.role.pageRoleCount", inDto);
		outVO.setData(myRoleEntities).setCount(count);
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
		MyRoleEntity myRoleEntity = myRoleMapper.selectByKey(id);
		outVO.setData(myRoleEntity);
		return outVO;
	}

	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO update(Dto inDto) {
		OutVO outVO = new OutVO(0);
		MyRoleEntity myRoleEntity = new MyRoleEntity();
		MyUtil.copyProperties(inDto, myRoleEntity);
		myRoleMapper.updateByKey(myRoleEntity);
		outVO.setMsg("角色修改成功");
		return outVO;
	}

	/**
	 * 新增角色
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO add(Dto inDto, UserVO userVO) {
		OutVO outVO = new OutVO(0);
		MyRoleEntity myRoleEntity = new MyRoleEntity();
		MyUtil.copyProperties(inDto, myRoleEntity);
		myRoleEntity.setCreate_by(userVO.getName());
		myRoleEntity.setCreate_by_id(userVO.getId());
		myRoleMapper.insert(myRoleEntity);
		outVO.setMsg("角色新增成功");
		return outVO;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public OutVO delete(Integer roleId) {
		OutVO outVO = new OutVO(0);
		myRoleMapper.deleteByKey(roleId);
		sqlSession.delete("sql.role.deleteMyUserRole", roleId);
		sqlSession.delete("sql.role.deleteMyRoleModule", roleId);
		outVO.setMsg("角色删除成功");
		return outVO;
	}

	/**
	 * 批量删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public OutVO batchDelete(Dto inDto) {
		OutVO outVO = new OutVO(0);
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
		outVO.setMsg("角色删除成功");
		return outVO;
	}

	/**
	 * 查询授权树（返回树状数据模型）
	 * 
	 * @param roleId
	 * @return
	 */
	// TODO 没有支持子部门管理员的授权操作，迭代版本支持
	public OutVO listGrantTree(Integer roleId) {
		OutVO outVO = new OutVO(0);
		Dto inDto = Dtos.newDto().set("roleId", roleId);
		List<TreeNodeVO> treeNodeVOs = sqlSession.selectList("sql.role.listModuleTree", inDto);
		treeNodeVOs = new TreeBuilder(treeNodeVOs).buildTree();
		for (TreeNodeVO treeNodeVO : treeNodeVOs) {
			if (MyUtil.isNotEmpty(treeNodeVO.getChildren())) {
				// 配合eletree数据模型，取消树枝节点的复选状态
				treeNodeVO.setChecked(null);
			}
		}
		outVO.setData(treeNodeVOs);
		return outVO;
	}

	/**
	 * 授权
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public OutVO grant(Dto inDto, UserVO userVO) {
		OutVO outVO = new OutVO(0);
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
		outVO.setMsg("角色授权成功");
		return outVO;
	}

}

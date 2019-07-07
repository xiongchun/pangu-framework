package com.gitee.myclouds.system.module.org;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.helper.treebuiler.TreeBuilder;
import com.gitee.myclouds.base.helper.treebuiler.TreeNodeVO;
import com.gitee.myclouds.base.vo.UserVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.system.domain.mymodule.MyModuleEntity;
import com.gitee.myclouds.system.domain.myorg.MyOrgEntity;
import com.gitee.myclouds.system.domain.myorg.MyOrgMapper;

/**
 * 组织机构 服务
 * 
 * @author xiongchun
 *
 */
@Service
public class OrgService {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MyOrgMapper myOrgMapper;
	
	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	public List<MyModuleEntity> list(Dto inDto) {
		List<MyModuleEntity> myModuleEntitys = sqlSession.selectList("sql.org.listOrg", inDto);
		return myModuleEntitys;
	}
	
	/**
	 * 查询实体
	 * @param orgId
	 * @return
	 */
	@Cacheable("myorg:entity")
	public MyOrgEntity get(Integer orgId) {
		MyOrgEntity myOrgEntity = myOrgMapper.selectByKey(orgId);
		return myOrgEntity;
	}

	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	public void add(Dto inDto, UserVO userVO) {
		MyOrgEntity myOrgEntity = new MyOrgEntity();
		MyUtil.copyProperties(inDto, myOrgEntity);
		myOrgEntity.setCreate_by(userVO.getName());
		myOrgEntity.setCreate_by_id(userVO.getId());
		myOrgMapper.insert(myOrgEntity);
	}

	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	@CacheEvict(value = "myorg:entity", allEntries=true, beforeInvocation=true)
	public int update(Dto inDto) {
		MyOrgEntity myOrgEntity = new MyOrgEntity();
		MyUtil.copyProperties(inDto, myOrgEntity);
		int rows = myOrgMapper.updateByKey(myOrgEntity);
		return rows;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = "myorg:entity", allEntries=true, beforeInvocation=true)
	public int delete(Integer orgId) {
		if (orgId == 1) {
			throw new BizException(-13, "操作取消，根组织不能删除");
		}
		Integer total = sqlSession.selectOne("sql.org.countOrgs", orgId);
		if (total > 0) {
			throw new BizException(-14, "操作取消，请先删除子部门");
		}
		int rows = myOrgMapper.deleteByKey(orgId);
		sqlSession.delete("sql.org.deleteMyUser", orgId);
		return rows;
	}
	
	/**
	 * 查询组织树（返回树状数据模型）
	 * 
	 * @param inDto
	 * @return
	 */
	public List<TreeNodeVO> listOrgTree(Dto inDto) {
		List<TreeNodeVO> treeNodeVOs = sqlSession.selectList("sql.org.listOrgTree", inDto);
		treeNodeVOs = new TreeBuilder(treeNodeVOs).buildTree();
		return treeNodeVOs;
	}

}

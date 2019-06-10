package com.gitee.myclouds.system.module.org;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.helper.treebuiler.TreeBuilder;
import com.gitee.myclouds.base.helper.treebuiler.TreeNodeVO;
import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
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
	public OutVO list(Dto inDto) {
		OutVO outVO = new OutVO(0);
		List<MyModuleEntity> myModuleEntitys = sqlSession.selectList("sql.org.listOrg", inDto);
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
		MyOrgEntity myOrgEntity = myOrgMapper.selectByKey(id);
		MyOrgEntity parentEntity = myOrgMapper.selectByKey(myOrgEntity.getParent_id());
		Dto dto = Dtos.newDto();
		MyUtil.copyProperties(myOrgEntity, dto);
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
		OutVO outVO = new OutVO(0);
		MyOrgEntity myOrgEntity = new MyOrgEntity();
		MyUtil.copyProperties(inDto, myOrgEntity);
		//TODO curUser
		myOrgEntity.setCreate_by("超级用户");
		myOrgEntity.setCreate_by_id(1);
		myOrgMapper.insert(myOrgEntity);
		outVO.setMsg("组织新增成功");
		return outVO;
	}

	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO update(Dto inDto) {
		OutVO outVO  = new OutVO(0);
		MyOrgEntity myOrgEntity = new MyOrgEntity();
		MyUtil.copyProperties(inDto, myOrgEntity);
		myOrgMapper.updateByKey(myOrgEntity);
		outVO.setMsg("组织修改成功");
		return outVO;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO delete(Integer orgId) {
		OutVO outVO = new OutVO(0);
		if (orgId == 1) {
			throw new BizException(-13, "操作取消，根组织不能删除");
		}
		Integer total = sqlSession.selectOne("sql.org.countOrgs", orgId);
		if (total > 0) {
			throw new BizException(-14, "操作取消，请先删除子部门");
		}
		myOrgMapper.deleteByKey(orgId);
		sqlSession.delete("sql.org.deleteMyUser", orgId);
		outVO.setMsg("组织删除成功");
		return outVO;
	}
	
	/**
	 * 查询组织树（返回树状数据模型）
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO listOrgTree(Dto inDto) {
		OutVO outVO  = new OutVO(0);
		List<TreeNodeVO> treeNodeVOs = sqlSession.selectList("sql.org.listOrgTree", inDto);
		outVO.setData(new TreeBuilder(treeNodeVOs).buildTree());
		return outVO;
	}

}

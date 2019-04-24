package com.gitee.myclouds.admin.modules.org;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.myorg.MyOrgEntity;
import com.gitee.myclouds.admin.domain.myorg.MyOrgMapper;
import com.gitee.myclouds.common.vo.MyUserVO;
import com.gitee.myclouds.common.vo.ZtreeNodeVO;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

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
	public String list(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<Dto> myOrgDtos = sqlSession.selectList("sql.org.pageOrg",inDto);
		Integer total = sqlSession.selectOne("sql.org.pageOrgCount", inDto);
		outDto.put("data", myOrgDtos);
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
		MyOrgEntity myOrgEntity = myOrgMapper.selectByKey(id);
		return JSON.toJSONString(myOrgEntity);
	}
	
	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto save(Dto inDto) {
		Dto outDto = null;
		// 拷贝参数对象中的属性到实体对象中
		MyOrgEntity myOrgEntity = new MyOrgEntity().copyFrom(inDto);
		MyUserVO curUser = inDto.getCurUser();
		myOrgEntity.setCreate_by(curUser.getName());
		myOrgEntity.setCreate_by_id(curUser.getId());
		myOrgMapper.insert(myOrgEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "部门新增成功");
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
		//拷贝参数对象中的属性到实体对象中
		MyOrgEntity myOrgEntity = new MyOrgEntity().copyFrom(inDto);
		myOrgMapper.updateByKey(myOrgEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "部门修改成功");
		return outDto;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto delete(Dto inDto) {
		Dto outDto = Dtos.newDto();
		Integer orgId = inDto.getInteger("id");
		Integer total = sqlSession.selectOne("sql.org.countOrgs", orgId);
		if (total > 0) {
			outDto.put2("code", "-1").put2("msg", "部门删除失败。请先删除下级部门。");
		}else {
			myOrgMapper.deleteByKey(orgId);
			sqlSession.delete("sql.org.deleteMyUser", orgId);
			outDto.put2("code", "1").put2("msg", "部门删除成功");
		}
		return outDto;
	}
	
	/**
	 * 查询部门树
	 * 
	 * @param inDto
	 * @return
	 */
	//TODO 没有支持子部门操作，迭代版本支持
	public String listOrgTree(Dto inDto) {
		List<ZtreeNodeVO> zTreeNodeVOs = sqlSession.selectList("sql.org.listOrgTree");
		return JSON.toJSONString(zTreeNodeVOs);
	}
	
}

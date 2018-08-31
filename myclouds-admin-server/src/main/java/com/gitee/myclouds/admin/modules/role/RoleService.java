package com.gitee.myclouds.admin.modules.role;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.myrole.MyRoleEntity;
import com.gitee.myclouds.admin.domain.myrole.MyRoleMapper;
import com.gitee.myclouds.admin.domain.myrolemodule.MyRoleModuleEntity;
import com.gitee.myclouds.admin.domain.myrolemodule.MyRoleModuleMapper;
import com.gitee.myclouds.admin.modules.cache.CacheAuthService;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.vo.MyUserVO;
import com.gitee.myclouds.common.vo.ZtreeNodeVO;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;

/**
 *  角色与授权服务
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
	@Autowired
	private CacheAuthService cacheAuthService;
	
	/**
	 * 查询
	 * 
	 * @param inDto
	 * @return
	 */
	public String list(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<MyRoleEntity> myRoleEntities = myRoleMapper.list(inDto);
		outDto.put("data", myRoleEntities);
		outDto.put("recordsTotal", myRoleEntities.size());
		outDto.put("recordsFiltered", myRoleEntities.size());
		return JSON.toJSONString(outDto);
	}
	
	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public String get(Integer id) {
		MyRoleEntity myRoleEntity = myRoleMapper.selectByKey(id);
		return JSON.toJSONString(myRoleEntity);
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
		MyRoleEntity myRoleEntity = new MyRoleEntity().copyFrom(inDto);
		myRoleMapper.updateByKey(myRoleEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "角色修改成功");
		return outDto;
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
		MyRoleEntity myRoleEntity = new MyRoleEntity().copyFrom(inDto);
		MyUserVO curUser = inDto.getCurUser();
		myRoleEntity.setCreate_by(curUser.getName());
		myRoleEntity.setCreate_by_id(curUser.getId());
		myRoleMapper.insert(myRoleEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "角色信息保存成功");
		return outDto;
	}
	
	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto delete(Dto inDto) {
		Integer roleId = inDto.getInteger("id");
		myRoleMapper.deleteByKey(roleId);
		sqlSession.delete("sql.role.deleteMyUserRole", roleId);
		sqlSession.delete("sql.role.deleteMyRoleModule", roleId);
		Dto outDto = Dtos.newDto().put2("code", "1").put2("msg", "角色删除成功");
		return outDto;
	}
	
	/**
	 * 查询授权树
	 * 
	 * @param inDto
	 * @return
	 */
	//TODO 没有支持子部门管理员的授权操作，迭代版本支持
	public String listGrantTree(Integer roleId) {
		List<ZtreeNodeVO> zTreeNodeVOs = sqlSession.selectList("sql.role.listToGrantTree");
		for (ZtreeNodeVO zTreeNodeVO : zTreeNodeVOs) {
			Dto qDto = Dtos.newDto().put2("role_id", roleId).put2("module_id", zTreeNodeVO.getId()).put2("grant_type", MyCons.GrantType.BIZ.getValue());
			MyRoleModuleEntity myRoleModuleEntity = myRoleModuleMapper.selectOne(qDto);
			if (myRoleModuleEntity != null) {
				zTreeNodeVO.setChecked(true);
			}
		}
		return JSON.toJSONString(zTreeNodeVOs);
	}
	
	/**
	 * 授权
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto grant(Dto inDto) {
		Integer roleId = inDto.getInteger("role_id");
		sqlSession.delete("sql.role.deleteMyRoleModule", roleId);
		String moduleIds = inDto.getString("moduleIds");
		if (MyUtil.isNotEmpty(moduleIds)) {
			MyUserVO curUser = inDto.getCurUser();
			String[] arrModuleIds = StringUtils.split(moduleIds, ",");
			for (String moduleId : arrModuleIds) {
				MyRoleModuleEntity myRoleModuleEntity = new MyRoleModuleEntity();
				myRoleModuleEntity.setRole_id(roleId);
				myRoleModuleEntity.setModule_id(Integer.valueOf(moduleId));
				myRoleModuleEntity.setGrant_type(MyCons.GrantType.BIZ.getValue());
				myRoleModuleEntity.setCreate_by(curUser.getId());
				myRoleModuleMapper.insert(myRoleModuleEntity);
			}
		}
		//刷缓存
		cacheAuthService.cacheOrRefreshRoleAuthToSet(roleId);
		return Dtos.newDto().put2("code", "1").put2("msg", "角色授权成功");
	}
	
}

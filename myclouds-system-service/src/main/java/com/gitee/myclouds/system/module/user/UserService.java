package com.gitee.myclouds.system.module.user;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.vo.OutVO;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.gitee.myclouds.system.domain.myorg.MyOrgEntity;
import com.gitee.myclouds.system.domain.myorg.MyOrgMapper;
import com.gitee.myclouds.system.domain.myuser.MyUserEntity;
import com.gitee.myclouds.system.domain.myuser.MyUserMapper;
import com.gitee.myclouds.system.domain.myuserrole.MyUserRoleEntity;
import com.gitee.myclouds.system.domain.myuserrole.MyUserRoleMapper;

import cn.hutool.core.util.StrUtil;

/**
 * 用户 服务
 * 
 * @author xiongchun
 *
 */
@Service
public class UserService {

	@Autowired
	private MyUserMapper myUserMapper;
	@Autowired
	private MyUserRoleMapper myUserRoleMapper;
	@Autowired
	private MyOrgMapper myOrgMapper;
	@Autowired
	private SqlSession sqlSession;

	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO list(Dto inDto) {
		OutVO outVO = new OutVO(0);
		if (StrUtil.equals(inDto.getString("org_id"), "1")) {
			inDto.put("org_id", null);
		}
		List<Dto> myUserDtos = sqlSession.selectList("sql.user.pageUser", inDto);
		Integer count = sqlSession.selectOne("sql.user.pageUserCount", inDto);
		outVO.setData(myUserDtos).setCount(count);
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
		MyUserEntity myUserEntity = myUserMapper.selectByKey(id);
		MyOrgEntity orgEntity = myOrgMapper.selectByKey(myUserEntity.getOrg_id());
		Dto dto = Dtos.newDto();
		MyUtil.copyProperties(myUserEntity, dto);
		if (MyUtil.isNotEmpty(orgEntity)) {
			dto.put("org_name", orgEntity.getName());
		}
		outVO.setData(dto);
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
		MyUserEntity myUserEntity = new MyUserEntity();
		MyUtil.copyProperties(inDto, myUserEntity);
		MyUserEntity oldUser = myUserMapper.selectByKey(myUserEntity.getId());
		if (!StringUtils.equals(oldUser.getAccount(), myUserEntity.getAccount())) {
			if (MyUtil.isNotEmpty(myUserMapper.selectByUkey1(myUserEntity.getAccount()))) {
				throw new BizException(-16, StrUtil.format("账号 {} 已经存在，请重新输入...", myUserEntity.getAccount()));
			}
		}
		myUserMapper.updateByKey(myUserEntity);
		outVO.setMsg("人员修改成功");
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
		MyUserEntity myUserEntity = new MyUserEntity();
		MyUtil.copyProperties(inDto, myUserEntity);
		MyUserEntity existUser = myUserMapper.selectByUkey1(myUserEntity.getAccount());
		if (existUser != null) {
			throw new BizException(-15, "登陆账号已被占用，请重新输入");
		}
		// TODO curUser
		myUserEntity.setCreate_by("超级用户");
		myUserEntity.setCreate_by_id(1);
		myUserEntity.setPassword(MyUtil.password(MyCons.PWD_KEY, myUserEntity.getPassword()));
		myUserMapper.insert(myUserEntity);
		outVO.setMsg("用户新增成功");
		return outVO;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public OutVO delete(Integer userId) {
		OutVO outVO = new OutVO(0);
		myUserMapper.deleteByKey(userId);
		sqlSession.delete("sql.user.deleteMyUserRole", userId);
		outVO.setMsg("用户删除成功");
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
			throw new BizException(-17, "请先选中用户后再提交");
		}
		for (String id : ids) {
			Integer userId = Integer.valueOf(id);
			myUserMapper.deleteByKey(userId);
			sqlSession.delete("sql.user.deleteMyUserRole", userId);
		}
		outVO.setMsg("用户删除成功");

		return outVO;
	}

	/**
	 * 管理员重置用户密码
	 * 
	 * @param inDto
	 * @return
	 */
	public OutVO resetPwd(Dto inDto) {
		OutVO outVO = new OutVO(0);
		if (!StrUtil.equals(inDto.getString("password"), inDto.getString("password2"))) {
			throw new BizException(-20, "新密码和确认密码不一致");
		}
		String[] idsArr = StringUtils.split(inDto.getString("ids"), ",");
		MyUserEntity myUserEntity = new MyUserEntity();
		myUserEntity.setPassword(MyUtil.password(MyCons.PWD_KEY, inDto.getString("password")));
		for (String id : idsArr) {
			myUserEntity.setId(Integer.valueOf(id));
			myUserMapper.updateByKey(myUserEntity);
		}
		outVO.setMsg("重置密码成功");
		return outVO;
	}

	/**
	 * 根据用户查询待授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	public OutVO listToGrantRoles(Integer userId) {
		OutVO outVO = new OutVO(0);
		List<Dto> toGrantList = sqlSession.selectList("sql.user.listToGrantRoles", userId);
		outVO.setData(toGrantList);
		return outVO;
	}

	/**
	 * 根据用户查询已授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	public OutVO listGrantedRoles(Integer userId) {
		OutVO outVO = new OutVO(0);
		List<Dto> toGrantList = sqlSession.selectList("sql.user.listGrantedRoles", userId);
		outVO.setData(toGrantList);
		return outVO;
	}

	/**
	 * 授权
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public OutVO grant(Dto inDto) {
		OutVO outVO = new OutVO(0);
		Integer userId = inDto.getInteger("userId");
		String roleIds = inDto.getString("roleIds");
		String[] arrRoleIds = StringUtils.split(roleIds, ",");
		if (arrRoleIds == null || arrRoleIds.length == 0) {
			throw new BizException(-20, "请先在待选角色列表选中要授予的角色");
		}
		for (String roleId : arrRoleIds) {
			MyUserRoleEntity myUserRoleEntity = new MyUserRoleEntity();
			myUserRoleEntity.setRole_id(Integer.valueOf(roleId));
			myUserRoleEntity.setUser_id(userId);
			// TODO currUser
			myUserRoleEntity.setCreate_by("超级用户");
			myUserRoleEntity.setCreate_by_id(1);
			myUserRoleMapper.insert(myUserRoleEntity);
		}
		outVO.setMsg("用户授权成功");
		return outVO;
	}
	
	/**
	 * 撤销
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	public OutVO cancel(Dto inDto) {
		OutVO outVO = new OutVO(0);
		Integer userId = inDto.getInteger("userId");
		String roleIds = inDto.getString("roleIds");
		String[] arrRoleIds = StringUtils.split(roleIds, ",");
		if (arrRoleIds == null || arrRoleIds.length == 0) {
			throw new BizException(-21, "请先在已选角色列表选中要撤销的角色");
		}
		Dto pDto = Dtos.newDto("user_id", userId);
		for (String roleId : arrRoleIds) {
			pDto.put("role_id", roleId);
			sqlSession.delete("sql.user.deleteMyUserRole", pDto);
		}
		outVO.setMsg("用户撤销授权成功");
		return outVO;
	}

}

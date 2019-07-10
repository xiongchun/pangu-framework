package com.gitee.myclouds.system.module.user;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gitee.myclouds.base.exception.BizException;
import com.gitee.myclouds.base.util.BaseCons;
import com.gitee.myclouds.base.vo.PageVO;
import com.gitee.myclouds.base.vo.UserVO;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
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
	private SqlSession sqlSession;

	/**
	 * 查询列表
	 * 
	 * @param inDto
	 * @return
	 */
	public PageVO list(Dto inDto) {
		PageVO pageVO = new PageVO();
		if (StrUtil.equals(inDto.getString("org_id"), "1")) {
			inDto.put("org_id", null);
		}
		List<Dto> myUserDtos = sqlSession.selectList("sql.user.pageUser", inDto);
		Integer count = sqlSession.selectOne("sql.user.pageUserCount", inDto);
		pageVO.setList(myUserDtos).setCount(count);
		return pageVO;
	}

	/**
	 * 根据账号查询实体
	 * 
	 * @param account
	 * @return
	 */
	public MyUserEntity getByAccount(String account) {
		MyUserEntity myUserEntity = myUserMapper.selectByUkey1(account);
		return myUserEntity;
	}

	/**
	 * 查询实体
	 * 
	 * @param id
	 * @return
	 */
	public MyUserEntity get(Integer id) {
		MyUserEntity myUserEntity = myUserMapper.selectByKey(id);
		return myUserEntity;
	}

	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	public int update(Dto inDto) {
		MyUserEntity myUserEntity = new MyUserEntity();
		MyUtil.copyProperties(inDto, myUserEntity);
		MyUserEntity oldUser = myUserMapper.selectByKey(myUserEntity.getId());
		if (!StringUtils.equals(oldUser.getAccount(), myUserEntity.getAccount())) {
			if (MyUtil.isNotEmpty(myUserMapper.selectByUkey1(myUserEntity.getAccount()))) {
				throw new BizException(-16, StrUtil.format("账号 {} 已经存在，请重新输入...", myUserEntity.getAccount()));
			}
		}
		int rows = myUserMapper.updateByKey(myUserEntity);
		return rows;
	}

	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	public void add(Dto inDto, UserVO userVO) {
		MyUserEntity myUserEntity = new MyUserEntity();
		MyUtil.copyProperties(inDto, myUserEntity);
		MyUserEntity existUser = myUserMapper.selectByUkey1(myUserEntity.getAccount());
		if (existUser != null) {
			throw new BizException(-15, "登陆账号已被占用，请重新输入");
		}
		myUserEntity.setCreate_by(userVO.getName());
		myUserEntity.setCreate_by_id(userVO.getId());
		myUserEntity.setPassword(MyUtil.password(BaseCons.PWD_KEY, myUserEntity.getPassword()));
		myUserMapper.insert(myUserEntity);
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = "myhome:init", allEntries = true, beforeInvocation = true)
	public int delete(Integer userId) {
		int rows = myUserMapper.deleteByKey(userId);
		sqlSession.delete("sql.user.deleteMyUserRole", userId);
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
			throw new BizException(-17, "请先选中用户后再提交");
		}
		for (String id : ids) {
			Integer userId = Integer.valueOf(id);
			myUserMapper.deleteByKey(userId);
			sqlSession.delete("sql.user.deleteMyUserRole", userId);
		}
		return ids.length;
	}

	/**
	 * 管理员重置用户密码
	 * 
	 * @param inDto
	 * @return
	 */
	public int resetPwd(Dto inDto) {
		if (!StrUtil.equals(inDto.getString("password"), inDto.getString("password2"))) {
			throw new BizException(-20, "新密码和确认密码不一致");
		}
		String[] idsArr = StringUtils.split(inDto.getString("ids"), ",");
		MyUserEntity myUserEntity = new MyUserEntity();
		myUserEntity.setPassword(MyUtil.password(BaseCons.PWD_KEY, inDto.getString("password")));
		for (String id : idsArr) {
			myUserEntity.setId(Integer.valueOf(id));
			myUserMapper.updateByKey(myUserEntity);
		}
		return idsArr.length;
	}

	/**
	 * 根据用户查询待授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	public List<Dto> listToGrantRoles(Integer userId) {
		List<Dto> toGrantList = sqlSession.selectList("sql.user.listToGrantRoles", userId);
		return toGrantList;
	}

	/**
	 * 根据用户查询已授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	public List<Dto> listGrantedRoles(Integer userId) {
		List<Dto> grantedList = sqlSession.selectList("sql.user.listGrantedRoles", userId);
		return grantedList;
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
			myUserRoleEntity.setCreate_by(userVO.getName());
			myUserRoleEntity.setCreate_by_id(userVO.getId());
			myUserRoleMapper.insert(myUserRoleEntity);
		}
	}

	/**
	 * 撤销 
	 * 
	 * @param inDto
	 * @return
	 */
	@Transactional
	@CacheEvict(value = "myhome:init", allEntries = true, beforeInvocation = true)
	public void cancel(Dto inDto) {
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
	}

}

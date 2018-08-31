package com.gitee.myclouds.admin.modules.user;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.admin.domain.myuser.MyUserEntity;
import com.gitee.myclouds.admin.domain.myuser.MyUserMapper;
import com.gitee.myclouds.admin.domain.myuserrole.MyUserRoleEntity;
import com.gitee.myclouds.admin.domain.myuserrole.MyUserRoleMapper;
import com.gitee.myclouds.common.util.MyCons;
import com.gitee.myclouds.common.util.MyUtil;
import com.gitee.myclouds.common.vo.MyUserVO;
import com.gitee.myclouds.common.wrapper.Dto;
import com.gitee.myclouds.common.wrapper.Dtos;
import com.google.common.collect.Lists;

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
	public String list(Dto inDto) {
		Dto outDto = Dtos.newDto();
		List<MyUserEntity> myUserEntities = sqlSession.selectList("sql.user.pageUser", inDto);
		Integer total = sqlSession.selectOne("sql.user.pageUserCount", inDto);
		outDto.put("data", myUserEntities);
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
		MyUserEntity myUserEntity = myUserMapper.selectByKey(id);
		return JSON.toJSONString(myUserEntity);
	}
	
	/**
	 * 修改
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto update(Dto inDto) {
		Dto outDto = null;
		MyUserEntity myUserEntity = new MyUserEntity().copyFrom(inDto);
		MyUserEntity oldUser = myUserMapper.selectByKey(myUserEntity.getId());
		if (!StringUtils.equals(oldUser.getAccount(), myUserEntity.getAccount()) ) {
			if (MyUtil.isNotEmpty(myUserMapper.selectByUkey1(myUserEntity.getAccount()))) {
				outDto = Dtos.newDto().put2("code", "-1").put2("msg", "此账号已经存在，请重新输入...");
				return outDto;
			}
		}
		myUserMapper.updateByKey(myUserEntity);
		outDto = Dtos.newDto().put2("code", "1").put2("msg", "人员修改成功");
		return outDto;
	}

	/**
	 * 新增
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto save(Dto inDto) {
		Dto outDto = Dtos.newDto();
		MyUserEntity myUserEntity = new MyUserEntity().copyFrom(inDto);
		MyUserEntity existUser = myUserMapper.selectByUkey1(myUserEntity.getAccount());
		if (existUser == null) {
			MyUserVO curUser = inDto.getCurUser();
			myUserEntity.setCreate_by(curUser.getName());
			myUserEntity.setCreate_by_id(curUser.getId());
			myUserEntity.setPassword(MyUtil.password(MyCons.PWD_KEY, myUserEntity.getPassword()));
			myUserMapper.insert(myUserEntity);
			outDto = Dtos.newDto().put2("code", "1").put2("msg", "用户信息新增成功");
		}else {
			outDto = Dtos.newDto().put2("code", "-1").put2("msg", "账号已被占用，请重新输入");
		}
		return outDto;
	}

	/**
	 * 删除
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto delete(Dto inDto) {
		Integer userId = inDto.getInteger("id");
		myUserMapper.deleteByKey(userId);
		sqlSession.delete("sql.user.deleteMyUserRole", userId);
		Dto outDto = Dtos.newDto().put2("code", "1").put2("msg", "用户删除成功");
		return outDto;
	}
	
	/**
	 * 根据用户查询待授权角色列表和已授权角色列表
	 * 
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> listRoleGrantInfo(Integer userId) {
		List<Map<String, Object>> outList = Lists.newArrayList();
		List<Map<String, Object>> grantedList = sqlSession.selectList("sql.user.listGrantedRoles", userId);
		if (grantedList != null) {
			outList.addAll(grantedList);
		}
		List<Map<String, Object>> toGrantList = sqlSession.selectList("sql.user.listToGrantRoles", userId);
		if (toGrantList != null) {
			outList.addAll(toGrantList);
		}
		return outList;
	}
	
	/**
	 * 授权
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto grant(Dto inDto) {
		Integer userId = inDto.getInteger("user_id");
		sqlSession.delete("sql.user.deleteMyUserRole", userId);
		String roleIds = inDto.getString("roleIds");
		if (MyUtil.isNotEmpty(roleIds)) {
			MyUserVO curUser = inDto.getCurUser();
			String[] arrRoleIds = StringUtils.split(roleIds, ",");
			for (String roleId : arrRoleIds) {
				MyUserRoleEntity myUserRoleEntity = new MyUserRoleEntity();
				myUserRoleEntity.setRole_id(Integer.valueOf(roleId));
				myUserRoleEntity.setUser_id(userId);
				myUserRoleEntity.setCreate_by(curUser.getName());
				myUserRoleEntity.setCreate_by_id(curUser.getId());
				myUserRoleMapper.insert(myUserRoleEntity);
			}
		}
		return Dtos.newDto().put2("code", "1").put2("msg", "用户授权成功");
	}
	
	/**
	 * 修改当前登录用户密码
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto updatePwd(Dto inDto) {
		Dto outDto = Dtos.newDto();
		String newPassword = inDto.getString("new_password");
		if (!StringUtils.equals(newPassword, inDto.getString("confirm_password"))) {
			outDto.put2("code", "-1").put2("msg", "新密码和确认密码不一致，请确认");
		}else {
			Integer userId = inDto.getInteger("id");
			String password = MyUtil.password(MyCons.PWD_KEY, inDto.getString("password"));
			MyUserEntity myUserEntity = myUserMapper.selectByKey(userId);
			if (!StringUtils.equals(password, myUserEntity.getPassword())) {
				outDto.put2("code", "-2").put2("msg", "原密码输入错误，请确认");
			}else {
				MyUserEntity updateMyUserEntity = new MyUserEntity();
				updateMyUserEntity.setId(userId);
				updateMyUserEntity.setPassword(MyUtil.password(MyCons.PWD_KEY, newPassword));
				myUserMapper.updateByKey(updateMyUserEntity);
				outDto.put2("code", "1").put2("msg", "密码修改成功");
			}
		}
		return outDto;
	}
	
	/**
	 * 管理员重置用户密码
	 * 
	 * @param inDto
	 * @return
	 */
	public Dto resetPwd(Dto inDto) {
		Dto outDto = Dtos.newDto();
		String[] idsArr = StringUtils.split(inDto.getString("ids"), ",");
		MyUserEntity myUserEntity = new MyUserEntity();
		myUserEntity.setPassword(MyUtil.password(MyCons.PWD_KEY, inDto.getString("password")));
		for (String id : idsArr) {
			myUserEntity.setId(Integer.valueOf(id));
			myUserMapper.updateByKey(myUserEntity);
		}
		outDto.put2("code", "1").put2("msg", "重置密码成功");
		return outDto;
	}

}

/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gitee.pulanos.pangu.framework.sdk.dto.page.PageResult;
import com.gitee.pulanos.pangu.framework.sdk.dto.page.PagingUtil;
import com.gitee.pulanos.pangu.framework.sdk.exception.BizException;
import com.pulanit.pangu.admin.common.domain.UserInfo;
import com.pulanit.pangu.admin.system.api.SystemConstants;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.entity.UserRoleEntity;
import com.pulanit.pangu.admin.system.api.param.LoginIn;
import com.pulanit.pangu.admin.system.api.param.LoginOut;
import com.pulanit.pangu.admin.system.api.param.UserOut;
import com.pulanit.pangu.admin.system.api.param.UserPageIn;
import com.pulanit.pangu.admin.system.api.service.UserService;
import com.pulanit.pangu.admin.system.dao.mapper.RoleMapper;
import com.pulanit.pangu.admin.system.dao.mapper.UserMapper;
import com.pulanit.pangu.admin.system.dao.mapper.UserRoleMapper;
import com.pulanit.pangu.admin.system.dao.mapper2.CommonMapper;
import com.pulanit.pangu.admin.system.manager.DeptManager;
import com.pulanit.pangu.admin.system.manager.UserManager;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import static com.pulanit.pangu.admin.system.api.SystemConstants.DEFAULT_DASHBOARD;

@Slf4j
@DubboService(version = "1.0.0", group = "pangu-admin-system")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserManager userManager;
    @Autowired
    private DeptManager deptManager;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public LoginOut login(LoginIn loginIn) {
        UserEntity userEntity = userManager.findUserByAccountKey(loginIn.getUserName());
        if (userEntity == null) {
            throw new BizException("用户名错误，请重新输入");
        }
        if (!StrUtil.equals(userManager.encodeUserPwd(loginIn.getPassword()), userEntity.getPassword())) {
            throw new BizException("密码错误，请重新输入");
        }
        UserInfo userInfo = new UserInfo();
        BeanUtil.copyProperties(userEntity, userInfo);
        userInfo.setDashboard(DEFAULT_DASHBOARD);
        List<RoleEntity> roleEntities = userManager.listRolesByUserId(userEntity.getId());
        List<String> roleKeys = roleEntities.stream().map(RoleEntity::getRoleKey).collect(Collectors.toList());
        userInfo.setRole(roleKeys);
        LoginOut loginOut = new LoginOut().setUserInfo(userInfo);
        return loginOut;
    }

    @Override
    public PageResult<UserOut> list(UserPageIn pageIn) {
        Page<UserEntity> page = PagingUtil.createPage(pageIn);
        LambdaQueryWrapper<UserEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.select(UserEntity.class, info -> !info.getColumn().equals("password"));
        lambdaQueryWrapper.eq(ObjectUtil.isNotEmpty(pageIn.getDeptId()), UserEntity::getDeptId, pageIn.getDeptId());
        String keyword = pageIn.getName();
        if (ObjectUtil.isNotEmpty(keyword)) {
            lambdaQueryWrapper.and(w -> w.like(UserEntity::getName, keyword).or().like(UserEntity::getUserName, keyword));
        }
        lambdaQueryWrapper.orderByDesc(UserEntity::getId);
        userMapper.selectPage(page, lambdaQueryWrapper);
        List<UserEntity> userEntities = page.getRecords();
        List<UserOut> userOuts = userManager.transformEntity(userEntities);
        return PagingUtil.transformPageResult(page, userOuts);
    }

    @Override
    public PageResult<UserOut> listUnGrantedUsersByRoleId(UserPageIn pageIn) {
        Page<UserEntity> page = PagingUtil.createPage(pageIn);
        List<UserEntity> userEntities = commonMapper.listUnGrantedUsersByRoleId(page, pageIn);
        List<UserOut> userOuts = userManager.transformEntity(userEntities);
        return PagingUtil.transformPageResult(page, userOuts);
    }

    @Override
    public List<UserOut> listGrantedUsersByRoleId(Long roleId) {
        List<UserEntity> userEntities = userManager.listUsersByRoleId(roleId);
        List<UserOut> userOuts = userManager.transformEntity(userEntities);
        return userOuts;
    }

    @Override
    @Transactional
    public void add(UserEntity userEntity) {
        if (StrUtil.isEmpty(userEntity.getSex())) {
            userEntity.setSex(SystemConstants.Sex.UNKNOWN);
        }
        userEntity.setAvatar(this.randomAvatar());
        userEntity.setGmtCreated(DateUtil.date());
        userEntity.setPassword(userManager.encodeUserPwd(userEntity.getPassword()));
        userMapper.insert(userEntity);
    }

    @Override
    public void update(UserEntity userEntity) {
        userEntity.setGmtModified(DateUtil.date());
        userMapper.updateById(userEntity);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        userMapper.deleteById(id);
        userManager.deleteUserRoleByUserId(id);
    }

    @Override
    @Transactional
    public void batchDelete(List<Long> ids) {
        if (CollUtil.isNotEmpty(ids)) {
            userMapper.deleteBatchIds(ids);
            userManager.deleteUserRoleByBatchUserIds(ids);
        }
    }

    @Override
    public long validateUserName(String userName, Long id) {
        long result = userMapper.selectCount(Wrappers.lambdaQuery(UserEntity.class).eq(UserEntity::getUserName, userName));
        if (ObjectUtil.isNotNull(id)) {
            UserEntity userEntity = userMapper.selectById(id);
            if (StrUtil.equalsIgnoreCase(userName, userEntity.getUserName())) {
                return 0;
            }
        }
        return result;
    }

    @Override
    public List<RoleEntity> queryRolesByUserId(Long userId) {
        List<RoleEntity> roleEntities = Collections.emptyList();;
        List<Long> roleIds = userManager.queryRoleIdsByUserId(userId);
        if (CollUtil.isNotEmpty(roleIds)) {
            roleEntities = roleMapper.selectBatchIds(roleIds);
        }
        return roleEntities;
    }

    @Override
    public List<RoleEntity> queryGrantRolesByUserId(Long userId) {
        Assert.notNull(userId, "用户编号不能为空");
        List<RoleEntity> roleEntities = Collections.emptyList();;
        List<RoleEntity> allRoles = roleMapper.selectList(Wrappers.emptyWrapper());
        List<RoleEntity> grantedRoles = this.queryRolesByUserId(userId);
        return CollUtil.subtractToList(allRoles, grantedRoles);
    }

    @Override
    public UserOut queryUserDetailInfoById(Long userId) {
        UserOut userOut = new UserOut();
        UserEntity userEntity = userMapper.selectById(userId);
        BeanUtil.copyProperties(userEntity, userOut);
        userOut.setDeptName(deptManager.queryCascadeDeptName(userEntity.getDeptId()));
        List<RoleEntity> roleEntities = userManager.listRolesByUserId(userId);
        List<String> roleNames = roleEntities.stream().map(RoleEntity::getName).collect(Collectors.toList());
        userOut.setRoleNames(roleNames);
        //字典转换待优化
        if (SystemConstants.Sex.MALE.equals(userOut.getSex())) {
            userOut.setSexDesc("男");
        } else if (SystemConstants.Sex.MALE.equals(userOut.getSex())) {
            userOut.setSexDesc("女");
        } else {
            userOut.setSexDesc("保密");
        }
        if (SystemConstants.UserStatus.ENABLED.equals(userOut.getStatus())) {
            userOut.setStatusDesc("启用");
        } else if (SystemConstants.UserStatus.DISABLED.equals(userOut.getStatus())) {
            userOut.setStatusDesc("停用");
        }
        if (SystemConstants.UserType.DEFAULT.equals(userOut.getType())) {
            userOut.setTypeDesc("缺省");
        }
        return userOut;
    }

    @Override
    public void resetPassword(List<Long> userIds, String password) {
        if (CollUtil.isNotEmpty(userIds)) {
            LambdaUpdateWrapper<UserEntity> updateWrapper = Wrappers.lambdaUpdate();
            updateWrapper.set(UserEntity::getPassword, userManager.encodeUserPwd(password));
            updateWrapper.set(UserEntity::getGmtModified, DateUtil.date());
            updateWrapper.in(UserEntity::getId, userIds);
            userMapper.update(null, updateWrapper);
        }
    }

    @Override
    public void updatePassword(Long userId, String password, String newPassword) {
        UserEntity userEntity = userMapper.selectById(userId);
        if (userEntity == null) {
            throw new BizException("没有查询到当前用户信息，请重试");
        }
        if (!StrUtil.equals(userManager.encodeUserPwd(password), userEntity.getPassword())) {
            throw new BizException("当前密码错误，请重试");
        }
        LambdaUpdateWrapper<UserEntity> updateWrapper = Wrappers.lambdaUpdate();
        updateWrapper.set(UserEntity::getPassword, userManager.encodeUserPwd(newPassword));
        updateWrapper.set(UserEntity::getGmtModified, DateUtil.date());
        updateWrapper.eq(UserEntity::getId, userId);
        userMapper.update(null, updateWrapper);
    }

    @Override
    public void grantSelectRole(Long userId, List<Long> roleIds) {
        Assert.notNull(userId, "人员 ID 不能为空");
        Assert.notEmpty(roleIds, "角色 ID 不能为空");
        for (Long roleId : roleIds) {
            UserRoleEntity userRoleEntity = new UserRoleEntity();
            userRoleEntity.setUserId(userId);
            userRoleEntity.setRoleId(roleId);
            userRoleEntity.setGmtCreated(DateUtil.date());
            userRoleMapper.insert(userRoleEntity);
        }
    }

    @Override
    public void cancelRole(Long userId, List<Long> roleIds) {
        Assert.notNull(userId, "人员 ID 不能为空");
        Assert.notEmpty(roleIds, "角色 ID 不能为空");
        for (Long roleId : roleIds){
            userManager.deleteUserRole(userId, roleId);
        }
    }

    private String randomAvatar() {
        String avatar = "avatar/avatar";
        int index = RandomUtil.randomInt(1, 9);
        avatar = avatar + index;
        return index == 1 ? avatar + ".gif" : avatar + ".jpg";
    }
}

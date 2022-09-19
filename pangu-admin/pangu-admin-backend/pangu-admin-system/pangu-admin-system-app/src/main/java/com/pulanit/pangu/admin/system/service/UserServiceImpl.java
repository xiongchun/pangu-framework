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
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.lang.func.Func;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.gitee.pulanos.pangu.framework.common.utils.PagingUtil;
import com.google.common.collect.Lists;
import com.pulanit.pangu.admin.system.api.Constants;
import com.pulanit.pangu.admin.system.api.dto.UserDto;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.entity.UserRoleEntity;
import com.pulanit.pangu.admin.system.api.param.*;
import com.pulanit.pangu.admin.system.api.service.UserService;
import com.pulanit.pangu.admin.system.dao.mapper.DeptMapper;
import com.pulanit.pangu.admin.system.dao.mapper.UserMapper;
import com.pulanit.pangu.admin.system.dao.mapper.UserRoleMapper;
import com.pulanit.pangu.admin.system.manager.UserManager;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Slf4j
@Service(version = "1.0.0", group = "pangu-admin-system-app")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private DeptMapper deptMapper;
    @Autowired
    private UserManager userManager;

    @Override
    public LoginOut login(LoginIn inDto) {
        LoginOut loginOut = new LoginOut();
        loginOut.setToken(UUID.fastUUID().toString());
        UserDto userDto = new UserDto();
        userDto.setName("熊春");
        userDto.setDashboard("1");
        loginOut.setUserInfo(userDto);
        return loginOut;
    }

    @Override
    public PageResult<UserOut> list(UserPageIn userPageIn) {
        Page<UserEntity> page = PagingUtil.createPage(userPageIn);
        LambdaQueryWrapper<UserEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.eq(ObjectUtil.isNotEmpty(userPageIn.getDeptId()), UserEntity::getDeptId, userPageIn.getDeptId());
        lambdaQueryWrapper.like(ObjectUtil.isNotEmpty(userPageIn.getName()), UserEntity::getName, userPageIn.getName());
        lambdaQueryWrapper.orderByDesc(UserEntity::getId);
        userMapper.selectPage(page, lambdaQueryWrapper);
        List<UserEntity> userEntities = page.getRecords();
        List<UserOut> userOuts = Lists.newArrayList();
        List<Long> deptIds = userEntities.stream().map(UserEntity::getDeptId).collect(Collectors.toList());
        List<DeptEntity> deptEntities = deptMapper.selectBatchIds(deptIds);
        Map<Long, DeptEntity> deptEntityMap = deptEntities.stream().collect(Collectors.toMap(DeptEntity::getId, Function.identity()));
        userEntities.forEach(e -> {
            UserOut userOut = new UserOut();
            BeanUtil.copyProperties(e, userOut);
            DeptEntity deptEntity = deptEntityMap.get(e.getDeptId());
            if (deptEntity != null){
                userOut.setDeptName(deptEntity.getName());
            }
            userOuts.add(userOut);
        });
        return PagingUtil.transformPageResult(page, userOuts);
    }

    private void test1(){

    }

    @Override
    @Transactional
    public void add(UserIn userIn) {
        if (StrUtil.isEmpty(userIn.getSex())){
            userIn.setSex(Constants.Sex.UNKNOWN);
        }
        userIn.setAvatar(this.randomAvatar());
        userIn.setGmtCreated(DateUtil.date());
        userMapper.insert(userIn);
        userManager.creatUserRole(userIn.getId(), userIn.getRoleIds());
    }

    @Override
    @Transactional
    public void update(UserIn userIn) {
        userIn.setGmtModified(DateUtil.date());
        userMapper.updateById(userIn);
        userManager.deleteUserRoleByUserId(userIn.getId());
        userManager.creatUserRole(userIn.getId(), userIn.getRoleIds());
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
        userMapper.deleteBatchIds(ids);
        userManager.deleteUserRoleByBatchUserIds(ids);
    }

    @Override
    public long validateUserName(String userName, Long id) {
        long result = userMapper.selectCount(Wrappers.lambdaQuery(UserEntity.class).eq(UserEntity::getUserName, userName));
        if (ObjectUtil.isNotNull(id)){
            UserEntity userEntity = userMapper.selectById(id);
            if (StrUtil.equalsIgnoreCase(userName, userEntity.getUserName())){
                return 0;
            }
        }
        return result;
    }

    @Override
    public UserOut queryUserInfoById(Long userId) {
        UserOut userOut = new UserOut();
        UserEntity userEntity = userMapper.selectById(userId);
        BeanUtil.copyProperties(userEntity, userOut);
        List<Long> userIds = userManager.queryRolesByUserId(userId);
        userOut.setRoleIds(userIds);
        return userOut;
    }

    private String randomAvatar(){
        String avatar = "avatar/avatar";
        int index = RandomUtil.randomInt(1,9);
        avatar = avatar + index;
        return index == 1 ? avatar + ".gif" : avatar + ".jpg";
    }
}

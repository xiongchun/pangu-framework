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
import cn.hutool.core.util.*;
import com.alibaba.spring.util.BeanUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gitee.pulanos.pangu.framework.common.model.PageResult;
import com.gitee.pulanos.pangu.framework.common.utils.PagingUtil;
import com.google.common.base.Strings;
import com.pulanit.pangu.admin.system.api.Constants;
import com.pulanit.pangu.admin.system.api.dto.UserDto;
import com.pulanit.pangu.admin.system.api.entity.UserEntity;
import com.pulanit.pangu.admin.system.api.param.LoginIn;
import com.pulanit.pangu.admin.system.api.param.LoginOut;
import com.pulanit.pangu.admin.system.api.param.UserAddIn;
import com.pulanit.pangu.admin.system.api.param.UserIn;
import com.pulanit.pangu.admin.system.api.service.UserService;
import com.pulanit.pangu.admin.system.dao.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Objects;

@Slf4j
@Service(version = "1.0.0", group = "pangu-admin-system-app")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

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
    public PageResult<UserEntity> list(UserIn userIn) {
        Page<UserEntity> page = PagingUtil.createPage(userIn);
        LambdaQueryWrapper<UserEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.eq(ObjectUtil.isNotEmpty(userIn.getDeptId()), UserEntity::getDeptId, userIn.getDeptId());
        lambdaQueryWrapper.like(ObjectUtil.isNotEmpty(userIn.getName()), UserEntity::getName, userIn.getName());
        lambdaQueryWrapper.orderByDesc(UserEntity::getId);
        userMapper.selectPage(page, lambdaQueryWrapper);
        return PagingUtil.getPageResult(page);
    }

    @Override
    public void add(UserAddIn userAddIn) {
        UserEntity userEntity = new UserEntity();
        BeanUtil.copyProperties(userAddIn, userEntity);
        if (StrUtil.isEmpty(userEntity.getSex())){
            userEntity.setSex(Constants.Sex.UNKNOWN);
        }
        userEntity.setAvatar(this.randomAvatar());
        userEntity.setGmtCreated(DateUtil.date());
        userMapper.insert(userEntity);
    }

    @Override
    public void update(UserEntity userEntity) {
        userEntity.setGmtModified(DateUtil.date());
        userMapper.updateById(userEntity);
    }

    @Override
    public void delete(Long id) {
        userMapper.deleteById(id);
    }

    @Override
    public void batchDelete(List<Long> ids) {
        userMapper.deleteBatchIds(ids);
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

    private String randomAvatar(){
        String avatar = "avatar/avatar";
        int index = RandomUtil.randomInt(1,9);
        avatar = avatar + index;
        return index == 1 ? avatar + ".gif" : avatar + ".jpg";
    }
}

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

package com.gitee.pulanos.pangu.showcases.webapi.local.service;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.gitee.pulanos.pangu.showcases.webapi.local.dao.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.webapi.local.dao.mapper.UserMapper;
import com.gitee.pulanos.pangu.showcases.webapi.local.param.CaseIn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * DemoService
 *
 * @author xiongchun
 */
@Service
public class DemoService {

    @Autowired
    private UserMapper userMapper;

    public List<UserEntity> listUsers() {
        LambdaQueryWrapper<UserEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.orderByDesc(UserEntity::getId);
        List<UserEntity> userEntities = userMapper.selectList(lambdaQueryWrapper);
        return userEntities;
    }

}
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

package com.gitee.pulanos.pangu.showcases.dubbo.gateway.provider.service;

import com.gitee.pulanos.pangu.framework.common.utils.BeanValidator;
import com.gitee.pulanos.pangu.showcases.dubbo.api.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.dubbo.api.in.UserIn;
import com.gitee.pulanos.pangu.showcases.dubbo.api.out.UserOut;
import com.gitee.pulanos.pangu.showcases.dubbo.api.service.UserService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.apache.shenyu.client.dubbo.common.annotation.ShenyuDubboClient;

import java.util.List;

/**
 * 用户相关服务
 * @author xiongchun
 */
@Slf4j
@Service(version = "1.0.0", group = "pangu-examples-dubbo-gateway-service")
public class UserServiceImpl implements UserService {

    @Override
    @ShenyuDubboClient(path = "/findUserEntity", desc = "查询用户信息")
    public UserEntity findUserEntity(Long id) {
        log.info("参数ID：{}", id);
        UserEntity userEntity = new UserEntity();
        userEntity.setId(id);
        userEntity.setName("云南码农大熊");
        return userEntity;
    }

    @Override
    @ShenyuDubboClient(path = "/listUserOuts", desc = "查询用户信息列表")
    public List<UserOut> listUserOuts(UserIn userIn) {
        log.info("参数userIn：{}", userIn);
        BeanValidator.validate(userIn);
        List<UserOut> userOuts = Lists.newArrayList();
        UserOut userOut = new UserOut().setName("云南码农大熊").setUserType("1").setAge(18).setOrgId(1L);
        userOuts.add(userOut);
        return userOuts;
    }
}

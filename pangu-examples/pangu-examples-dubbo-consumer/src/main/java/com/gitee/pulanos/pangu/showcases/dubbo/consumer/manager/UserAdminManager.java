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

package com.gitee.pulanos.pangu.showcases.dubbo.consumer.manager;

import com.gitee.pulanos.pangu.showcases.dubbo.api.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.dubbo.api.in.UserIn;
import com.gitee.pulanos.pangu.showcases.dubbo.api.out.UserOut;
import com.gitee.pulanos.pangu.showcases.dubbo.api.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @author xiongchun
 */
@Slf4j
@Component
public class UserAdminManager {

    @Reference(version = "1.0.0", group = "pangu-examples-dubbo-service")
    private UserService userService;

    public void findUserEntityById(Long id){
        log.info("开始Dubbo远程调用...");
        UserEntity userEntity = userService.findUserEntity(id);
        log.info("[OK] 调用成功 {}", userEntity);
    }

    public void listUserOuts(UserIn userIn){
        log.info("开始Dubbo远程调用...");
        List<UserOut> userOuts = userService.listUserOuts(userIn);
        log.info("[OK] 调用成功 {}", userOuts);

    }

    @PostConstruct
    public void doTest(){
        findUserEntityById(1L);
        UserIn userIn = new UserIn();
        userIn.setUserType("1");
        listUserOuts(userIn);
    }

}

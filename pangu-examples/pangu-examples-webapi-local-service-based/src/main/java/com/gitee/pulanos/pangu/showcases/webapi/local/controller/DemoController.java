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

package com.gitee.pulanos.pangu.showcases.webapi.local.controller;

import com.gitee.pulanos.pangu.framework.common.entity.Result;
import com.gitee.pulanos.pangu.showcases.webapi.local.dao.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.webapi.local.service.DemoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 演示WebAPI Controller
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("pangu/webapi")
public class DemoController {

    @Autowired
    private DemoService demoService;

    /**
     * case1
     *
     * @return
     */
    @RequestMapping("/case1")
    public Result<List<UserEntity>> case1() {
        log.info("call case1...");
        List<UserEntity> userEntities = demoService.listUsers();
        return Result.success(userEntities);
    }

}

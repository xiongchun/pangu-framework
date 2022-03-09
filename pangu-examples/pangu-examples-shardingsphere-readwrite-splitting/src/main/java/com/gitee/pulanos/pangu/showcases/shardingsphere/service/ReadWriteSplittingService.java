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

package com.gitee.pulanos.pangu.showcases.shardingsphere.service;

import com.gitee.pulanos.pangu.showcases.shardingsphere.dao.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.shardingsphere.dao.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.shardingsphere.infra.hint.HintManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/***
 *
 * @author xiongchun
 */
@Slf4j
@Component
public class ReadWriteSplittingService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 读请求理由到从库（多从库则根据算法负载均衡）
     */
    public void readRoute() {
        log.info("查询数据...");
        UserEntity userEntity = userMapper.selectById(1L);
        log.info("查询结果 {}", userEntity);
    }

    /**
     * 演示手动强制走主库查询
     */
    public void readByWriteRoute() {
        HintManager hintManager = HintManager.getInstance();
        hintManager.setWriteRouteOnly();
        try {
            log.info("查询数据（强制走主库）...");
            UserEntity userEntity = userMapper.selectById(1L);
            log.info("查询结果 {}", userEntity);
        } finally {
            hintManager.close();
        }
    }


    /**
     * 写请求路由到主库
     *
     * @return
     */
    public int writeRoute() {
        log.info("插入数据...");
        UserEntity userEntity = new UserEntity();
        userEntity.setName("XC").setAge(18).setUserType("1");
        int row = userMapper.insert(userEntity);
        log.info("成功插入{}条数据。{}", row, userEntity);
        return row;
    }

    /**
     * 事务内的读写请求都自动路由到主库
     *
     * @return
     */
    @Transactional(rollbackFor = RuntimeException.class)
    public void doWithTransaction() {
        log.info("插入数据...");
        UserEntity userEntity = new UserEntity();
        userEntity.setName("XC").setAge(18).setUserType("1");
        int row = userMapper.insert(userEntity);
        log.info("成功插入{}条数据。{}", row, userEntity);
        log.info("查询数据（强制走主库）...");
        UserEntity userEntityRead = userMapper.selectById(1L);
        log.info("查询结果 {}", userEntityRead);
    }


}

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

package com.gitee.pulanos.pangu.showcases.shardingsphere;

import com.gitee.pulanos.pangu.showcases.shardingsphere.dao.entity.TOrderEntity;
import com.gitee.pulanos.pangu.showcases.shardingsphere.dao.mapper.TOrderMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.shardingsphere.infra.hint.HintManager;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class ReadWriteSplittingTest {

    @Autowired
    private TOrderMapper tOrderMapper;

    /**
     * 测试写操作自动走主库
     */
    @Test
    public void writeRoute() {
        TOrderEntity entity = new TOrderEntity().setUserId(1).setStatus("测试");
        tOrderMapper.insert(entity);
    }

    /**
     * 测试读操作自动走从库负载均衡
     */
    @Test
    public void readRoute() {
        tOrderMapper.selectById(1508317805991194627L);
        tOrderMapper.selectById(1508317805991194628L);
    }

    /**
     * 测试读操作强制走主库
     */
    @Test
    public void readByWriteRoute() {
        HintManager hintManager = HintManager.getInstance();
        hintManager.setWriteRouteOnly();
        try {
            log.info("查询数据（强制走主库）...");
            TOrderEntity entity = tOrderMapper.selectById(2L);
            log.info("查询结果 {}", entity);
        } finally {
            hintManager.close();
        }
    }

    /**
     * 测试事务方法里的所有读写操作都自动走主库
     */
    @Test
    @Transactional(rollbackFor = RuntimeException.class)
    public void doWithTransaction() {
        log.info("插入数据...");
        TOrderEntity entity = new TOrderEntity().setUserId(1).setStatus("测试");
        tOrderMapper.insert(entity);
        log.info("查询数据（事务方法内所有请求自动走主库）...");
        tOrderMapper.selectById(1L);
    }

}

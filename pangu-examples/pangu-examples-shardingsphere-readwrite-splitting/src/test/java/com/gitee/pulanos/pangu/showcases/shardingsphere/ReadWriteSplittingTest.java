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

import com.gitee.pulanos.pangu.showcases.shardingsphere.service.ReadWriteSplittingService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ReadWriteSplittingTest {

    @Autowired
    private ReadWriteSplittingService readWriteSplittingService;

    /**
     * 测试读操作自动走从库负载均衡
     */
    @Test
    public void readRoute() {
        readWriteSplittingService.readRoute();
        readWriteSplittingService.readRoute();
    }

    /**
     * 测试读操作强制走主库
     */
    @Test
    public void readByWriteRoute() {
        readWriteSplittingService.readByWriteRoute();
    }

    /**
     * 测试写操作自动走主库
     */
    @Test
    public void writeRoute() {
        readWriteSplittingService.writeRoute();
    }

    /**
     * 测试事务方法里的所有读写操作都自动走主库
     */
    @Test
    public void doWithTransaction() {
        readWriteSplittingService.doWithTransaction();
    }

}

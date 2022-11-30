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

package com.gitee.pulanos.pangu.showcases.seata.at.service;

import com.gitee.pulanos.pangu.showcases.seata.api.dto.BuyDto;
import com.gitee.pulanos.pangu.showcases.seata.api.service.AccountService;
import com.gitee.pulanos.pangu.showcases.seata.api.service.OrderService;
import com.gitee.pulanos.pangu.showcases.seata.api.service.StockService;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;

/**
 * 电商下单业务服务
 * <p>演示基于Seata框架AT模式下的分布式事务</p>
 * @author xiongchun
 */
@Slf4j
@Component
public class MainBizService {

    @Reference(version = "1.0.0", group = "pangu-examples-seata-at-account")
    private AccountService accountService;
    @Reference(version = "1.0.0", group = "pangu-examples-seata-at-order")
    private OrderService orderService;
    @Reference(version = "1.0.0", group = "pangu-examples-seata-at-stock")
    private StockService stockService;

    @GlobalTransactional
    public void buyItems(BuyDto buyDto){
        orderService.createOrder(buyDto);
        accountService.decreaseAccount(buyDto);
        stockService.decreaseStock(buyDto);
    }

}

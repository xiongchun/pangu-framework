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
import com.gitee.pulanos.pangu.showcases.seata.api.service.OrderService;
import com.gitee.pulanos.pangu.showcases.seata.at.dao.entity.OrderEntity;
import com.gitee.pulanos.pangu.showcases.seata.at.dao.mapper.OrderMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * 订单服务
 *
 * @author xiongchun
 */
@Slf4j
@Service(version = "1.0.0", group = "pangu-examples-seata-at-order")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void createOrder(BuyDto buyDto) {
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setUserId(buyDto.getUserId());
        orderEntity.setCommodityCode(buyDto.getCommodityCode());
        orderEntity.setCount(buyDto.getCount());
        orderEntity.setMoney(buyDto.getMoney());
        orderMapper.insert(orderEntity);
    }

}

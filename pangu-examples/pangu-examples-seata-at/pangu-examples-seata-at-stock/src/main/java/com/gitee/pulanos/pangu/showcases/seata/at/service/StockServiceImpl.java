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

import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.gitee.pulanos.pangu.showcases.seata.api.dto.BuyDto;
import com.gitee.pulanos.pangu.showcases.seata.api.service.StockService;
import com.gitee.pulanos.pangu.showcases.seata.at.dao.entity.StockEntity;
import com.gitee.pulanos.pangu.showcases.seata.at.dao.mapper.StockMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * 库存服务
 *
 * @author xiongchun
 */
@Slf4j
@Service(version = "1.0.0", group = "pangu-examples-seata-at-stock")
public class StockServiceImpl implements StockService {

    @Autowired
    private StockMapper stockMapper;

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void decreaseStock(BuyDto buyDto) {
        StockEntity stockEntity = stockMapper.selectOne(Wrappers.<StockEntity>lambdaQuery().eq(StockEntity::getCommodityCode, buyDto.getCommodityCode()));
        Assert.notNull(stockEntity, "没有查询到商品{}的库存信息。", buyDto.getCommodityCode());
        LambdaUpdateWrapper<StockEntity> updateWrapper = Wrappers.lambdaUpdate();
        Assert.isTrue(stockEntity.getCount() >= buyDto.getCount(), "库存不够，下单失败");
        updateWrapper.set(StockEntity::getCount, stockEntity.getCount() - buyDto.getCount());
        updateWrapper.eq(StockEntity::getCommodityCode, buyDto.getCommodityCode());
        stockMapper.update(null, updateWrapper);
    }
}

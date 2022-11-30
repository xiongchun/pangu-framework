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

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.gitee.pulanos.pangu.showcases.seata.api.dto.BuyDto;
import com.gitee.pulanos.pangu.showcases.seata.api.service.AccountService;
import com.gitee.pulanos.pangu.showcases.seata.at.dao.entity.AccountEntity;
import com.gitee.pulanos.pangu.showcases.seata.at.dao.mapper.AccountMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * 账户服务
 *
 * @author xiongchun
 */
@Slf4j
@Service(version = "1.0.0", group = "pangu-examples-seata-at-account")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    /**
     * 扣减账户余额
     *
     * @param buyDto
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void decreaseAccount(BuyDto buyDto) {
        AccountEntity accountEntity = accountMapper.selectOne(Wrappers.<AccountEntity>lambdaQuery().eq(AccountEntity::getUserId, buyDto.getUserId()));
        LambdaUpdateWrapper<AccountEntity> updateWrapper = Wrappers.lambdaUpdate();
        updateWrapper.set(AccountEntity::getMoney, accountEntity.getMoney() - buyDto.getCount() * buyDto.getMoney());
        updateWrapper.eq(AccountEntity::getUserId, buyDto.getUserId());
        accountMapper.update(null, updateWrapper);
    }

}

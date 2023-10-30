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

package com.gitee.pulanos.pangu.framework.starter.base;

import cn.hutool.core.util.StrUtil;
import com.alibaba.nacos.api.config.ConfigService;
import com.gitee.pulanos.pangu.framework.sdk.Constants;
import com.gitee.pulanos.pangu.framework.starter.base.handler.AvailabilityChangeEventListener;
import com.gitee.pulanos.pangu.framework.starter.base.handler.LogLevelChangeEventListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.availability.AvailabilityChangeEvent;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

/**
 * PanguBaseAutoConfiguration
 *
 * @author xiongchun
 */
@Slf4j
@AutoConfiguration
@EnableConfigurationProperties(BaseProperties.class)
public class BaseAutoConfiguration {

    @Autowired
    private BaseProperties panguAppProperties;

    @Bean
    @ConditionalOnMissingBean(AvailabilityChangeEventListener.class)
    // SpringBoot 2.7+
    @ConditionalOnClass(AvailabilityChangeEvent.class)
    public AvailabilityChangeEventListener newAvailabilityChangeEventListener(){
        AvailabilityChangeEventListener listener = new AvailabilityChangeEventListener();
        log.info("{}{}{}", Constants.Msg.OK, "@AutoConfiguration bean: ", StrUtil.lowerFirst(AvailabilityChangeEventListener.class.getSimpleName()));
        return listener;
    }

    @Bean
    @ConditionalOnMissingBean(LogLevelChangeEventListener.class)
    @ConditionalOnProperty(prefix = "pangu", name = "log-reload", havingValue = "true", matchIfMissing = true)
    @ConditionalOnClass(ConfigService.class)
    public LogLevelChangeEventListener newLogLevelChangeEventListener() {
        LogLevelChangeEventListener listener = new LogLevelChangeEventListener();
        log.info("{}{}{}", Constants.Msg.OK, "@AutoConfiguration bean: ", StrUtil.lowerFirst(LogLevelChangeEventListener.class.getSimpleName()));
        return listener;
    }

}

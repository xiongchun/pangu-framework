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

package com.gitee.pulanos.pangu.framework.starter.autoconfigure;

import cn.hutool.core.util.StrUtil;
import com.alibaba.nacos.api.config.ConfigService;
import com.gitee.pulanos.pangu.framework.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * PanguBaseAutoConfiguration
 *
 * @author xiongchun
 */
@Slf4j
@Configuration
@EnableConfigurationProperties(PanguAppProperties.class)
public class PanguBaseAutoConfiguration {

    @Autowired
    private PanguAppProperties panguAppProperties;

    @Bean
    @ConditionalOnMissingBean(ApplicationExitHook.class)
    public ApplicationExitHook createApplicationExitHook(){
        ApplicationExitHook applicationExitHook = new ApplicationExitHook();
        log.info("{}{}{}", Constants.Msg.OK, "实例化并自动装配了Bean组件：", StrUtil.lowerFirst(ApplicationExitHook.class.getSimpleName()));
        return applicationExitHook;
    }

    @Bean
    @ConditionalOnProperty(prefix = "nacos", name = "config.data-id")
    @ConditionalOnClass(ConfigService.class)
    public DynamicLogSwitcher createDynamicLogSwitcher() {
        DynamicLogSwitcher dynamicLogSwitcher = new DynamicLogSwitcher();
        log.info("{}{}{}", Constants.Msg.OK, "实例化并自动装配了Bean组件：", StrUtil.lowerFirst(DynamicLogSwitcher.class.getSimpleName()));
        return dynamicLogSwitcher;
    }

}

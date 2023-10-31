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

package com.gitee.pulanos.pangu.framework.starter.web;

import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.sdk.Constants;
import com.gitee.pulanos.pangu.framework.starter.base.handler.AvailabilityChangeEventListener;
import com.gitee.pulanos.pangu.framework.starter.web.handler.CrossOriginInterceptor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * WebAutoConfiguration
 *
 * @author xiongchun
 */
@Slf4j
@AutoConfiguration
@EnableConfigurationProperties(WebProperties.class)
@ConditionalOnWebApplication
public class WebAutoConfiguration implements WebMvcConfigurer {

    @Autowired
    private WebProperties webProperties;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        if (webProperties.getCrossOrigin()){
            registry.addInterceptor(new CrossOriginInterceptor());
            log.info("{}{}{}", Constants.Msg.OK, "@AutoConfiguration bean: ", StrUtil.lowerFirst(CrossOriginInterceptor.class.getSimpleName()));
        }
    }


}

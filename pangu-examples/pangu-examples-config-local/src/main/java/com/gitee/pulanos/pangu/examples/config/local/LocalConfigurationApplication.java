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

package com.gitee.pulanos.pangu.examples.config.local;

import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.gitee.pulanos.pangu.framework.PanGuApplicationBuilder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @author xiongchun
 */
@Slf4j
@SpringBootApplication
public class LocalConfigurationApplication {

    public static void main(String[] args) {
        PanGuApplicationBuilder.init(LocalConfigurationApplication.class).run(args);
    }

    @Component
    public class LocalConfiguration {

        @NacosValue("${demo.app.id}")
        private String appId;
        @NacosValue("${spring.application.name}")
        private String appName;

        @PostConstruct
        @Scheduled
        public void execute() {
            log.info("演示获取本地配置数据");
            log.info("参数appId：{}", appId);
            log.info("参数appName：{}", appName);
        }
    }

}



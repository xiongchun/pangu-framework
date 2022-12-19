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

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.nacos.api.config.annotation.NacosConfigListener;
import com.alibaba.nacos.spring.util.ConfigParseUtils;
import com.gitee.pulanos.pangu.framework.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.logging.LogLevel;
import org.springframework.boot.logging.LoggingSystem;

import javax.annotation.Resource;
import java.util.Map;
import java.util.Properties;

/**
 * DynamicLogSwitcher
 *
 * @author xiongchun
 * @date 2021-02-10
 */
@Slf4j
public class DynamicLogSwitcher {

    @Resource
    private LoggingSystem loggingSystem;

    @Value("${nacos.config.type}")
    private String configType;

    private static final String LOGGER_PREFIX = "logging.level.";

    @NacosConfigListener(dataId = "${nacos.config.data-id}", timeout = 5000)
    public void onChange(String newCfgText) {
        Map<String, Object> properties = ConfigParseUtils.toProperties(newCfgText, configType);
        for (Object key : properties.keySet()) {
            String logKey = String.valueOf(key);
            if (logKey.startsWith(LOGGER_PREFIX)) {
                String logValue = MapUtil.getStr(properties, logKey, LogLevel.INFO.toString());
                refreshLogLevelByKey(logKey, logValue);
            }
        }
    }

    public void refreshLogLevelByKey(String logKey, String logValue) {
        if (StrUtil.isNotEmpty(logKey) && StrUtil.isNotEmpty(logValue)) {
            logValue = logValue.toUpperCase();
            LogLevel logLevel = LogLevel.valueOf(logValue);
            loggingSystem.setLogLevel(StrUtil.subAfter(logKey, LOGGER_PREFIX, true), logLevel);
            log.info(StrUtil.format("{}成功热刷新了日志级别 >> {}:{}", Constants.Msg.OK, logKey, logValue));
        }
    }

}

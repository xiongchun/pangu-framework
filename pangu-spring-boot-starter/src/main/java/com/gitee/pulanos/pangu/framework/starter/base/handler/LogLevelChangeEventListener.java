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

package com.gitee.pulanos.pangu.framework.starter.base.handler;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.nacos.api.config.annotation.NacosConfigListener;
import com.alibaba.nacos.spring.util.ConfigParseUtils;
import com.gitee.pulanos.pangu.framework.sdk.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.logging.LogLevel;
import org.springframework.boot.logging.LoggerConfiguration;
import org.springframework.boot.logging.LoggingSystem;

import javax.annotation.Resource;
import java.util.Map;

/**
 * DynamicLogSwitcher
 *
 * @author xiongchun
 */
@Slf4j
public class LogLevelChangeEventListener {

    @Resource
    private LoggingSystem loggingSystem;

    @Value("${nacos.config.type:}")
    private String configType;

    private static final String LOGGER_PREFIX = "logging.level.";

    public static final String ROOT_LOGGER_NAME = "ROOT";

    //TODO bugfix SpringBoot 3.X上面监听不到配置变更信息
    //当前Nacos API 还不支持SpringBoot 3.X
    @NacosConfigListener(dataId = "${nacos.config.data-id}", timeout = 5000)
    public void onChange(String newCfgText) {
        Map<String, Object> properties = ConfigParseUtils.toProperties(newCfgText, configType);
        for (Object key : properties.keySet()) {
            String logKey = String.valueOf(key);
            if (logKey.startsWith(LOGGER_PREFIX)) {
                String logValue = MapUtil.getStr(properties, logKey, LogLevel.INFO.toString());
                LogLevel logLevel = LogLevel.valueOf(logValue.toUpperCase());
                String loggerName = StrUtil.subAfter(logKey, LOGGER_PREFIX, true);
                if (StrUtil.equalsIgnoreCase("root", loggerName)){
                    loggerName = ROOT_LOGGER_NAME;
                }
                LoggerConfiguration loggerConfiguration = loggingSystem.getLoggerConfiguration(loggerName);
                if (loggerConfiguration != null){
                    if (loggerConfiguration.getConfiguredLevel() != logLevel){
                        setLogLevel(loggerName, logLevel);
                    }
                }
            }
        }
    }

    private void setLogLevel(String loggerName, LogLevel logLevel){
        if (loggerName != null && logLevel != null){
            loggingSystem.setLogLevel(loggerName, logLevel);
            String msg = StrUtil.format("{}Reloaded the Loglevel >> {}:{}", Constants.Msg.OK, loggerName, logLevel);
            if (log.isInfoEnabled()){
                log.info(msg);
            }else {
                System.out.println(msg);
            }
        }
    }

}

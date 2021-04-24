package com.gitee.pulanit.pangu.log;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.logging.LogLevel;
import org.springframework.boot.logging.LoggingSystem;
import org.springframework.stereotype.Component;

import com.alibaba.nacos.api.annotation.NacosInjected;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.api.exception.NacosException;
import com.alibaba.nacos.spring.util.ConfigParseUtils;

import cn.hutool.core.util.StrUtil;

/**
 * DynamicLogLevelHandler
 * 
 * @author xiongchun
 * @since 4.0.0
 */
@Component
public class DynamicLogLevelHandler {

    @Autowired
    private LoggingSystem loggingSystem;
    @NacosInjected
    private ConfigService configService;
    @Value("${nacos.config.type}")
    private String configType;
    @Value("${nacos.config.data-id}")
    private String dataId;

    private static final String LOGGER_TAG = "logging.level.";

    public void refreshLogLevel(String newCfgText) {
        Properties properties = ConfigParseUtils.toProperties(newCfgText, configType);
        for (Object obj : properties.keySet()) {
            String key = String.valueOf(obj);
            if (key.startsWith(LOGGER_TAG)) {
                String strLevel = properties.getProperty(key, "info");
                LogLevel level = LogLevel.valueOf(strLevel.toUpperCase());
                loggingSystem.setLogLevel(key.replace(LOGGER_TAG, ""), level);
                // log.info("reset log level --> {}:{}", key, strLevel);
                System.out.println(StrUtil.format(":: refresh log level >> {}:{}", key, strLevel));
            }
        }
    }

    public void initLogLevelWhenSartup() {
        String newCfgText = null;
        try {
            newCfgText = configService.getConfig(dataId, "DEFAULT_GROUP", 5000);
        } catch (NacosException e) {
            e.printStackTrace();
        }
        if (StrUtil.isNotEmpty(newCfgText)) {
            refreshLogLevel(newCfgText);
        }
    }
}

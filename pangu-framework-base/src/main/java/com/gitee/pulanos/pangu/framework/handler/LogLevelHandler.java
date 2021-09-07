package com.gitee.pulanos.pangu.framework.handler;

import cn.hutool.core.util.StrUtil;
import com.alibaba.nacos.api.annotation.NacosInjected;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.api.exception.NacosException;
import com.alibaba.nacos.spring.util.ConfigParseUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.logging.LogLevel;
import org.springframework.boot.logging.LoggingSystem;
import org.springframework.stereotype.Component;

import java.util.Properties;

/**
 * 日志级别动态刷新
 * 
 * @author xiongchun
 * @since 4.0.0
 */
@Slf4j
@Component
public class LogLevelHandler {

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
                String info = StrUtil.format(":: refresh log level >> {}:{}", key, strLevel);
                if (log.isInfoEnabled()){
                    log.info(info);
                }else {
                    System.out.println(info);
                }
            }
        }
    }

    /**
     * 启动时候不刷新一下，配置在nacos中的日志级别不生效
     */
    public void initLogLevelWhenSartup() {
        String newCfgText = null;
        try {
            newCfgText = configService.getConfig(dataId, "DEFAULT_GROUP", 5000);
            if (StrUtil.isNotEmpty(newCfgText)){
                refreshLogLevel(newCfgText);
            }else {
                log.warn("尝试设置日志级别时没有获取到配置信息");
            }
        } catch (NacosException e) {
            e.printStackTrace();
        }
    }
}

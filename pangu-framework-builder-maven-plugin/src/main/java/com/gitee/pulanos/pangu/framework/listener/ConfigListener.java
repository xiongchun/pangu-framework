package com.gitee.pulanos.pangu.framework.listener;

import com.alibaba.nacos.api.config.annotation.NacosConfigListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.gitee.pulanos.pangu.framework.handler.LogLevelHandler;

/**
 * NacosConfigListener Nacos配置中心监听器
 * 
 * @author xiongchun
 * @since 4.0.0
 */
@Component
public class ConfigListener {

    @Autowired
    private LogLevelHandler logLevelHandler;

    @NacosConfigListener(dataId = "${nacos.config.data-id}", timeout = 5000)
    public void onChange(String newCfgText) throws Exception {
        logLevelHandler.refreshLogLevel(newCfgText);
    }
    
}

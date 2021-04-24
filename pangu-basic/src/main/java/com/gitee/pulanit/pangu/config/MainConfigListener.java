package com.gitee.pulanit.pangu.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.alibaba.nacos.api.config.annotation.NacosConfigListener;
import com.gitee.pulanit.pangu.log.DynamicLogLevelHandler;

/**
 * nacos main configuration listener
 * 
 * @author xiongchun
 * @since 4.0.0
 */
@Component
public class MainConfigListener {

    @Autowired
    private DynamicLogLevelHandler dynamicLogLevelHandler;

    @NacosConfigListener(dataId = "${nacos.config.data-id}", timeout = 5000)
    public void onChange(String newCfgText) throws Exception {
    	dynamicLogLevelHandler.refreshLogLevel(newCfgText);
    }
    
}

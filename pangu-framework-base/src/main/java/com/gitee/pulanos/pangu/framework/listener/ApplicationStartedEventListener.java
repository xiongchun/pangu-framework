package com.gitee.pulanos.pangu.framework.listener;

import com.alibaba.nacos.api.exception.NacosException;
import com.gitee.pulanos.pangu.framework.Constants;
import com.gitee.pulanos.pangu.framework.handler.EnvironmentHandler;
import com.gitee.pulanos.pangu.framework.handler.LogLevelHandler;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.boot.context.event.ApplicationStartingEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

/**
 * 应用启动成功监听器
 * 
 * @author xiongchun
 * @since 4.0.0
 */
@Slf4j
@Component
public class ApplicationStartedEventListener implements ApplicationListener<ApplicationStartedEvent>{
    
    @Autowired
    private LogLevelHandler logLevelHandler;
    @Autowired
    private EnvironmentHandler environmentHandler;

    /**
     * Handle an application event.
     *
     * @param event the event to respond to
     */
    @SneakyThrows
    @Override
    public void onApplicationEvent(ApplicationStartedEvent event){
        environmentHandler.confirmChecks();
        environmentHandler.setDefaultConfigurations();
        logLevelHandler.initLogLevelWhenSartup();
    }
}

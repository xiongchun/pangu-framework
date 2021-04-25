package com.gitee.pulanos.pangu.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.gitee.pulanos.pangu.config.EnvironmentHandler;
import com.gitee.pulanos.pangu.log.DynamicLogLevelHandler;

import lombok.extern.slf4j.Slf4j;

/**
 * Default PanguApp StartedEventListener
 * 
 * @author xiongchun
 * @since 4.0.0
 */
@Slf4j
@Component
public class DefaultAppStartedEventListener implements ApplicationListener<ApplicationStartedEvent>{
    
    @Autowired
    private DynamicLogLevelHandler dynamicLogLevelHandler;
    @Autowired
    private EnvironmentHandler environmentHandler;
    
    @Override
    public void onApplicationEvent(ApplicationStartedEvent event) {
    	dynamicLogLevelHandler.initLogLevelWhenSartup();
        environmentHandler.setDefaultConfigurations();
        log.info(":: AOSuite PanGu Development Framework Started");
    }

}

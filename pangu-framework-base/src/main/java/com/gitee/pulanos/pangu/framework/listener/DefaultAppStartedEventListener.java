package com.gitee.pulanos.pangu.framework.listener;

import com.gitee.pulanos.pangu.framework.config.EnvironmentHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.gitee.pulanos.pangu.framework.log.DynamicLogLevelHandler;

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
        String info = "(ô‿ô) PanGu Dev Framework Started ㊥ 盘古开发框架启动成功";
        if (log.isInfoEnabled()){
            log.info(info);
        }else {
            System.out.println(info);
        }

    }

}
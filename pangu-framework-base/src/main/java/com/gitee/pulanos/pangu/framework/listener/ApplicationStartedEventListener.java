package com.gitee.pulanos.pangu.framework.listener;

import com.gitee.pulanos.pangu.framework.handler.EnvironmentHandler;
import com.gitee.pulanos.pangu.framework.handler.LogLevelHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
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
    @Override
    public void onApplicationEvent(ApplicationStartedEvent event) {
        logLevelHandler.initLogLevelWhenSartup();
        environmentHandler.setDefaultConfigurations();
        String info = "(ô‿ô) PanGu Dev Framework Started successfully ㊥ 盘古开发框架启动成功";
        if (log.isInfoEnabled()){
            log.info(info);
        }else {
            System.out.println(info);
        }
    }
}

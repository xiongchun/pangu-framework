package com.gitee.pulanos.pangu.framework.listener;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationFailedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

/**
 * 应用启动失败监听器
 * <p>部分出错场景无法触发此监听</p>
 * @author xiongchun
 * @since 4.0.0
 */
@Slf4j
@Component
public class ApplicationFailedEventListener implements ApplicationListener<ApplicationFailedEvent>{

    /**
     * Handle an application event.
     *
     * @param event the event to respond to
     */
    @Override
    public void onApplicationEvent(ApplicationFailedEvent event) {
        log.error("(ô‿ô) PanGu Dev Framework Failed to Start ㊥ 盘古开发框架启动失败");
    }
}

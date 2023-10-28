package com.gitee.pulanos.pangu.framework.starter.base.handler;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.sdk.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.boot.context.event.ApplicationStartingEvent;
import org.springframework.context.ApplicationListener;

@Slf4j
public class ApplicationStartingEventListener implements ApplicationListener<ApplicationStartingEvent> {

    // 这个监听比较特殊，需要在 spring.factories 中配置。这个事件发生时，Spring容器还没初始化，不能被托管。
    @Override
    public void onApplicationEvent(ApplicationStartingEvent event) {
        println(StrUtil.format("{} {}", DateUtil.now(), Constants.Msg.APP_START));
    }

    private void println(String info){
        if (log.isInfoEnabled()){
            log.info(info);
        }else {
            System.out.println(info);
        }
    }
}

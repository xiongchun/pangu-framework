package com.gitee.pulanos.pangu.framework.starter.base.handler;

import com.gitee.pulanos.pangu.framework.sdk.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;

@Slf4j
public class ApplicationReadyEventListener implements ApplicationListener<ApplicationReadyEvent> {

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        println(Constants.Msg.APP_START_SUCCESS);
    }

    private void println(String info){
        if (log.isInfoEnabled()){
            log.info(info);
        }else {
            System.out.println(info);
        }
    }
}

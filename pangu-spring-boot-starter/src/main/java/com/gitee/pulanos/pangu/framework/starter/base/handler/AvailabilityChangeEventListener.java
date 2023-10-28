package com.gitee.pulanos.pangu.framework.starter.base.handler;

import com.gitee.pulanos.pangu.framework.sdk.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.availability.AvailabilityChangeEvent;
import org.springframework.boot.availability.ReadinessState;
import org.springframework.context.ApplicationListener;

@Slf4j
public class AvailabilityChangeEventListener implements ApplicationListener<AvailabilityChangeEvent> {

    @Override
    public void onApplicationEvent(AvailabilityChangeEvent event) {
        if (ReadinessState.ACCEPTING_TRAFFIC == event.getState()){
            println(Constants.Msg.APP_START_SUCCESS);
        } else if (ReadinessState.REFUSING_TRAFFIC == event.getState()) {
            println(Constants.Msg.APP_EXIT);
        }
    }

    private void println(String info){
        if (log.isInfoEnabled()){
            log.info(info);
        }else {
            System.out.println(info);
        }
    }
}

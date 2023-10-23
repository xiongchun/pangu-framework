package com.gitee.pulanos.pangu.showcases.dubbo.triple.provider.service;

import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.common.stream.StreamObserver;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Map;

@Slf4j
@Component
public class JobManager {

    @Scheduled(fixedDelay = 5*1000)
    public void job1(){
        System.out.println("作业执行测试...client-1");
        Map<String, StreamObserver<String>> observerMap = GreetServiceImpl.observerMap;
        StreamObserver<String> streamObserver = observerMap.get("client-1");
        if (streamObserver != null){
            System.out.println(streamObserver);
            System.out.println(streamObserver.hashCode());
            streamObserver.onNext("啦啦啦，我是卖报的小行家... client-1#" + streamObserver.hashCode());
        }
    }

    @Scheduled(fixedDelay = 5*1000)
    public void job2(){
        System.out.println("作业执行测试...client-2");
        Map<String, StreamObserver<String>> observerMap = GreetServiceImpl.observerMap;
        StreamObserver<String> streamObserver = observerMap.get("client-2");
        if (streamObserver != null){
            System.out.println(streamObserver);
            System.out.println(streamObserver.hashCode());
            streamObserver.onNext("啦啦啦，我是卖报的小行家... client-2#" + streamObserver.hashCode());
        }
    }

}

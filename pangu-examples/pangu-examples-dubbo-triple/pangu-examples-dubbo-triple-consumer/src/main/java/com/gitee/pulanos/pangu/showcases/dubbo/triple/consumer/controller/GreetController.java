package com.gitee.pulanos.pangu.showcases.dubbo.triple.consumer.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.common.stream.StreamObserver;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.gitee.pulanos.pangu.showcases.dubbo.triple.api.GreetService;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@RestController
public class GreetController {

    @DubboReference(version = "1.0", group = "els-exporter2")
    private GreetService greetService;

    @RequestMapping ("/greet")
    public void greet(HttpServletRequest request) {
        String response = greetService.greet("HY");
        log.info(response);
    }

    @PostMapping("/greetServerStream")
    public void greetServerStream(HttpServletRequest request) {
        String clientId = System.getProperty("clientId", "N/A");
        greetService.greetServerStream(clientId, new StdoutStreamObserver<>("greetServerStream"));

    }

    @PostMapping("/greetStream")
    public void greetStream() {
        final StreamObserver<String> request = greetService.greetStream(new StdoutStreamObserver<>("greetStream"));
        for (int i = 0; i < 10; i++) {
            request.onNext("请求流消息：" +  "Data From Client");
        }
        request.onCompleted();
    }

    @Slf4j
    static class StdoutStreamObserver<T> implements StreamObserver<T>{

        private final String name;

        public StdoutStreamObserver(String name){
            this.name = name;
        }

        @Override
        public void onNext(T data) {
            log.info("客户端收到来自服务端的推送信息:{}", data);
        }

        @Override
        public void onError(Throwable throwable) {
            log.error(throwable.getMessage(), throwable);
        }

        @Override
        public void onCompleted() {
            log.info("{} stream completed", name);
        }
    }

}

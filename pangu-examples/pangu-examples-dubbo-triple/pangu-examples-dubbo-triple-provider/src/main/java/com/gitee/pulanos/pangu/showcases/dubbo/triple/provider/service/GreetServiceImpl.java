package com.gitee.pulanos.pangu.showcases.dubbo.triple.provider.service;

import com.alibaba.nacos.shaded.com.google.common.collect.Maps;
import com.gitee.pulanos.pangu.showcases.dubbo.triple.api.GreetService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.common.stream.StreamObserver;
import org.apache.dubbo.config.annotation.DubboService;

import java.util.Map;

@Slf4j
@DubboService(version = "1.0", group = "pangu-examples-dubbo-triple-provider")
public class GreetServiceImpl implements GreetService {
    public static Map<String, StreamObserver<String>> observerMap = Maps.newHashMap();

    // UNARY调用 REQUEST/RESPONSE
    @Override
    public String greet(String request) {
        return "Hi, " + request;
    }

    // 服务器端响应流推送
    @Override
    public void greetServerStream(String request, StreamObserver<String> response) {
        for (int i = 0; i < 10; i++) {
            response.onNext("响应流：hello, " + request);
        }
        // 如果想持续的对客户端推送，则别关闭这个 response 流，把 response 保存下来，在需要推送数据的时候触发 response.onNext(）方法即可。
        response.onCompleted();
    }

    // 请求流或双向流推送
    @Override
    public StreamObserver<String> greetStream(StreamObserver<String> response) {
        // 这里 new 的这个是请求流
        return new StreamObserver<String>() {
            @Override
            public void onNext(String data) {
                // data 为请求流推送过来的数据
                response.onNext("hello," + data);
            }
            @Override
            public void onError(Throwable throwable) {
                //noinspection CallToPrintStackTrace
                throwable.printStackTrace();
            }
            @Override
            public void onCompleted() {
                // 检测到 Request 关闭则把 Response 也关闭，BI 双向流结束。
                response.onCompleted();
            }
        };
    }
}

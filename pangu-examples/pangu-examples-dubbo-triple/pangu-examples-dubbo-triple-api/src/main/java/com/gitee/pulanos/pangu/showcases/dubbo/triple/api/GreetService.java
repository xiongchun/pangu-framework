package com.gitee.pulanos.pangu.showcases.dubbo.triple.api;

import org.apache.dubbo.common.stream.StreamObserver;

public interface GreetService {

    // UNARY 传统一元调用（request / response）
    String greet(String request);

    //SERVER_STREAM 服务端推送
    void greetServerStream(String request, StreamObserver<String> response);

    // BIDIRECTIONAL_STREAM / CLIENT_STREAM 客户端流推送和双向流推送
    // !注意 入参为响应流 response；出参为请求流 request
    StreamObserver<String> greetStream(StreamObserver<String> response);

}

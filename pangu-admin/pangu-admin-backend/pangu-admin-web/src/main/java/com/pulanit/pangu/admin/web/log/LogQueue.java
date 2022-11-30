package com.pulanit.pangu.admin.web.log;

import com.pulanit.pangu.admin.system.api.param.LogIn;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class LogQueue {

    static final int QUEUE_MAX_SIZE   = 10000;

    static BlockingQueue<LogIn> blockingQueue = new LinkedBlockingQueue<LogIn>(QUEUE_MAX_SIZE);

    private LogQueue() {

    }

    private static class SingletonHolder{
        private  static LogQueue queue = new LogQueue();
    }

    public static LogQueue getLogQueue(){
        return SingletonHolder.queue;
    }

    public  boolean produce(LogIn logIn) {
        return blockingQueue.offer(logIn);
    }

    public  LogIn consume() throws InterruptedException {
        return blockingQueue.take();
    }

    public int size() {
        return blockingQueue.size();
    }

}

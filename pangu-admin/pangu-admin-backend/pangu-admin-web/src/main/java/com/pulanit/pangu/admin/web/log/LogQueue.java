package com.pulanit.pangu.admin.web.log;

import com.pulanit.pangu.admin.system.api.entity.LogExcEntity;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class LogQueue {

    static final int QUEUE_MAX_SIZE   = 1000;

    static BlockingQueue<LogExcEntity> blockingQueue = new LinkedBlockingQueue<LogExcEntity>(QUEUE_MAX_SIZE);

    private LogQueue() {

    }

    private static class SingletonHolder{
        private  static LogQueue queue = new LogQueue();
    }

    public static LogQueue getLogQueue(){
        return SingletonHolder.queue;
    }

    public  void  produce(LogExcEntity entity) throws InterruptedException {
        blockingQueue.put(entity);
    }

    public  LogExcEntity consume() throws InterruptedException {
        return blockingQueue.take();
    }

    public int size() {
        return blockingQueue.size();
    }

}

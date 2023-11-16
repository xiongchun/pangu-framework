package com.pulanit.pangu.admin.web.log;

import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.gitee.pulanos.pangu.framework.sdk.Constants;
import com.pulanit.pangu.admin.system.api.param.LogIn;
import com.pulanit.pangu.admin.system.api.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Slf4j
@Component
public class LogQueueConsumer {

    @NacosValue(value = "${app.log.queue.consumer.pool.threads}")
    private int threads;

    @Reference(version = "1.0.0", group = "pangu-admin-system-app")
    private LogService logService;

    @PostConstruct
    public void startThread() {
        // 两个大小的固定线程池
        ExecutorService pool = Executors.newFixedThreadPool(threads);
        for (int i = 0; i < threads; i++) {
            pool.submit(new Task(logService));
        }
        log.info("{}FixedThreadPool#LogQueueConsumer 线程池创建成功。容量：{}", Constants.Msg.OK, threads);
    }

    class Task implements Runnable {
        LogService logService;

        public Task(LogService logService) {
            this.logService = logService;
        }

        @Override
        public void run() {
            while (true) {
                try {
                    LogIn logIn = LogQueue.getLogQueue().consume();
                    if (logIn != null) {
                        logService.saveLog(logIn);
                    }
                } catch (Exception e) {
                    log.error("消费日志出错", e);
                }
            }
        }
    }
}

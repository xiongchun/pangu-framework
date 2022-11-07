package com.pulanit.pangu.admin.web.log;

import com.gitee.pulanos.pangu.framework.common.Constants;
import com.pulanit.pangu.admin.system.api.entity.LogExcEntity;
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

    @Reference(version = "1.0.0", group = "pangu-admin-system-app")
    private LogService logService;

    @PostConstruct
    public void startThread() {
        // 两个大小的固定线程池
        ExecutorService pool = Executors.newFixedThreadPool(2);
        pool.submit(new Task(logService));
        pool.submit(new Task(logService));
        log.info("{}LogQueueConsumer 线程池创建成功", Constants.Msg.OK);
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
                    LogExcEntity entity = LogQueue.getLogQueue().consume();
                    if (entity != null) {
                        log.info("异常队列当前大小:{}", LogQueue.getLogQueue().size());
                        logService.saveLogExc(entity);
                    }
                } catch (Exception e) {
                    log.error("消费日志出错", e);
                }
            }
        }
    }
}

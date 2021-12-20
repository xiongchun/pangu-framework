package com.gitee.pulanos.pangu.showcases.lock.redis.service;

import cn.hutool.core.thread.ThreadUtil;
import com.baomidou.lock.annotation.Lock4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * 基于注解方式的分布式锁
 *
 * @author xiongchun
 */
@Slf4j
@Component
public class AnnotationLockService {

    /**
     * 默认获取锁超时3秒，30秒锁过期
     */
    @Lock4j
    public void doBiz() {
        log.info("执行doBiz...");
        ThreadUtil.sleep(25*1000);
    }

    /**
     * 配置获取锁超时时间和锁过期时间 支持SPEL
     * @param accountId
     */
    @Lock4j(keys = {"#accountId"}, expire = 20000, acquireTimeout = 10000)
    public void doBiz2(Long accountId) {
        log.info("执行doBiz2...");
        ThreadUtil.sleep(20*1000);
    }



}

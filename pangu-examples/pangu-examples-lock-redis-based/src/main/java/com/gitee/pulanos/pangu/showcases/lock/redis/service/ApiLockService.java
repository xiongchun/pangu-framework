package com.gitee.pulanos.pangu.showcases.lock.redis.service;

import cn.hutool.core.thread.ThreadUtil;
import com.baomidou.lock.LockInfo;
import com.baomidou.lock.LockTemplate;
import com.baomidou.lock.exception.LockException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 基于API方式的分布式锁
 *
 * @author xiongchun
 */
@Slf4j
@Component
public class ApiLockService {

    @Autowired
    private LockTemplate lockTemplate;

    public void apiLock(String userId) {
        //... 各种不需要上锁的操作
        String lockKey = "lock4j:ApiLockService:apiLock:" + userId;
        final LockInfo lockInfo = lockTemplate.lock(lockKey);
        //申请锁失败
        if (null == lockInfo) {
            throw new LockException("业务处理中，请稍后再试...");
        }
        //申请锁成功
        try {
            ThreadUtil.sleep(10000L);
            log.info("执行apiLock, 当前线程{}", Thread.currentThread().getName());
        } finally {
            lockTemplate.releaseLock(lockInfo);
        }
    }

}

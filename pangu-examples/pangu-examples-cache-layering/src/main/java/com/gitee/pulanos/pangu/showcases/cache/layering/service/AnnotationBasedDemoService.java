package com.gitee.pulanos.pangu.showcases.cache.layering.service;

import com.gitee.pulanos.pangu.showcases.cache.layering.pojo.UserVO;
import com.github.xiaolyuh.annotation.*;
import com.github.xiaolyuh.support.ExpireMode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * 基于注解的两级缓存演示
 *
 * @author xiongchun
 */
@Slf4j
@Component
public class AnnotationBasedDemoService {

    @Cacheable(cacheNames = "user", key = "#userId",
            firstCache = @FirstCache(expireTime = 5, timeUnit = TimeUnit.SECONDS, expireMode = ExpireMode.WRITE),
            secondaryCache = @SecondaryCache(expireTime = 30, timeUnit = TimeUnit.SECONDS))
    public UserVO getUser(Long userId) {
        log.info("执行AnnotationBasedDemoService.getUser()");
        // 从DB或其它资源渠道获取数据
        UserVO userVO = new UserVO();
        userVO.setId(userId);
        userVO.setName("钱学森");
        return userVO;
    }

    @CachePut(cacheNames = "user", key = "#userVO.id",
            firstCache = @FirstCache(expireTime = 10, timeUnit = TimeUnit.SECONDS),
            secondaryCache = @SecondaryCache(expireTime = 30, timeUnit = TimeUnit.SECONDS))
    public UserVO saveUser(UserVO userVO) {
        log.info("执行AnnotationBasedDemoService.saveUser()");
        return userVO;
    }

    @CacheEvict(cacheNames = "user", key = "#userId")
    public void delUser(Long userId) {
        log.info("执行AnnotationBasedDemoService.delUser()");
    }

    @CacheEvict(cacheNames = "user", allEntries = true)
    public void delAllUsers() {
        log.info("执行AnnotationBasedDemoService.delAllUsers()");
    }

    @Cacheable(cacheNames = "user2", key = "#userId", enableFirstCache = false,
            secondaryCache = @SecondaryCache(expireTime = 10, timeUnit = TimeUnit.SECONDS))
    public UserVO getUser2(Long userId) {
        log.info("执行AnnotationBasedDemoService.getUser2()");
        // 从DB或其它资源渠道获取数据
        UserVO userVO = new UserVO();
        userVO.setId(userId);
        userVO.setName("杨振宁");
        return userVO;
    }

    @Cacheable(cacheNames = "user3", key = "#userId",
            firstCache = @FirstCache(expireTime = 5, timeUnit = TimeUnit.SECONDS, expireMode = ExpireMode.WRITE),
            secondaryCache = @SecondaryCache(expireTime = 30, preloadTime = 5, forceRefresh = true, timeUnit = TimeUnit.SECONDS))
    public UserVO getUser3(Long userId) {
        log.info("执行AnnotationBasedDemoService.getUser()");
        // 从DB或其它资源渠道获取数据
        UserVO userVO = new UserVO();
        userVO.setId(userId);
        userVO.setName("钱学森");
        return userVO;
    }

}

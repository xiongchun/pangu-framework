package com.gitee.pulanos.pangu.showcases.cache.layering.service;

import com.github.xiaolyuh.cache.LayeringCache;
import com.github.xiaolyuh.manager.CacheManager;
import com.github.xiaolyuh.setting.FirstCacheSetting;
import com.github.xiaolyuh.setting.LayeringCacheSetting;
import com.github.xiaolyuh.setting.SecondaryCacheSetting;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * 基于API的两级缓存演示
 *
 * @author xiongchun
 */
@Slf4j
@Component
public class ApiBasedDemoService {

    @Autowired
    private CacheManager cacheManager;

    public void cache() {
        FirstCacheSetting firstCacheSetting = new FirstCacheSetting();
        SecondaryCacheSetting secondaryCacheSetting = new SecondaryCacheSetting();
        secondaryCacheSetting.setExpiration(10*1000);
        secondaryCacheSetting.setTimeUnit(TimeUnit.SECONDS);
        LayeringCacheSetting layeringCacheSetting = new LayeringCacheSetting(firstCacheSetting, secondaryCacheSetting, "", true);
        layeringCacheSetting.setEnableFirstCache(false);

        String cacheName = "user";
        String cacheKey = "10";
        LayeringCache cache = (LayeringCache) cacheManager.getCache(cacheName, layeringCacheSetting);
        cache.put(cacheKey, "test");
        log.info(cache.get(cacheKey, String.class));
        //cache.evict(cacheKey);
        //cache.clear();
    }
}

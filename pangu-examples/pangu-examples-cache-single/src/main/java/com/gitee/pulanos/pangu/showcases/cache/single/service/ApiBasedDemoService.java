package com.gitee.pulanos.pangu.showcases.cache.single.service;

import com.alibaba.fastjson.JSON;
import com.gitee.pulanos.pangu.showcases.cache.single.pojo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * 基于API的一级缓存演示
 *
 * @author xiongchun
 */
@Slf4j
@Component
public class ApiBasedDemoService {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    public void testRedisCache() {
        String key = "user:1";
        UserVO userVO = new UserVO().setId(1L).setName("钱学森");
        redisTemplate.opsForValue().set(key, JSON.toJSONString(userVO));
        String userJson = redisTemplate.opsForValue().get(key);
        log.info(userJson);
    }

}

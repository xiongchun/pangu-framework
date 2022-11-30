package com.gitee.pulanos.pangu.showcases.cache.layering.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ApiBasedDemoServiceTest {

    @Autowired
    private ApiBasedDemoService apiBasedDemoService;

    @Test
    public void cache() {
        apiBasedDemoService.cache();
    }
}
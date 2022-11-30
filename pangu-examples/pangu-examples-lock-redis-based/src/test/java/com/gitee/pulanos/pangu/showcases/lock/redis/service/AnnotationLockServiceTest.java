package com.gitee.pulanos.pangu.showcases.lock.redis.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AnnotationLockServiceTest {

    @Autowired
    private AnnotationLockService annotationLockService;

    @Test
    public void doBiz() {
        annotationLockService.doBiz();
    }

    @Test
    public void doBizAgain() {
        annotationLockService.doBiz();
    }

    @Test
    public void doBiz2() {
        annotationLockService.doBiz2(100L);
    }
}
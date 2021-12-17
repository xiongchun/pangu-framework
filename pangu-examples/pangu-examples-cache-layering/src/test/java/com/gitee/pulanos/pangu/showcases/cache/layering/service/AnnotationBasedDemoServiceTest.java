package com.gitee.pulanos.pangu.showcases.cache.layering.service;

import cn.hutool.core.thread.ThreadUtil;
import com.gitee.pulanos.pangu.showcases.cache.layering.pojo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class AnnotationBasedDemoServiceTest {

    @Autowired
    private AnnotationBasedDemoService annotationBasedDemoService;

    @Test
    public void getUser() {
        for (int i = 0; i < 50; i++) {
            ThreadUtil.sleep(1 * 1000);
            annotationBasedDemoService.getUser(1L);
        }
    }

    @Test
    public void saveUser() {
        UserVO userVO = new UserVO().setId(1L).setName("杨振宁");
        annotationBasedDemoService.saveUser(userVO);
    }

    @Test
    public void delUser() {
        annotationBasedDemoService.delUser(1L);
    }

    @Test
    public void delAllUsers() {
        annotationBasedDemoService.delAllUsers();
    }

    @Test
    public void getUser2() {
        for (int i = 0; i < 20; i++) {
            ThreadUtil.sleep(1 * 1000);
            annotationBasedDemoService.getUser2(1L);
        }
    }
}
package com.pulanit.pangu.admin.system;

import cn.hutool.core.lang.Console;
import cn.hutool.crypto.SecureUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
//@SpringBootTest
public class TempTest {

    @Test
    public void test1(){
        String coded = SecureUtil.sha256("123456");
        Console.log(coded);
    }
}

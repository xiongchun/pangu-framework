package com.gitee.pulanos.pangu.showcases.dubbo.consumer;

import com.gitee.pulanos.pangu.showcases.dubbo.api.in.UserIn;
import com.gitee.pulanos.pangu.showcases.dubbo.consumer.manager.UserAdminManager;
import org.apache.dubbo.rpc.service.GenericService;
import org.apache.dubbo.spring.boot.util.DubboUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ConsumerTest {

    @Autowired
    private UserAdminManager userAdminManager;

    @Test
    public void findUserTest() {
        userAdminManager.findUserEntityById(1L);
    }

    @Test
    public void listUserOuts() {
        UserIn userIn = new UserIn();
        userIn.setUserType("1");
        userAdminManager.listUserOuts(userIn);
    }

}

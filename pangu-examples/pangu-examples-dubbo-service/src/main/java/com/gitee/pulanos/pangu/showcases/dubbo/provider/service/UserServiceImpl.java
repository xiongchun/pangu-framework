package com.gitee.pulanos.pangu.showcases.dubbo.provider.service;

import com.gitee.pulanos.pangu.framework.common.BeanValidator;
import com.gitee.pulanos.pangu.showcases.dubbo.api.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.dubbo.api.in.UserIn;
import com.gitee.pulanos.pangu.showcases.dubbo.api.out.UserOut;
import com.gitee.pulanos.pangu.showcases.dubbo.api.service.UserService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.apache.shenyu.client.dubbo.common.annotation.ShenyuDubboClient;

import java.util.List;

/**
 * 用户相关服务
 * @author xiongchun
 */
@Slf4j
@Service(version = "1.0.0", group = "pangu-showcases-dubbo-service")
public class UserServiceImpl implements UserService {

    @Override
    @ShenyuDubboClient(path = "/findUserEntity")
    public UserEntity findUserEntity(Long id) {
        log.info("参数ID：{}", id);
        UserEntity userEntity = new UserEntity();
        userEntity.setId(id);
        userEntity.setName("云南码农大熊");
        return userEntity;
    }

    @Override
    @ShenyuDubboClient(path = "/listUserOuts")
    public List<UserOut> listUserOuts(UserIn userIn) {
        log.info("参数userIn：{}", userIn);
        BeanValidator.validate(userIn);
        List<UserOut> userOuts = Lists.newArrayList();
        UserOut userOut = new UserOut().setName("云南码农大熊").setUserType("1").setAge(18).setOrgId(1L);
        userOuts.add(userOut);
        return userOuts;
    }
}

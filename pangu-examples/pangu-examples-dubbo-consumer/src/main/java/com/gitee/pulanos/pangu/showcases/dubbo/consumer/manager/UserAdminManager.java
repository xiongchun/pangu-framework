package com.gitee.pulanos.pangu.showcases.dubbo.consumer.manager;

import cn.hutool.core.collection.CollUtil;
import com.gitee.pulanos.pangu.framework.common.BeanValidator;
import com.gitee.pulanos.pangu.showcases.dubbo.api.entity.UserEntity;
import com.gitee.pulanos.pangu.showcases.dubbo.api.in.UserIn;
import com.gitee.pulanos.pangu.showcases.dubbo.api.out.UserOut;
import com.gitee.pulanos.pangu.showcases.dubbo.api.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author xiongchun
 */
@Slf4j
@Component
public class UserAdminManager {

    @Reference(version = "1.0.0", group = "pangu-showcases-dubbo-service")
    private UserService userService;

    public void findUserEntityById(Long id){
        log.info("开始Dubbo远程调用...");
        UserEntity userEntity = userService.findUserEntity(id);
        log.info("[OK] 调用成功 {}", userEntity);
    }

    public void listUserOuts(UserIn userIn){
        log.info("开始Dubbo远程调用...");
        List<UserOut> userOuts = userService.listUserOuts(userIn);
        log.info("[OK] 调用成功 {}", userOuts);

    }

}

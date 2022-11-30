package com.gitee.pulanos.pangu.showcases.webapi.dubbo.service;

import com.gitee.pulanos.pangu.showcases.dubbo.api.dto.UserInDto;
import com.gitee.pulanos.pangu.showcases.dubbo.api.dto.UserOutDto;
import com.gitee.pulanos.pangu.showcases.dubbo.api.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
public class DemoService {

    @Reference(version = "1.0.0", group = "pangu-examples-dubbo-service")
    private UserService userService;

    public List<UserOutDto> listUserOuts(UserInDto userInDto) {
        log.info("UserService 入参：{}", userInDto);
        List<UserOutDto> userOutDtos = userService.listUserOuts(userInDto);
        return userOutDtos;
    }

}

package com.gitee.pulanos.pangu.showcases.webapi.dubbo.controller;

import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.gitee.pulanos.pangu.showcases.dubbo.api.dto.UserInDto;
import com.gitee.pulanos.pangu.showcases.dubbo.api.dto.UserOutDto;
import com.gitee.pulanos.pangu.showcases.dubbo.api.service.UserService;
import com.google.common.collect.Maps;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 演示WebAPI Controller
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("pangu/webapi")
public class DemoController {

    @Reference(version = "1.0.0", group = "pangu-examples-dubbo-service")
    private UserService userService;

    /**
     * 通过 Spring MVC 将 Duboo 微服务接口发布为 HTTP API
     * @return
     */
    @RequestMapping("/case1")
    public Result<List<UserOutDto>> case1() {
        log.info("call case1...");
        UserInDto userInDto = new UserInDto().setUserType("1");
        List<UserOutDto> userOutDtos = userService.listUserOuts(userInDto);
        return Result.success(userOutDtos);
    }

}

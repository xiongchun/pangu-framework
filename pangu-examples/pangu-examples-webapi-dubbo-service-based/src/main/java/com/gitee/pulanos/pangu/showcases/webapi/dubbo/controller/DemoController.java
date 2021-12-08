package com.gitee.pulanos.pangu.showcases.webapi.dubbo.controller;

import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.gitee.pulanos.pangu.showcases.dubbo.api.in.UserIn;
import com.gitee.pulanos.pangu.showcases.dubbo.api.out.UserOut;
import com.gitee.pulanos.pangu.showcases.dubbo.api.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.RequestBody;
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
     * case1
     *
     * @return
     */
    @RequestMapping("/case1")
    public Result<List<UserOut>> case1() {
        log.info("call case1...");
        UserIn userIn = new UserIn().setUserType("1");
        List<UserOut> userOuts = userService.listUserOuts(userIn);
        return Result.success(userOuts);
    }

}

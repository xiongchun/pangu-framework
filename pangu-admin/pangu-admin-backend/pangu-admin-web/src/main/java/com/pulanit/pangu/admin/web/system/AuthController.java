package com.pulanit.pangu.admin.web.system;

import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.pulanit.pangu.admin.system.api.param.LoginIn;
import com.pulanit.pangu.admin.system.api.param.LoginOut;
import com.pulanit.pangu.admin.system.api.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登录
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("/api/system/auth")
public class AuthController {

    @Reference(version = "1.0.0", group = "pangu-admin-system-app")
    private UserService userService;

    /**
     * 登录
     * @return
     */
    @PostMapping("/login")
    public Result<LoginOut> login(LoginIn inDto) {
        LoginOut loginOut = userService.login(inDto);
        return Result.success(loginOut);
    }

}

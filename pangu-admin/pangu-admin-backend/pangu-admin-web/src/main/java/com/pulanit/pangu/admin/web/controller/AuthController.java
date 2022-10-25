package com.pulanit.pangu.admin.web.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Console;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.JWTUtil;
import cn.hutool.jwt.JWTValidator;
import cn.hutool.jwt.signers.JWTSigner;
import cn.hutool.jwt.signers.JWTSignerUtil;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.pulanit.pangu.admin.system.api.param.LoginIn;
import com.pulanit.pangu.admin.system.api.param.LoginOut;
import com.pulanit.pangu.admin.system.api.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

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
    public Result<LoginOut> login(@RequestBody LoginIn loginIn) {
        LoginOut loginOut = userService.login(loginIn);
        final JWTSigner signer = JWTSignerUtil.hs256("123456".getBytes());
        Date date = DateUtil.offsetSecond(DateUtil.date(), 5);
        final String token = JWT.create().setExpiresAt(date).setSubject("100").setSigner(signer).sign();
        ThreadUtil.sleep(15*1000);
        JWTUtil.verify(token, signer);
        JWTValidator.of(token).validateDate(DateUtil.date());
        final JWT jwt = JWTUtil.parseToken(token);
        Console.log(jwt.getPayload("sub"));
        return Result.success(loginOut);
    }

}

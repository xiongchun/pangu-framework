package com.pulanit.pangu.admin.web.controller.home;

import cn.hutool.core.date.DateUtil;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.signers.JWTSigner;
import cn.hutool.jwt.signers.JWTSignerUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.pulanit.pangu.admin.system.api.domain.UserInfo;
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
public class LoginController {

    @Reference(version = "1.0.0", group = "pangu-admin-system-app")
    private UserService userService;

    @NacosValue(value = "${app.jwt.secret-key}")
    private String secretKey;

    @NacosValue(value = "${app.jwt.ttl-min}", autoRefreshed = true)
    private int ttlMinutes;

    /**
     * 登录
     *
     * @return
     */
    @PostMapping("/login")
    public Result<LoginOut> login(@RequestBody LoginIn loginIn) {
        Result<LoginOut> result = userService.login(loginIn);
        LoginOut loginOut = result.getData();
        String token = createToken(loginOut.getUserInfo());
        result.setData(loginOut.setToken(token));
        return result;
    }

    /**
     * 创建Token
     * @param userInfo
     * @return
     */
    private String createToken(UserInfo userInfo) {
        final JWTSigner signer = JWTSignerUtil.hs256(secretKey.getBytes());
        Date date = DateUtil.offsetMinute(DateUtil.date(), ttlMinutes);
        final String token = JWT.create().setExpiresAt(date).setSubject(JSON.toJSONString(userInfo)).setSigner(signer).sign();
        return token;
    }

}

package com.pulanit.pangu.admin.web.controller.home;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.signers.JWTSigner;
import cn.hutool.jwt.signers.JWTSignerUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.gitee.pulanos.pangu.framework.sdk.dto.Result;
import com.pulanit.pangu.admin.common.AppContext;
import com.pulanit.pangu.admin.common.domain.UserInfo;
import com.pulanit.pangu.admin.system.api.param.LoginIn;
import com.pulanit.pangu.admin.system.api.param.LoginOut;
import com.pulanit.pangu.admin.system.api.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
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
@RequestMapping("/api/system/home")
public class LoginController {

    @DubboReference(version = "1.0.0", group = "pangu-admin-system-app")
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
        log.info("账号 [{}] 尝试登录系统。", loginIn.getUserName());
        LoginOut loginOut = userService.login(loginIn);
        UserInfo userInfo = loginOut.getUserInfo();
        String token = createToken(userInfo);
        loginOut.setToken(token);
        log.info("账号 [{}] 成功登录系统。姓名:{}）", loginIn.getUserName(), userInfo.getName());
        return Result.success(loginOut);
}

    /**
     * 登出
     *
     * @return
     */
    @PostMapping("/logout")
    public Result<Void> logout() {
        UserInfo userInfo = AppContext.getUserInfo();
        // 原生 JWT 机制，无需做后端的退出资源清理
        if (userInfo != null) {
            log.info("用户 [{}] 成功登出系统。（userId:{}）", userInfo.getName(), userInfo.getId());
        }
        return Result.success();
    }

    /**
     * 创建Token
     *
     * @param userInfo
     * @return
     */
    private String createToken(UserInfo userInfo) {
        final JWTSigner signer = JWTSignerUtil.hs256(secretKey.getBytes());
        Date date = DateUtil.offsetMinute(DateUtil.date(), ttlMinutes);
        final String token = JWT.create().setJWTId(IdUtil.fastSimpleUUID()).setExpiresAt(date).setSubject(JSON.toJSONString(userInfo)).setSigner(signer).sign();
        return token;
    }

}

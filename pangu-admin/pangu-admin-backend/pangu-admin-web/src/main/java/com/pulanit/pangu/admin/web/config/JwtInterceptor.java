package com.pulanit.pangu.admin.web.config;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.exceptions.ValidateException;
import cn.hutool.core.util.StrUtil;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.JWTUtil;
import cn.hutool.jwt.JWTValidator;
import cn.hutool.jwt.signers.JWTSignerUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.pulanit.pangu.admin.common.AppConstants;
import com.pulanit.pangu.admin.common.domain.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.dubbo.rpc.RpcContext;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * JWT 拦截器
 */
@Slf4j
@Component
public class JwtInterceptor implements HandlerInterceptor {

    private final String TOKEN_HEADER = "Authorization";
    private final String PREFIX = "Bearer ";
    private final String SUBJECT = "sub";

    @NacosValue(value = "${app.jwt.secret-key}")
    private String secretKey;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader(TOKEN_HEADER);
        if (StrUtil.isEmpty(token)){
            this.write("操作被拦截，没有获取到 TOKEN 参数", response);
            return false;
        }
        token = StrUtil.subAfter(token, PREFIX, false);
        JWTValidator jwtValidator = JWTValidator.of(token);
        try {
            jwtValidator.validateAlgorithm(JWTSignerUtil.hs256(secretKey.getBytes()));
        }catch (ValidateException e){
            this.write("操作被拦截，TOKEN 签名校验失败。" + e.getMessage(), response);
            return false;
        }
        try {
            jwtValidator.validateDate(DateUtil.date());
        }catch (ValidateException e){
            this.write("操作被拦截，TOKEN 时间校验失败。" + e.getMessage(), response);
            return false;
        }

        // 如果需要结合 DB 校验，可以在此做扩展实现类似后端强制下线等需求

        final JWT jwt = JWTUtil.parseToken(token);
        UserInfo userInfo = JSON.parseObject(String.valueOf(jwt.getPayload(SUBJECT)), UserInfo.class);
        RpcContext.getContext().setAttachment(AppConstants.CURRENT_USER_KEY, JSON.toJSONString(userInfo));
        return true;
    }

    private void write(String info, HttpServletResponse response) throws Exception{
        // request.js 拦截器根据 response status 状态码处理
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        String json = JSON.toJSONString(Result.fail(info));
        response.setContentType("application/json");
        IOUtils.write(json, response.getOutputStream());
    }
}

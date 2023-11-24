package com.pulanit.pangu.admin.web.config;

import cn.hutool.core.util.StrUtil;
import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.gitee.pulanos.pangu.framework.sdk.Constants;
import com.gitee.pulanos.pangu.framework.sdk.dto.Result;
import com.gitee.pulanos.pangu.framework.sdk.exception.BizException;
import com.pulanit.pangu.admin.system.api.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletResponse;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @NacosValue(value = "${spring.application.name}")
    private String appName;
    @NacosValue(value = "${spring.active}")
    private String profilesActive;
    @DubboReference(version = "1.0.0", group = "pangu-admin-system", check = false)
    private LogService logService;

    /**
     * 主动抛出的业务异常
     * @param exception
     * @return
     */
    @ExceptionHandler(value = BizException.class)
    public Result bizExceptionHandler(BizException exception) {
        String code = exception.getCode();
        String message = exception.getMessage();
        log.error("BizException: code={}, message={}", code, message);
        return Result.make().setCode(code).setMessage(message);
    }

    /**
     * 参数校验失败
     * @param exception
     * @return
     */
    @ExceptionHandler(value = IllegalArgumentException.class)
    public Result IllegalArgumentExceptionHandler(IllegalArgumentException exception) {
        String code = Constants.Code.ILLEGAL_ARGUMENT;
        String message = exception.getMessage();
        log.error("IllegalArgumentException: code={}, message={}", code, message);
        return Result.make().setCode(code).setMessage(message);
    }

    /**
     * 其它异常
     * @param exception
     * @param response
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    public Result exceptionHandler(Exception exception, HttpServletResponse response) {
        String code = Constants.Code.SYSTEM_FAILED;
        String message = exception.getMessage();
        log.error(message, exception);
        // 语法糖 请忽略
        if (Constants.profilesActive.DEMO.equalsIgnoreCase(profilesActive)){
            if (StrUtil.containsIgnoreCase(message, "SQLSyntaxErrorException")){
                return Result.make().setCode(Constants.Code.SQL_EXCEPTION).setMessage("演示环境下不支持当前操作，请搭建本地环境试用。");
            }
        }
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        return Result.make().setCode(code).setMessage(message);
    }
}

package com.pulanit.pangu.admin.web.config;

import cn.hutool.core.date.DateUtil;
import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.gitee.pulanos.pangu.framework.common.Constants;
import com.gitee.pulanos.pangu.framework.common.entity.Result;
import com.gitee.pulanos.pangu.framework.common.exception.BizException;
import com.pulanit.pangu.admin.system.api.entity.LogExcEntity;
import com.pulanit.pangu.admin.system.api.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletResponse;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @NacosValue(value = "${spring.application.name}")
    private String appName;
    @Reference(version = "1.0.0", group = "pangu-admin-system-app")
    private LogService logService;

    @ExceptionHandler(value = BizException.class)
    public Result bizExceptionHandler(BizException bizException) {
        String code = bizException.getCode();
        String message = bizException.getMessage();
        this.sendMessage(code, message);
        // 业务异常不打印在Web层打印堆栈信息
        // log.error(StrUtil.format("BizException: code={}, message={}", code, message), bizException);
        log.error("BizException: code={}, message={}", code, message);
        return Result.make().setCode(code).setMessage(message);
    }

    @ExceptionHandler(value = Exception.class)
    public Result exceptionHandler(Exception exception, HttpServletResponse response) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        String code = Constants.Code.UNKNOWN_FAILED;
        String message = exception.getMessage();
        this.sendMessage(code, message);
        log.error(message, exception);
        return Result.make().setCode(code).setMessage(message);
    }

    private void sendMessage(String code, String message) {
        LogExcEntity entity = new LogExcEntity();
        entity.setCode(code).setMessage(message).setAppName(appName);
        entity.setGmtThrowed(DateUtil.date());
        try {
            logService.saveLogExc(entity);
        }catch (Exception e){
            log.error("持久化异常日志失败",e);
        }
    }
}

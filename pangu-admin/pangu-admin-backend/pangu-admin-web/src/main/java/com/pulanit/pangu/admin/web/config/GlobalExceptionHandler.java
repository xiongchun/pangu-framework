package com.pulanit.pangu.admin.web.config;

import cn.hutool.core.util.StrUtil;
import com.gitee.pulanos.pangu.framework.common.Constants;
import com.gitee.pulanos.pangu.framework.common.entity.Result;
import com.gitee.pulanos.pangu.framework.common.exception.BizException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletResponse;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(value = BizException.class)
    public Result bizExceptionHandler(BizException bizException) {
        String code = bizException.getCode();
        String message = bizException.getMessage();
        log.error(StrUtil.format("BizException: code={}, message={}", code, message), bizException);
        return Result.make().setCode(code).setMessage(message);
    }

    @ExceptionHandler(value = Exception.class)
    public Result exceptionHandler(Exception exception, HttpServletResponse response) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        String message = exception.getMessage();
        log.error(message, exception);
        return Result.make().setCode(Constants.Code.SERVER_ERROR).setMessage(message);
    }
}

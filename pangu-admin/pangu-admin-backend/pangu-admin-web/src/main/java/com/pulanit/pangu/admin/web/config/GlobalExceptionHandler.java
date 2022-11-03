package com.pulanit.pangu.admin.web.config;

import com.gitee.pulanos.pangu.framework.common.exception.BizException;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(value = BizException.class)
    public Result<Void> bizExceptionHandler(BizException bizException) {
        String code = bizException.getCode();
        String message = bizException.getMessage();
        log.error("BizException: code={}, message={}", code, message);
        //ResponseEntity.badRequest().
        return Result.fail(code, message);
    }
}

package com.gitee.myclouds.base.exception;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.base.vo.OutVO;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * Controller全局异常处理器
 * 
 * @author xiongchun
 *
 */
@RestControllerAdvice
@Slf4j
public class ExceptionControllerAdvice {

	/**
	 * 拦截业务异常 
	 * <p>这里也可以将异常主动打到异步队列去供分析使用
	 * 
	 * @param bizException
	 * @return
	 */
    @ExceptionHandler(value = BizException.class)
    public OutVO bizExceptionHandler(BizException bizException) {
        OutVO outVO = new OutVO(bizException.getCode()).setMsg(bizException.getMsg());
        outVO.setLogId(IdUtil.fastSimpleUUID());
        String msg =StrUtil.format( "BizException Occurred. ", JSON.toJSONString(outVO));
        log.error(msg, bizException);
        return outVO;
    }
    
    /**
     * 拦截系统异常
     * <p>这里也可以将异常主动打到异步队列去供分析使用
     * 
     * @param exception
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    public OutVO exceptionHandler(Exception exception ,HttpServletResponse response) {
        OutVO outVO = new OutVO(-900).setMsg("服务器内部错误。");
        response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
        outVO.setLogId(IdUtil.fastSimpleUUID());
        outVO.setTrace(exception.getMessage());
        String msg =StrUtil.format( "Exception Occurred. {}" , JSON.toJSONString(outVO));
        log.error(msg, exception);
        return outVO;
    }
    
}

package com.gitee.myclouds.base.exception;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.gitee.myclouds.common.vo.OutVO;

import cn.hutool.core.lang.UUID;
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
	 * 
	 * @param bizException
	 * @return
	 */
    @ExceptionHandler(value = BizException.class)
    public OutVO bizExceptionHandler(BizException bizException) {
    	//这里也可以将异常主动打到异步队列去供分析使用
        OutVO outVO = new OutVO(bizException.getCode()).setMsg(bizException.getMessage());
        return outVO;
    }
    
    /**
     * 拦截系统异常
     * 
     * @param exception
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    public OutVO exceptionHandler(Exception exception) {
        OutVO outVO = new OutVO(-1).setMsg("系统发生异常，请联系管理员。");
        //生成一个异常溯源ID，进行跟踪
        String traceId = UUID.fastUUID().toString();
        outVO.setTrace(traceId); //exception.getMessage();
         //这里也可以将异常主动打到异步队列去供分析使用
        String msg =StrUtil.format( "Exception Occurred. traceId：{}" , traceId);
        log.error(msg, exception);
        return outVO;
    }
    
}

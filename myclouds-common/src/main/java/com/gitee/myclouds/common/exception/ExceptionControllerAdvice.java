package com.gitee.myclouds.common.exception;

import java.sql.SQLException;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.gitee.myclouds.common.vo.OutVO;

import cn.hutool.core.util.StrUtil;

/**
 * Controller全局异常处理器
 * 
 * @author xiongchun
 *
 */
@RestControllerAdvice
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
    	//这里也可以将异常主动打到异步队列去供分析使用
        OutVO outVO = new OutVO(-1);
        String msg = "系统发生错误{}，请联系管理员。";
        if (exception instanceof NullPointerException) {
			outVO.setMsg(StrUtil.format(msg, "：空指针"));
		}else if (exception instanceof IllegalArgumentException) {
			outVO.setMsg(StrUtil.format(msg, "：请求参数类型不匹配"));
		}else if (exception instanceof SQLException) {
			outVO.setMsg(StrUtil.format(msg, "：数据库访问异常"));
		}else {
			outVO.setMsg(StrUtil.format(msg, ""));
		}
        return outVO;
    }
    
}

package com.gitee.myclouds.common.exception;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * 业务异常类
 * 
 * @author xiongchun
 *
 */
@Getter
@Setter
@Slf4j
public class BizException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	private int code;
	
	private String msg;
	
	public BizException(int code, String msg) {
        this.code = code;
        this.msg = msg;
        log.error("BizException业务异常，code：{}，msg：{}。", code, msg);
    }

}

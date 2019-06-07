package com.gitee.myclouds.base.exception;

import com.alibaba.fastjson.JSON;
import com.gitee.myclouds.common.wrapper.Dtos;

import lombok.Getter;
import lombok.Setter;

/**
 * 业务异常类
 * 
 * @author xiongchun
 *
 */
@Getter
@Setter
public class BizException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	private int code;
	
	private String msg;
	
	public BizException(int code, String msg) {
		super("BizException Occourred. " + JSON.toJSONString(Dtos.newDto().set("code", code).set("msg", msg)));
        this.code = code;
        this.msg = msg;
    }

}

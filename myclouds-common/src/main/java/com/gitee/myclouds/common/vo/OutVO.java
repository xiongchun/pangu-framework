package com.gitee.myclouds.common.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.ToString;

/**
 * 接口返回通用值对象
 * 
 * @author xiongchun
 *
 */
@Getter
@ToString
public class OutVO implements Serializable{

	private static final long serialVersionUID = 1L;

	//业务状态识别码
	private Integer code;
	
	//直接面向用户的提示信息
	private String msg;
	
	//列表分页查询的总记录数
	private Integer count;
	
	//业务数据主体
	private Object data;
	
	//堆栈溯源信息（异常摘要信息）
	private String trace;
	
	//发生异常时的处理建议（不常用，针对一些外部API的辅助调试）
	private String advice;
	
	public OutVO() {
	}
	
	public OutVO(int code) {
		setCode(code);
	}

	public OutVO setCode(int code) {
		this.code = code;
		return this;
	}

	public OutVO setMsg(String msg) {
		this.msg = msg;
		return this;
	}

	public OutVO setCount(int count) {
		this.count = count;
		return this;
	}

	public OutVO setData(Object data) {
		this.data = data;
		return this;
	}

	public OutVO setTrace(String trace) {
		this.trace = trace;
		return this;
	}

	public OutVO setAdvice(String advice) {
		this.advice = advice;
		return this;
	}
	
}

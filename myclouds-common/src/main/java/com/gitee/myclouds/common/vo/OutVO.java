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
	private int code;
	
	//提示信息
	private String msg;
	
	//列表分页查询的总记录数
	private int count;
	
	//业务数据主体
	private Object data;
	
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
	
}

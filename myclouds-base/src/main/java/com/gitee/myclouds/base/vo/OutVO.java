package com.gitee.myclouds.base.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 接口返回通用值对象
 * 
 * @author xiongchun
 *
 */
@Data
@ToString
@Accessors(chain = true)
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
	
	//堆栈溯源日志ID
	private String logId;
	
	//异常摘要信息
	private String trace;
	
	//发生异常时的处理建议（不常用，针对一些外部API的辅助调试）
	private String advice;
	
	public OutVO() {
	}
	
	public OutVO(int code) {
		setCode(code);
	}
}

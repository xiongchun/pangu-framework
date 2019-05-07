package com.gitee.myclouds.common.vo;

import java.io.Serializable;

import lombok.Data;

/**
 * 接口返回通用值对象
 * 
 * @author xiongchun
 *
 */
@Data
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
	
}

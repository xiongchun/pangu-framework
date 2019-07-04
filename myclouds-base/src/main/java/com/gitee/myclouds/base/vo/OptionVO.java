package com.gitee.myclouds.base.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

/**
 * 下拉框选项值对象
 * 
 * @author xiongchun
 *
 */
@Data
@ToString
public class OptionVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String value;
	
	private String text;
	
}

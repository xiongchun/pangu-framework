package com.gitee.myclouds.base.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 分页查询结果值对象
 * 
 * @author xiongchun
 *
 */
@Data
@ToString
@Accessors(chain = true)
public class PageVO implements Serializable{

	private static final long serialVersionUID = 1L;

	//列表分页查询的总记录数
	private Integer count;
	
	//列表分页查询结果数据
	private List<?> list;
	
	public PageVO() {
		
	}
	
}

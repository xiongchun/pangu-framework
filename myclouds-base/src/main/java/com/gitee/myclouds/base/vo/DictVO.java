package com.gitee.myclouds.base.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

/**
 * 数据字典通用值对象
 * 
 * @author xiongchun
 *
 */
@Data
@ToString
public class DictVO implements Serializable{

	private static final long serialVersionUID = 1L;

	//流水号
	private Integer id;	

	//类型
	private String dict_type;	

	//名称
	private String dict_name;	

	//数据字典KEY
	private String dict_key;	

	//字典对照值
	private String dict_value;	

	//是否启用
	private String is_enable;	
	
	//排序号
	private Integer sort_no;
	
}

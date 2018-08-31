package com.gitee.myclouds.common.vo;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.gitee.myclouds.common.wrapper.VO;

import lombok.Getter;
import lombok.Setter;

/**
 * KV键值参数VO对象
 * 
 * @author xiongchun
 *
 */
@Getter
@Setter
public class ParamVO extends VO{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 流水号
	 */
	private Integer id;	
	/**
	 * 参数名称
	 */
	private String name;	
	/**
	 * 参数键
	 */
	private String param_key;	
	/**
	 * 参数值
	 */
	private String value;	
	/**
	 * 所属分类
	 */
	private String type;	
	/**
	 * 更新时间
	 */
    @JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date update_time;	
	/**
	 * 备注
	 */
	private String remark;	
	
}

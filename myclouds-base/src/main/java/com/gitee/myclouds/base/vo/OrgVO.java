package com.gitee.myclouds.base.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

/**
 * 组织值对象
 * 
 * @author xiongchun
 *
 */
@Data
@ToString
public class OrgVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	//流水号
	private Integer id;	

	//组织名称
	private String name;	

	//父节点流水号
	private Integer parent_id;	

	//组织类型
	private String type;	

	//扩展码
	private String biz_code;	

	//排序号
	private Integer sort_no;	

	//扩展JSON
	private String ext;	
	
}

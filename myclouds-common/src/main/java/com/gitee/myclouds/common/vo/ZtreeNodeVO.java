package com.gitee.myclouds.common.vo;

import com.gitee.myclouds.common.wrapper.VO;

import lombok.Getter;
import lombok.Setter;

/**
 * ZTree树节点值对象
 * 
 * @author xiongchun
 *
 */
@Getter
@Setter
public class ZtreeNodeVO extends VO{
	
	private static final long serialVersionUID = -5973919398762544473L;
	
	/**
	 * 节点ID
	 */
	private Integer id;
	
	/**
	 * 父节点ID
	 */
	private Integer pId;
	
	/**
	 * 节点名称
	 */
	private String name;
	
	/**
	 * 节点是否展开
	 */
	private Boolean open;
	
	/**
	 * 节点是否选中
	 */
	private Boolean checked;

}

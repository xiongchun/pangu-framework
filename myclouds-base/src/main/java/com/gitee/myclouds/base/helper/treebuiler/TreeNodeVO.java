package com.gitee.myclouds.base.helper.treebuiler;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 树节点VO
 * 
 * @author xiongchun
 *
 */
@Data
@Accessors(chain = true)
public class TreeNodeVO implements Serializable {

	private static final long serialVersionUID = 1L;

	// 节点ID
	private String id;

	// 父节点ID
	private String pId;

	// 节点名称
	private String label;

	// 子孙节点集合
	private List<TreeNodeVO> children;

}

package com.gitee.myclouds.base.helper.treebuiler;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;

import lombok.Getter;
import lombok.Setter;

/**
 * 树结构数据模型构造器
 * 
 * @author xiongchun
 *
 */
public class TreeBuilder {

	@Getter
	@Setter
	List<TreeNodeVO> nodeVOs = Lists.newArrayList();

	public TreeBuilder() {
	}

	public TreeBuilder(List<TreeNodeVO> nodeVOs) {
		super();
		this.nodeVOs = nodeVOs;
	}

	public String buildJSONTree() {
		List<TreeNodeVO> nodeTree = buildTree();
		return JSON.toJSONString(nodeTree);
	}

	public List<TreeNodeVO> buildTree() {
		List<TreeNodeVO> treeNodeVOs = Lists.newArrayList();
		List<TreeNodeVO> rootTreeNodeVOs = getParentTreeNodes();
		for (TreeNodeVO rootTreeNodeVO : rootTreeNodeVOs) {
			buildChildTreeNodes(rootTreeNodeVO);
			treeNodeVOs.add(rootTreeNodeVO);
		}
		return treeNodeVOs;
	}

	private void buildChildTreeNodes(TreeNodeVO node) {
		List<TreeNodeVO> children = getChildTreeNodes(node);
		if (!children.isEmpty()) {
			for (TreeNodeVO child : children) {
				buildChildTreeNodes(child);
			}
			node.setChildren(children);
		}
	}

	public List<TreeNodeVO> getChildTreeNodes(TreeNodeVO pnode) {
		List<TreeNodeVO> childTreeNodeVOs = Lists.newArrayList();
		for (TreeNodeVO nodeVO : nodeVOs) {
			if (pnode.getId().equals(nodeVO.getPId())) {
				childTreeNodeVOs.add(nodeVO);
			}
		}
		return childTreeNodeVOs;
	}

	private boolean isParentNode(TreeNodeVO node) {
		boolean isParentNode = true;
		for (TreeNodeVO nodeVO : nodeVOs) {
			if (node.getPId().equals(nodeVO.getId())) {
				isParentNode = false;
				break;
			}
		}
		return isParentNode;
	}

	public List<TreeNodeVO> getParentTreeNodes() {
		List<TreeNodeVO> rootTreeNodeVOs = Lists.newArrayList();
		for (TreeNodeVO nodeVO : nodeVOs) {
			if (isParentNode(nodeVO)) {
				rootTreeNodeVOs.add(nodeVO);
			}
		}
		return rootTreeNodeVOs;
	}
	
}

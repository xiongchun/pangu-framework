package cn.osworks.aos.web.tag.core.model;

import java.util.List;



import cn.osworks.aos.core.asset.AOSJson;

import com.google.common.collect.Lists;

/**
 * 树模型构造器(一次加载全部数据)
 * <p>
 * 将从数据库中查询出的符合树模型数据结构的节点集合转换为前端所需的JSON对象
 * <p>
 * 
 * @author OSWorks-XC
 * @date 2014-09-09
 */
public class TreeBuilder {

	/**
	 * 转换为前端所需的JSON对象
	 * 
	 * @param treeList
	 *            从数据库中查询出的符合树模型数据结构的节点集合
	 * @return
	 */
	public static String build(List<TreeNode> treeList) {
		String outString = "";
		List<TreeNode> nodeList = Lists.newArrayList();
		// 重点：将平面的上下级节点组装为立体的关系。
		for (TreeNode node1 : treeList) {
			if (!node1.getLeaf()) {
				//防止垃圾数据造成没有子孙的空树枝节点。
				//空树枝节点也需要一个空chidren子节点，否则页面树会进入死循环。
				node1.appendChild(null);
			}
			boolean mark = false;
			for (TreeNode node2 : treeList) {
				if (node1.getParentId().equals(node2.getId())) {
					mark = true;
					node2.appendChild(node1);
					break;
				}
			}
			if (!mark) {
				nodeList.add(node1);
			}
		}
		outString = AOSJson.toJson(nodeList);
		return outString;
	}

}

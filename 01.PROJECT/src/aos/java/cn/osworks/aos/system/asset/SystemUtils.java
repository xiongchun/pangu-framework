package cn.osworks.aos.system.asset;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import cn.osworks.aos.system.dao.po.Aos_sys_modulePO;
import cn.osworks.aos.web.tag.core.model.TreeNode;

import com.google.common.collect.Lists;

/**
 * 系统管理的工具类
 * 
 * @author OSWorks-XC
 */
public class SystemUtils {
	
	/**
	 * 将后台树结构转换为前端树模型
	 * 
	 * @param aos_sys_modulePOs
	 * @return
	 */
	public static List<TreeNode> toTreeModal(List<Aos_sys_modulePO> aos_sys_modulePOs) {
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (Aos_sys_modulePO aos_sys_modulePO : aos_sys_modulePOs) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(aos_sys_modulePO.getId_());
			treeNode.setText(aos_sys_modulePO.getName_());
			treeNode.setParentId(aos_sys_modulePO.getParent_id_());
			treeNode.setIcon(aos_sys_modulePO.getIcon_name_());
			treeNode.setA(aos_sys_modulePO.getUrl_());
			treeNode.setLeaf(StringUtils.equals(aos_sys_modulePO.getIs_leaf_(), "0") ? false : true);
			treeNode.setExpanded(StringUtils.equals(aos_sys_modulePO.getIs_auto_expand_(), "0") ? false : true);
			treeNodes.add(treeNode);
		}
		return treeNodes;
	}

}

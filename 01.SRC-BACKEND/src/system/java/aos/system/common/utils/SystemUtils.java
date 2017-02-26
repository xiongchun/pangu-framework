package aos.system.common.utils;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;

import aos.framework.core.exception.AOSException;
import aos.framework.core.typewrap.Dto;
import aos.framework.core.utils.AOSCons;
import aos.framework.core.utils.AOSJson;
import aos.framework.core.utils.AOSUtils;
import aos.framework.taglib.core.model.TreeBuilder;
import aos.framework.taglib.core.model.TreeNode;

/**
 * 系统工具类
 * 
 * @author xiongchun
 *
 */
public class SystemUtils {

	/**
	 * 将后台树结构转换为前端树模型 (一次性加载完成的情况)
	 * 
	 * @param inDto
	 * @return
	 */
	public static String toTreeModalAllInOne(List<Dto> nodeDtos){
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (Dto nodeDto : nodeDtos) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(nodeDto.getString("id_"));
			treeNode.setText(nodeDto.getString("name_"));
			treeNode.setParentId(nodeDto.getString("parent_id_"));
			treeNode.setIcon(nodeDto.getString("icon_name_"));
			if (AOSUtils.isNotEmpty(nodeDto.getBoolean("checked"))) {
				treeNode.setChecked(nodeDto.getBoolean("checked"));
			}
			treeNode.setA(nodeDto.getString("url_"));
			treeNode.setB(nodeDto.getString("cascade_id_"));
			treeNode.setLeaf(StringUtils.equals(nodeDto.getString("is_leaf_"), SystemCons.IS.YES) ? true : false );
			treeNode.setExpanded(StringUtils.equals(nodeDto.getString("is_auto_expand_"), SystemCons.IS.YES) ? true : false );
			treeNodes.add(treeNode);
		}
		String jsonString = TreeBuilder.build(treeNodes);
		return jsonString;
	}
	
	/**
	 * 将后台树结构转换为前端树模型 (异步加载)
	 * 
	 * @return
	 */
	public static String toTreeModalAsyncLoad(List<Dto> treeModels){
		List<TreeNode> treeNodes = Lists.newArrayList();
		for (Dto model : treeModels) {
			TreeNode treeNode = new TreeNode();
			treeNode.setId(model.getString("id_"));
			treeNode.setText(model.getString("name_"));
			String icon_ = model.getString("icon_name_");
			if (AOSUtils.isNotEmpty(icon_)) {
				treeNode.setIcon(icon_);
			}
			String is_leaf_ = model.getString("is_leaf_");
			treeNode.setLeaf(AOSCons.YES.equals(is_leaf_) ? true : false);
			String is_auto_expand_ = model.getString("is_auto_expand_");
			treeNode.setExpanded(AOSCons.YES.equals(is_auto_expand_) ? true : false);
			treeNode.setA(model.getString("cascade_id_"));
			treeNodes.add(treeNode);
		}
		return AOSJson.toJson(treeNodes);
	}
	
	/**
	 * 生成树路径ID，如：01.01.01
	 * 
	 * @param curMaxNode
	 *            本级当前最大节点ID，如果要生成本级第一个节点则传XX.XX.00(XX.XX为父节点ID)。
	 * @param maxValue
	 *            本级节点ID允许的最大值
	 * @return
	 */
	public static String genCascadeTreeId(String curMaxNode, int maxValue) {
		String prefix = StringUtils.substringBeforeLast(curMaxNode, ".");
		String last = StringUtils.substringAfterLast(curMaxNode, ".");
		if (AOSUtils.isEmpty(last)) {
			throw new AOSException("树ID生成器生成节点ID参数错误");
		}
		int intLast = Integer.valueOf(last);
		if (intLast == maxValue || intLast > maxValue) {
			throw new AOSException("树ID生成器本级节点号源用尽");
		}
		String thisNode = String.valueOf(intLast + 1);
		thisNode = StringUtils.leftPad(thisNode, String.valueOf(maxValue).length(), "0");
		return prefix + "." + thisNode;
	}
}

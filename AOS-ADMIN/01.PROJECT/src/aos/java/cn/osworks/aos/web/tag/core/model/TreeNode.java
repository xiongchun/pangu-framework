package cn.osworks.aos.web.tag.core.model;

import java.util.ArrayList;
import java.util.List;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlOptionsHandler;



/**
 * <b>树节点模型</b>
 * <p>
 * 供标签使用和Java手工构造树模型使用
 * <p>
 * 也可供异步树的树节点使用。SQL映射返回类型为此类型，或在Java中将异构的数据转换为TreeNode类型。
 * <p>
 * 实现Ext树节点接口 属性参见：Ext.data.NodeInterface
 * 
 * @author OSWorks-XC
 * @date 2014-05-09
 */
public class TreeNode {

	/**
	 * 节点ID
	 */
	private String id;
	
	/**
	 * 父节点ID
	 */
	private String parentId;

	/**
	 * 设置为true或者false，在节点旁显示一个选中状态的复选框或未选中状态的复选框。
	 */
	private Boolean checked;

	/**
	 * 节点展开状态
	 */
	private Boolean expanded;

	/**
	 * 链接URL
	 */
	private String href;

	/**
	 * 链接目标对象
	 */
	private String hrefTarget;

	/**
	 * 节点图标文件
	 */
	private String icon;

	/**
	 * 应用于本节点的图标的CSS类。
	 */
	private String iconCls;

	/**
	 * 是否叶子节点
	 */
	private Boolean leaf;

	/**
	 * 本节点标签上的文本。
	 */
	private String text;

	/**
	 * 本节点上显示的Tooltip文本。
	 */
	private String qtip;

	/**
	 * 附加的节点任意属性值(非Ext.data.NodeInterface定义的属性)
	 */
	private String a;

	/**
	 * 附加的节点任意属性值(非Ext.data.NodeInterface定义的属性)
	 */
	private String b;

	/**
	 * 附加的节点任意属性值(非Ext.data.NodeInterface定义的属性)
	 */
	private String c;

	/**
	 * 子节点集合
	 */
	private List<TreeNode> children;

	/**
	 * 增加子节点：可以手工使用Java代码构造树模型
	 */
	public void appendChild(TreeNode treeNode) {
		if (AOSUtils.isEmpty(getChildren())) {
			children = new ArrayList<TreeNode>();
		}
		if (AOSUtils.isNotEmpty(treeNode)) {
			children.add(treeNode);
		}
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getHrefTarget() {
		return hrefTarget;
	}

	public void setHrefTarget(String hrefTarget) {
		this.hrefTarget = hrefTarget;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		if (AOSUtils.isNotEmpty(icon)) {
			String iconPath = System.getProperty(AOSCons.CXT_KEY);
			iconPath = iconPath + AOSXmlOptionsHandler.getValue("icon_path");
			this.icon = iconPath + icon;
		}
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getQtip() {
		return qtip;
	}

	public void setQtip(String qtip) {
		this.qtip = qtip;
	}

	public List<TreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public Boolean getExpanded() {
		return expanded;
	}

	public void setExpanded(Boolean expanded) {
		this.expanded = expanded;
	}

	public Boolean getLeaf() {
		return leaf;
	}

	public void setLeaf(Boolean leaf) {
		this.leaf = leaf;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

}

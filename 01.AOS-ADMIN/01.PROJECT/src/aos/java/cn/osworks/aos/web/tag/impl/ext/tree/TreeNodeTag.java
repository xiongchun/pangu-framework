package cn.osworks.aos.web.tag.impl.ext.tree;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import cn.osworks.aos.core.asset.AOSJson;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.web.tag.asset.AOSTagUtils;
import cn.osworks.aos.web.tag.core.model.TreeNode;
import cn.osworks.aos.web.tag.impl.ext.ExtTagSupport;


/**
 * <b>TreeNode标签实现类</b>
 * 
 * 属性参见：Ext.data.NodeInterface
 * 
 * @author OSWorks-XC
 * @date 2014-05-06
 */
public class TreeNodeTag extends ExtTagSupport {

	private static final long serialVersionUID = 1L;

	private String checked;

	private String expanded;

	private String href;

	private String hrefTarget;

	private String icon;

	private String iconCls;

	private String leaf = TRUE;;

	private String text;

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

	private List<TreeNode> children;

	/**
	 * 增加子节点
	 */
	public void appendChild(TreeNode treeNode) {
		if (AOSUtils.isEmpty(getChildren())) {
			children = new ArrayList<TreeNode>();
		}
		children.add(treeNode);
	}

	/**
	 * 预处理和标签逻辑校验
	 * 
	 * @throws JspException
	 */
	private void doPrepare() throws JspException {
		// 缺省为叶子节点,如果有子节点则将父节点设置为非叶子节点。省去jsp手工设置属性。
		if (getParent() instanceof TreeNodeTag) {
			TreeNodeTag parentTag = (TreeNodeTag) getParent();
			parentTag.setLeaf(FALSE);
		}
	}

	/**
	 * 开始标签
	 */
	public int doStartTag() throws JspException {
		doPrepare();
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 结束标签
	 */
	public int doEndTag() throws JspException {
		TreeNode treeNode = new TreeNode();
		treeNode.setChecked(AOSTagUtils.getBoolean(getChecked()));
		treeNode.setExpanded(AOSTagUtils.getBoolean(getExpanded()));
		treeNode.setHref(getHref());
		treeNode.setHrefTarget(getHrefTarget());
		treeNode.setIcon(getIcon());
		treeNode.setIconCls(getIconCls());
		treeNode.setLeaf(AOSTagUtils.getBoolean(getLeaf()));
		treeNode.setId(getMyId());
		treeNode.setQtip(getQtip());
		treeNode.setText(getText());
		treeNode.setA(getA());
		treeNode.setB(getB());
		treeNode.setC(getC());
		treeNode.setChildren(children);
		if (getParent() instanceof TreeNodeTag) {
			// 表明此标签是node标签的子标签
			TreeNodeTag treeNodeTag = (TreeNodeTag) getParent();
			treeNodeTag.appendChild(treeNode);
		} else if (getParent() instanceof TreePanelTag) {
			// 表明此标签是tree标签的第一个儿子标签(根节点)
			String rootJson = AOSJson.toJson(treeNode);
			TreePanelTag parentTag = (TreePanelTag) getParent();
			parentTag.setRootJson(rootJson);
		}
		doClear();
		return EVAL_PAGE;
	}

	/**
	 * 后处理标签现场
	 * 
	 * @throws JspException
	 */
	private void doClear() throws JspException {
		setId(null);
		setChildren(null);
	}

	/**
	 * 释放资源
	 */
	public void release() {
		super.release();
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
		this.icon = icon;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getLeaf() {
		return leaf;
	}

	public void setLeaf(String leaf) {
		this.leaf = leaf;
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

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getExpanded() {
		return expanded;
	}

	public void setExpanded(String expanded) {
		this.expanded = expanded;
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

}

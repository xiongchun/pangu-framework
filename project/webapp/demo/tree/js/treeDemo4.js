/**
 * 树形UI综合示例(普通树)
 * 
 * @author XiongChun
 * @since 2010-10-27
 */
Ext.onReady(function() {

	var root = new Ext.tree.AsyncTreeNode({
				id : '00',
				text : '中国',
				// 显示一个未选中的复选框
				checked : false
			});
	// 表格工具栏
	var tbar = new Ext.Toolbar({
				items : [{
							text : '获取选中节点值',
							iconCls : 'arrow_refreshIcon',
							handler : function() {
								// 获取选中节点数组
								var checkedNodes = tree.getChecked();
								if (Ext.isEmpty(checkedNodes)) {
									Ext.Msg.alert('提示', '没有选中任何节点');
									return;
								}
								var strID = '';
								Ext.each(checkedNodes, function(node) {
											strID = strID + node.id + ',';
										});
								// 可以将此字符串传到后台处理
								Ext.Msg.alert('提示', strID);
							}
						}]
			});

	// 定义一个树面板
	var tree = new Ext.tree.TreePanel({
		loader : new Ext.tree.TreeLoader({
					baseAttrs : {},
					dataUrl : 'treeDemo.do?reqCode=queryAreas4CheckTree2'
				}),
		title : '',
		tbar : tbar,
		renderTo : 'treeDiv',
		width : 400,
		// border: false, //面板边框
		useArrows : true, // 箭头节点图标
		root : root, // 根节点
		height : 500,
		autoScroll : true, // 内容溢出时产生滚动条
		animate : false
			// 是否动画显示
		});
	// 选中根节点
	tree.getRootNode().select();
	// 异步加载的树如果要支持级联选中,则必须一次性全部展开
	tree.expandAll();

	// 绑定节点单击事件
	tree.on("click", function(node, e) {
				// Ext.MessageBox.alert('提示', 'ID:' + node.id + " text:"
				// + node.text);
			});
    
	//绑定选中状态变更事件,增加化横线的效果
	tree.on('checkchange', function(node, checked) {
				if (checked) {
					node.getUI().addClass('node_checked');
				} else {
					node.getUI().removeClass('node_checked');
				}
			});

	var firstWindow = new Ext.Window({
		title : '<span class="commoncss">树范例四(级联复选树)</span>', // 窗口标题
		layout : 'fit', // 设置窗口布局模式
		width : 300, // 窗口宽度
		height : 400, // 窗口高度
		closable : false, // 是否可关闭
		collapsible : true, // 是否可收缩
		maximizable : true, // 设置是否可以最大化
		border : false, // 边框线设置
		constrain : true, // 设置窗口是否可以溢出父容器
		pageY : 20, // 页面定位Y坐标
		pageX : document.body.clientWidth / 2 - 300 / 2, // 页面定位X坐标
		items : [tree]
			// 嵌入的表单面板
		});
	firstWindow.show(); // 显示窗口

	/** ***************** 级联选中支持开始 ******************** */
	/**
	 * 关于级联选中的说明：级联选中最好使用非异步加载树节点的方式, 因为异步加载的方式其子节点是按需构造的，
	 * 所以在您选中节点的时候，如果其子节点还没有加载展开，则其子节点是不能被选中的。因此，对于需要级联选中
	 * 的需求，建议使用非异步加载树。如果您还是要使用异步加载，那么则必须在加载后将所有节点自动展开把所有节点
	 * 都构造出来。但这样也已经失去了异步加载的优势了。具体用法见本例。
	 */
	function cascadeParent() {
		var pn = this.parentNode;
		if (!pn || !Ext.isBoolean(this.attributes.checked))
			return;
		if (this.attributes.checked) {// 级联选中
			pn.getUI().toggleCheck(true);
		} else {// 级联未选中
			var b = true;
			Ext.each(pn.childNodes, function(n) {
						if (n.getUI().isChecked()) {
							return b = false;
						}
						return true;
					});
			if (b)
				pn.getUI().toggleCheck(false);
		}
		pn.cascadeParent();
	}
	function cascadeChildren() {
		var ch = this.attributes.checked;
		if (!Ext.isBoolean(ch))
			return;
		Ext.each(this.childNodes, function(n) {

					n.getUI().toggleCheck(ch);
					n.cascadeChildren();
				});
	}
	// 为TreeNode对象添加级联父节点和子节点的方法
	Ext.apply(Ext.tree.TreeNode.prototype, {
				cascadeParent : cascadeParent,
				cascadeChildren : cascadeChildren
			});
	// Checkbox被点击后级联父节点和子节点
	Ext.override(Ext.tree.TreeEventModel, {
				onCheckboxClick : Ext.tree.TreeEventModel.prototype.onCheckboxClick.createSequence(function(e, node) {
							node.cascadeParent();
							node.cascadeChildren();
						})
			});
		/** ***************** 级联选中支持结束 ******************** */
	});
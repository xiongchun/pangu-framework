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
						checked : false,
						expanded : true

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
								}, {
									text : '刷新选中节点',
									iconCls : 'tbar_synchronizeIcon',
									handler : function() {
										var selectModel = tree.getSelectionModel();
										var selectNode = selectModel.getSelectedNode();
										if (Ext.isEmpty(selectNode)) {
											Ext.Msg.alert('提示', '没有选中任何节点!');
										} else {
											selectNode.reload();
										}
									}
								}]
					});

			// 定义一个树面板
			var tree = new Ext.tree.TreePanel({
				loader : new Ext.tree.TreeLoader({
							baseAttrs : {},
							dataUrl : 'treeDemo.do?reqCode=queryAreas4CheckTree'
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

			// 绑定节点单击事件
			tree.on("click", function(node, e) {
						// Ext.MessageBox.alert('提示', 'ID:' + node.id + " text:"
						// + node.text);
					});

			var firstWindow = new Ext.Window({
				title : '<span class="commoncss">树范例三(复选树)</span>', // 窗口标题
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

		});
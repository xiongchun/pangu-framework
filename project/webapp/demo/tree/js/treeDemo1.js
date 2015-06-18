/**
 * 树形UI综合示例(普通树)
 * 
 * @author XiongChun
 * @since 2010-10-27
 */
Ext.onReady(function() {

			var root = new Ext.tree.TreeNode({
						id : '0',
						text : '中国'
					});
			var node1 = new Ext.tree.TreeNode({
				id : '1',
				text : '云南省'
					// href : 'url', // 链接地址
					// hrefTarget : 'mainFrame' // 连接地址打开目标对象
				});
			var node2 = new Ext.tree.TreeNode({
						id : '2',
						iconCls : 'medal_gold_1Icon', // 节点图标
						text : '大理白族自治州'
					});
			var node3 = new Ext.tree.TreeNode({
						id : '3',
						text : '香港特区',
						customProperty:'我爱香港'
					});
			var node4 = new Ext.tree.TreeNode({
						id : '4',
						iconCls : 'expand-allIcon',
						text : '西藏自治区'
					});
			var node5 = new Ext.tree.TreeNode({
						id : '5',
						expanded : true, // 是否展开节点
						text : '台湾地区'
					});
			var node6 = new Ext.tree.TreeNode({
						id : '6',
						text : '台北市'
					});

			root.appendChild(node1);
			node1.appendChild(node2);
			root.appendChild(node3);
			root.appendChild(node4);
			root.appendChild(node5);
			node5.appendChild(node6);

			// 定义一个树面板
			var tree = new Ext.tree.TreePanel({
				title : '',
				renderTo : 'treeDiv',
				width : 400,
				// border: false, //面板边框
				useArrows : true, // 箭头节点图标
				root : root,
				autoScroll : true,
				animate : false
					// 是否动画显示
				});

			root.expand(false); // true为递归展开,false为只展开本节点

			// 绑定节点单击事件
			tree.on("click", function(node, e) {
				       if(node.id=='3'){
				         Ext.MessageBox.alert('提示', 'ID:' + node.id +  ' text:' + node.text + " 附加属性值:" + node.attributes.customProperty);
				       }else{
				       	  Ext.MessageBox.alert('提示', 'ID:' + node.id +  ' text:' + node.text );
				       }
					});

			// 定义一个右键菜单
			var contextmenu = new Ext.menu.Menu({
						id : 'theContextMenu',
						items : [{
									iconCls : 'userIcon',
									text : '是男人就点我',
									handler : function() {
										var selectModel = tree.getSelectionModel(); // 获取树选择模型
										var selectNode = selectModel.getSelectedNode(); // 获取当前树选中节点对象
										Ext.Msg.alert('提示', 'ID:' + selectNode.id + " text:" + selectNode.text);
									}
								}, {
									iconCls : 'user_femaleIcon',
									text : '再点一次',
									handler : function() {
										Ext.Msg.alert('提示', '点我呢点!');
									}
								}]
					});
			// 绑定右键菜单
			tree.on("contextmenu", function(node, e) {
						e.preventDefault();
						node.select();
						contextmenu.showAt(e.getXY());
					});

			var firstWindow = new Ext.Window({
				title : '<span class="commoncss">树范例一(普通树)</span>', // 窗口标题
				layout : 'fit', // 设置窗口布局模式
				width : 250, // 窗口宽度
				height : 300, // 窗口高度
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
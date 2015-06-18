/**
 * 配合Panel 的autoload加载
 * 
 * @author XiongChun
 * @since 2010-10-28
 */
Ext.onReady(function() {

			var root = new Ext.tree.AsyncTreeNode({
						text : '部门树',
						expanded : true,
						id : '001'
					});

			var deptTree = new Ext.ux.tree.TreeGrid({
						loader : new Ext.tree.TreeLoader({
									dataUrl : 'treeDemo.do?reqCode=departmentTreeInit'
								}),
						title : '',
						root : root,
						animate : false,
						renderTo : 'treeDiv',
						width : 650, // 必须指定,否则显示有问题
						//height : 400,
						columns : [{
									header : '部门名称',
									dataIndex : 'text',
									width : 200
								}, {
									header : '部门ID',
									dataIndex : 'id',
									width : 120
								}, {
									header : '父部门ID',
									dataIndex : 'parentid',
									width : 120
								}, {
									header : '自定义ID',
									dataIndex : 'customid',
									width : 60
								}, {
									header : '排序号',
									dataIndex : 'sortno',
									width : 60
								}],
						useArrows : true,
						border : true
					});

			deptTree.on("click", function(node, e) {
						Ext.MessageBox.alert('提示', 'ID:' + node.id + " text:" + node.text);
					});
		});
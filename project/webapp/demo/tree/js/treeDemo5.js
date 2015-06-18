/**
 * 树形UI综合示例(下拉树)
 * 
 * @author XiongChun
 * @since 2010-10-28
 */
Ext.onReady(function() {
			var addRoot = new Ext.tree.AsyncTreeNode({
						text : '部门树',
						expanded : true,
						id : '001'
					});
			var addDeptTree = new Ext.tree.TreePanel({
						loader : new Ext.tree.TreeLoader({
									baseAttrs : {},
									dataUrl : 'treeDemo.do?reqCode=departmentTreeInit'
								}),
						root : addRoot,
						autoScroll : true,
						animate : false,
						useArrows : false,
						border : false
					});
			// 监听下拉树的节点单击事件
			addDeptTree.on('click', function(node) {
						comboxWithTree.setValue(node.text);
						Ext.getCmp("firstForm").findById('parentid').setValue(node.attributes.id);
						comboxWithTree.collapse();
					});
			var comboxWithTree = new Ext.form.ComboBox({
						id : 'parentdeptname',
						store : new Ext.data.SimpleStore({
									fields : [],
									data : [[]]
								}),
						editable : false,
						value : ' ',
						emptyText : '请选择...',
						fieldLabel : '上级部门',
						anchor : '100%',
						mode : 'local',
						triggerAction : 'all',
						maxHeight : 390,
						// 下拉框的显示模板,addDeptTreeDiv作为显示下拉树的容器
						tpl : "<tpl for='.'><div style='height:390px'><div id='addDeptTreeDiv'></div></div></tpl>",
						allowBlank : false,
						onSelect : Ext.emptyFn
					});

			// 监听下拉框的下拉展开事件
			comboxWithTree.on('expand', function() {
						// 将UI树挂到treeDiv容器
						addDeptTree.render('addDeptTreeDiv');
						// addDeptTree.root.expand(); //只是第一次下拉会加载数据
						addDeptTree.root.reload(); // 每次下拉都会加载数据

					});

			var firstForm = new Ext.form.FormPanel({
						id : 'firstForm',
						name : 'firstForm',
						labelWidth : 60, // 标签宽度
						// frame : true, // 是否渲染表单面板背景色
						defaultType : 'textfield', // 表单元素默认类型
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						items : [{
									id : 'parentid',
									name : 'parentid',
									fieldLabel : '部门编号',
									readOnly : true,
									anchor : '100%'
								}, comboxWithTree]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">标准范例五(下拉树)</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 350, // 窗口宽度
						height : 160, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						pageY : 20, // 页面定位X坐标
						pageX : document.body.clientWidth / 2 - 350 / 2, // 页面定位Y坐标
						items : [firstForm]
					});
			firstWindow.show(); // 显示窗口
		});
/**
 * 表格综合示例(可编辑表格)
 * 
 * @author XiongChun
 * @since 2010-10-20
 */
Ext.onReady(function() {

			// 定义自动当前页行号
			var rownum = new Ext.grid.RowNumberer({
						header : 'NO',
						width : 28
					});

			// 定义列模型
			var cm = new Ext.grid.ColumnModel([rownum, {
				header : '项目ID', // 列标题
				dataIndex : 'xmid', // 数据索引:和Store模型对应
				sortable : true
					// 是否可排序
				}, {
				header : '项目名称',
				dataIndex : 'xmmc',
				sortable : true,
				editor : new Ext.grid.GridEditor(new Ext.form.TextField({
							// 只对原有数据编辑有效,对新增一行的场景无效
							allowBlank : false
						})),
				width : 200
			}, {
				header : '项目热键',
				dataIndex : 'xmrj',
				editor : new Ext.grid.GridEditor(new Ext.form.TextField({}))
			}, {
				header : '规格',
				dataIndex : 'gg',
				editor : new Ext.grid.GridEditor(new Ext.form.TextField({}))
			}, {
				header : '单位',
				dataIndex : 'dw',
				editor : new Ext.grid.GridEditor(new Ext.form.TextField({})),
				width : 60
			}, {
				header : '启用状态',
				dataIndex : 'qybz',
				// 演示render的用法(代码转换,该render由<G4Studio:ext.codeRender/>标签生成)
				renderer : QYBZRender,
				editor : new Ext.grid.GridEditor(new Ext.form.ComboBox({
							store : QYBZStore,
							mode : 'local',
							triggerAction : 'all',
							valueField : 'value',
							displayField : 'text',
							allowBlank : false,
							forceSelection : true,
							typeAhead : true
						})),
				width : 80
			}, {
				header : '更改时间',
				dataIndex : 'ggsj',
				renderer : Ext.util.Format.dateRenderer('Y-m-d'),
				editor : new Ext.grid.GridEditor(new Ext.form.DateField({
							format : 'Y-m-d'
						})),
				width : 140
			}]);

			/**
			 * 数据存储
			 */
			var store = new Ext.data.Store({
						// true to clear all modified record information each
						// time the store is loaded
						pruneModifiedRecords : true,
						// 获取数据的方式
						proxy : new Ext.data.HttpProxy({
									url : 'gridDemo.do?reqCode=querySfxmDatas'
								}),
						// 数据读取器
						reader : new Ext.data.JsonReader({
									totalProperty : 'TOTALCOUNT', // 记录总数
									root : 'ROOT' // Json中的列表数据根节点
								}, [{
											name : 'xmid' // Json中的属性Key值
										}, {
											name : 'sfdlbm'
										}, {
											name : 'xmmc'
										}, {
											name : 'xmrj'
										}, {
											name : 'gg'
										}, {
											name : 'dw'
										}, {
											name : 'qybz'
										}, {
											name : 'ggsj',
											type : 'date',
											dateFormat : 'Y-m-d'
										}])
					});

			// 定义一个Record
			var MyRecord = Ext.data.Record.create([{
						name : 'xmid',
						type : 'string'
					}, {
						name : 'sfdlbm',
						type : 'string'
					}, {
						name : 'xmmc',
						type : 'string'
					}, {
						name : 'xmrj',
						type : 'string'
					}, {
						name : 'gg',
						type : 'string'
					}, {
						name : 'dw',
						type : 'string'
					}, {
						name : 'qybz',
						type : 'string'
					}, {
						name : 'ggsj',
						type : 'data'
					}]);

			/**
			 * 翻页排序时候的参数传递
			 */
			// 翻页排序时带上查询条件
			store.on('beforeload', function() {
						this.baseParams = {
							xmmc : Ext.getCmp('xmmc').getValue()
						};
					});
			// 每页显示条数下拉选择框
			var pagesize_combo = new Ext.form.ComboBox({
						name : 'pagesize',
						triggerAction : 'all',
						mode : 'local',
						store : new Ext.data.ArrayStore({
									fields : ['value', 'text'],
									data : [[10, '10条/页'], [20, '20条/页'], [50, '50条/页'], [100, '100条/页'], [250, '250条/页'], [500, '500条/页']]
								}),
						valueField : 'value',
						displayField : 'text',
						value : '20',
						editable : false,
						width : 85
					});
			var number = parseInt(pagesize_combo.getValue());
			// 改变每页显示条数reload数据
			pagesize_combo.on("select", function(comboBox) {
						bbar.pageSize = parseInt(comboBox.getValue());
						number = parseInt(comboBox.getValue());
						store.reload({
									params : {
										start : 0,
										limit : bbar.pageSize
									}
								});
					});

			// 分页工具栏
			var bbar = new Ext.PagingToolbar({
						pageSize : number,
						store : store,
						displayInfo : true,
						displayMsg : '显示{0}条到{1}条,共{2}条',
						plugins : new Ext.ux.ProgressBarPager(), // 分页进度条
						emptyMsg : "没有符合条件的记录",
						items : ['-', '&nbsp;&nbsp;', pagesize_combo]
					});

			// 表格工具栏
			var tbar = new Ext.Toolbar({
						items : [{
									xtype : 'textfield',
									id : 'xmmc',
									name : 'xmmc',
									emptyText : '请输入项目名称',
									width : 150,
									enableKeyEvents : true,
									// 响应回车键
									listeners : {
										specialkey : function(field, e) {
											if (e.getKey() == Ext.EventObject.ENTER) {
												queryCatalogItem();
											}
										}
									}
								}, {
									text : '查询',
									iconCls : 'page_findIcon',
									handler : function() {
										queryCatalogItem();
									}
								}, {
									text : '刷新',
									iconCls : 'page_refreshIcon',
									handler : function() {
										store.reload();
									}
								}, '-', {
									text : '新增一行',
									iconCls : 'addIcon',
									handler : function() {
										var row = new MyRecord({});
										row.set('qybz', '1'); // 赋初值
										grid.stopEditing();
										store.insert(0, row);
										grid.startEditing(0, 2);
									}
								}, {
									text : '保存',
									iconCls : 'acceptIcon',
									handler : function() {
										saveRow();
									}
								}, {
									text : '删除一行',
									iconCls : 'deleteIcon',
									handler : function() {
										var sm = grid.getSelectionModel();
										var cell = sm.getSelectedCell();
										if (Ext.isEmpty(cell)) {
											Ext.Msg.alert('提示', '你没有选中行');
										}
										var record = store.getAt(cell[0]);
										Ext.MessageBox.alert('提示', '项目ID:' + record.get('xmid'))
										store.remove(record);
									}
								}]
					});

			// 表格实例
			var grid = new Ext.grid.EditorGridPanel({
						// 表格面板标题,默认为粗体，我不喜欢粗体，这里设置样式将其格式为正常字体
						title : '<span class="commoncss">表格综合演示三</span>',
						height : 500,
						autoScroll : true,
						frame : true,
						region : 'center', // 和VIEWPORT布局模型对应，充当center区域布局
						margins : '3 3 3 3',
						store : store, // 数据存储
						stripeRows : true, // 斑马线
						cm : cm, // 列模型
						tbar : tbar, // 表格工具栏
						bbar : bbar,// 分页工具栏
						clicksToEdit : 1, // 单击、双击进入编辑状态
						viewConfig : {
							// 不产横向生滚动条, 各列自动扩展自动压缩, 适用于列数比较少的情况
							forceFit : true
						},
						loadMask : {
							msg : '正在加载表格数据,请稍等...'
						}
					});

			// 是否默认选中第一行数据
			bbar.on("change", function() {
						// grid.getSelectionModel().selectFirstRow();

					});

			// 页面初始自动查询数据
			// store.load({params : {start : 0,limit : bbar.pageSize}});

			// 布局模型
			var viewport = new Ext.Viewport({
						layout : 'border',
						items : [grid]
					});

			// 查询表格数据
			function queryCatalogItem() {
				store.load({
							params : {
								start : 0,
								limit : bbar.pageSize,
								xmmc : Ext.getCmp('xmmc').getValue()
							}
						});
			}

			// 保存
			function saveRow() {
				var m = store.modified.slice(0); // 获取修改过的record数组对象
				if (Ext.isEmpty(m)) {
					Ext.MessageBox.alert('提示', '没有数据需要保存!');
					return;
				}
				if (!validateEditGrid(m, 'xmmc')) {
					Ext.Msg.alert('提示', '项目名称字段数据校验不合法,请重新输入!', function() {
								grid.startEditing(0, 2);
							});
					return;
				}
				var jsonArray = [];
				// 将record数组对象转换为简单Json数组对象
				Ext.each(m, function(item) {
							jsonArray.push(item.data);
						});
				// 提交到后台处理
				Ext.Ajax.request({
							url : 'gridDemo.do?reqCode=saveDirtyDatas',
							success : function(response) { // 回调函数有1个参数
								var resultArray = Ext.util.JSON.decode(response.responseText);
								Ext.Msg.alert('提示', resultArray.msg);
							},
							failure : function(response) {
								Ext.MessageBox.alert('提示', '数据保存失败');
							},
							params : {
								// 系列化为Json资料格式传入后台处理
								dirtydata : Ext.encode(jsonArray)
							}
						});
			}

			// 检查新增行的可编辑单元格数据合法性
			function validateEditGrid(m, colName) {
				for (var i = 0; i < m.length; i++) {
					var record = m[i];
					var rowIndex = store.indexOfId(record.id);
					var value = record.get(colName);
					if (Ext.isEmpty(value)) {
						// Ext.Msg.alert('提示', '数据校验不合法');
						return false;
					}
					var colIndex = cm.findColumnIndex(colName);
					var editor = cm.getCellEditor(colIndex).field;
					if (!editor.validateValue(value)) {
						// Ext.Msg.alert('提示', '数据校验不合法');
						return false;
					}
				}
				return true;
			}

		});
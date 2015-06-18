/**
 * dao代码生成
 * 
 * @author XiongChun
 * @since 2012-10-13
 */
Ext.onReady(function() {
	var sm = new Ext.grid.CheckboxSelectionModel();
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm, {
				header : '表名',
				dataIndex : 'table_name',
				sortable : true,
				width : 200
			}, {
				header : '注释',
				id : 'comments',
				dataIndex : 'comments'
			}]);

	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : './codeGenerator.do?reqCode=queryTables'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'TOTALCOUNT',
							root : 'ROOT'
						}, [{
									name : 'table_name'
								}, {
									name : 'comments'
								}])
			});

	// 翻页排序时带上查询条件
	store.on('beforeload', function() {
				this.baseParams = {
					table_name : Ext.getCmp('table_name').getValue()
				};
			});

	var pagesize_combo = new Ext.form.ComboBox({
				name : 'pagesize',
				hiddenName : 'pagesize',
				typeAhead : true,
				triggerAction : 'all',
				lazyRender : true,
				mode : 'local',
				store : new Ext.data.ArrayStore({
							fields : ['value', 'text'],
							data : [[10, '10条/页'], [20, '20条/页'],
									[50, '50条/页'], [100, '100条/页'],
									[250, '250条/页'], [500, '500条/页']]
						}),
				valueField : 'value',
				displayField : 'text',
				value : '250',
				editable : false,
				width : 85
			});
	var number = parseInt(pagesize_combo.getValue());
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

	var bbar = new Ext.PagingToolbar({
				pageSize : number,
				store : store,
				displayInfo : true,
				displayMsg : '显示{0}条到{1}条,共{2}条',
				plugins : new Ext.ux.ProgressBarPager(), // 分页进度条
				emptyMsg : "没有符合条件的记录",
				items : ['-', '&nbsp;&nbsp;', pagesize_combo]
			})

	var grid = new Ext.grid.GridPanel({
				title : '<span class="commoncss">表结构列表</span>',
				height : 510,
				store : store,
				region : 'center',
				autoExpandColumn : 'comments',
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				},
				stripeRows : true,
				frame : true,
				cm : cm,
				sm : sm,
				tbar : [{
							text : '生成标准代码(Domain | SQLMap)',
							iconCls : 'plugin_addIcon',
							handler : function() {
								codeWindow.show();
							}
						}, '-', {
							text : '设计业务SQL语句',
							iconCls : 'plugin_editIcon',
							handler : function() {
								codeWindow.show();
							}
						}, '->', new Ext.form.TextField({
									id : 'table_name',
									name : 'table_name',
									emptyText : '表名',
									enableKeyEvents : true,
									listeners : {
										specialkey : function(field, e) {
											if (e.getKey() == Ext.EventObject.ENTER) {
												queryCodeItem();
											}
										}
									},
									width : 130
								}), {
							text : '查询',
							iconCls : 'previewIcon',
							handler : function() {
								queryCodeItem();
							}
						}, '-', {
							text : '刷新',
							iconCls : 'arrow_refreshIcon',
							handler : function() {
								store.reload();
							}
						}],
				bbar : bbar
			});

	store.load({
				params : {
					start : 0,
					limit : bbar.pageSize
				}
			});

	/**
	 * 布局
	 */
	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [grid]
			});

	/**
	 * 根据条件查询表
	 */
	function queryCodeItem() {
		store.load({
					params : {
						start : 0,
						limit : bbar.pageSize,
						table_name : Ext.getCmp('table_name').getValue()
					}
				});
	}

	formPanel = new Ext.form.FormPanel({
				id : 'codeForm',
				name : 'codeForm',
				defaultType : 'textfield',
				labelAlign : 'right',
				labelWidth : 60,
				frame : false,
				bodyStyle : 'padding:5 5 0',
				items : [{
							fieldLabel : '对照字段',
							name : 'field',
							anchor : '100%',
							labelStyle : micolor,
							allowBlank : false
						}, {
							fieldLabel : '字段名',
							name : 'fieldname',
							anchor : '100%',
							labelStyle : micolor,
							allowBlank : false
						}, {
							xtype : 'numberfield',
							fieldLabel : '代码',
							name : 'code',
							anchor : '100%',
							labelStyle : micolor,
							allowBlank : false
						}, {
							fieldLabel : '代码描述',
							name : 'codedesc',
							anchor : '100%',
							labelStyle : micolor,
							allowBlank : false
						},{
							fieldLabel : '备注',
							name : 'remark',
							anchor : '100%',
							allowBlank : true
						}]
			});

	codeWindow = new Ext.Window({
		layout : 'fit',
		width : 300,
		height : 260,
		resizable : false,
		draggable : true,
		closeAction : 'hide',
		title : '<span class="commoncss">生成标准代码(Domain | SQLMap)</span>',
		// iconCls : 'page_addIcon',
		modal : true,
		collapsible : true,
		titleCollapse : true,
		maximizable : false,
		buttonAlign : 'right',
		border : false,
		animCollapse : true,
		animateTarget : Ext.getBody(),
		constrain : true,
		items : [formPanel],
		buttons : [{
			text : '保存',
			iconCls : 'acceptIcon',
			handler : function() {
				if (runMode == '0') {
					Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
					return;
				}
				if (codeWindow.getComponent('codeForm').form.isValid()) {
					codeWindow.getComponent('codeForm').form.submit({
						url : './codeGenerator.do?reqCode=generateCode',
						waitTitle : '提示',
						method : 'POST',
						waitMsg : '正在处理数据,请稍候...',
						success : function(form, action) {
						},
						failure : function(form, action) {
							Ext.MessageBox.alert('提示', '生成代码失败');
							codeWindow.getComponent('codeForm').form.reset();
						}
					});
				} else {
					// 表单验证失败
				}
			}
		}, {
			text : '关闭',
			iconCls : 'deleteIcon',
			handler : function() {
				codeWindow.hide();
			}
		}]
	});
});
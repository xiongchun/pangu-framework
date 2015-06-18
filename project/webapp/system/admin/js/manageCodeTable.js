/**
 * 字典管理
 * 
 * @author XiongChun
 * @since 2010-02-13
 */
Ext.onReady(function() {
	var sm = new Ext.grid.CheckboxSelectionModel();
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm, {
				header : '对照字段',
				dataIndex : 'field',
				sortable : true,
				width : 130
			}, {
				header : '字段名',
				dataIndex : 'fieldname'
			}, {
				header : '代码',
				dataIndex : 'code',
				width : 50
			}, {
				header : '代码描述',
				dataIndex : 'codedesc'
			}, {
				header : '启用状态',
				dataIndex : 'enabled',
				renderer : ENABLEDRender
			}, {
				header : '编辑模式',
				dataIndex : 'editmode',
				renderer : EDITMODERender
			}, {
				header : '字段编号',
				dataIndex : 'codeid',
				hidden : false,
				width : 80,
				sortable : true
			}, {
				header : '备注',
				dataIndex : 'remark',
				id : 'remark'
			}]);

	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : './resource.do?reqCode=queryCodeItems'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'TOTALCOUNT',
							root : 'ROOT'
						}, [{
									name : 'codeid'
								}, {
									name : 'field'
								}, {
									name : 'fieldname'
								}, {
									name : 'code'
								}, {
									name : 'codedesc'
								}, {
									name : 'enabled'
								}, {
									name : 'editmode'
								}, {
									name : 'remark'
								}])
			});

	// 翻页排序时带上查询条件
	store.on('beforeload', function() {
				this.baseParams = {
					queryParam : Ext.getCmp('queryParam').getValue()
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
				value : '50',
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
				title : '<span class="commoncss">字典数据列表</span>',
				height : 510,
				store : store,
				region : 'center',
				margins : '3 3 3 3',
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				},
				stripeRows : true,
				frame : true,
				autoExpandColumn : 'remark',
				cm : cm,
				sm : sm,
				tbar : [{
							text : '新增',
							iconCls : 'page_addIcon',
							handler : function() {
								codeWindow.show();
							}
						}, '-', {
							text : '修改',
							iconCls : 'page_edit_1Icon',
							handler : function() {
								ininEditCodeWindow();
							}
						}, '-', {
							text : '删除',
							iconCls : 'page_delIcon',
							handler : function() {
								deleteCodeItems();
							}
						}, '-', {
							text : '内存同步',
							iconCls : 'arrow_refreshIcon',
							handler : function() {
								synMemory('要对字典数据进行内存同步操作吗?', '1');
							}
						}, '-', '提示:维护字典后必须执行内存同步', '->',
						new Ext.form.TextField({
									id : 'queryParam',
									name : 'queryParam',
									emptyText : '字段|字段名|代码描述',
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

	grid.addListener('rowdblclick', ininEditCodeWindow);
	grid.on('sortchange', function() {
				// grid.getSelectionModel().selectFirstRow();
			});

	bbar.on("change", function() {
				// grid.getSelectionModel().selectFirstRow();
			});
	/**
	 * 新增代码对照表
	 */
	var codeWindow;
	var formPanel;
	var enabledCombo = new Ext.form.ComboBox({
				name : 'enabled',
				hiddenName : 'enabled',
				store : ENABLEDStore,
				mode : 'local',
				triggerAction : 'all',
				valueField : 'value',
				displayField : 'text',
				value : '1',
				fieldLabel : '启用状态',
				emptyText : '请选择...',
				labelStyle : micolor,
				allowBlank : false,
				forceSelection : true,
				editable : false,
				typeAhead : true,
				anchor : '100%'
			});

	var editmodeCombo = new Ext.form.ComboBox({
				name : 'editmode',
				hiddenName : 'editmode',
				typeAhead : true,
				triggerAction : 'all',
				lazyRender : true,
				mode : 'local',
				store : EDITMODEStore,
				valueField : 'value',
				displayField : 'text',
				anchor : '100%',
				value : '1',
				editable : false,
				labelStyle : micolor,
				emptyText : '请选择...',
				fieldLabel : '编辑模式'
			});

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
						}, enabledCombo, editmodeCombo, {
							fieldLabel : '备注',
							name : 'remark',
							anchor : '100%',
							allowBlank : true
						}]
			});

	codeWindow = new Ext.Window({
		layout : 'fit',
		width : 300,
		height : 273,
		resizable : false,
		draggable : true,
		closeAction : 'hide',
		title : '<span class="commoncss">新增字典</span>',
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
						url : './resource.do?reqCode=saveCodeItem',
						waitTitle : '提示',
						method : 'POST',
						waitMsg : '正在处理数据,请稍候...',
						success : function(form, action) {
							store.reload();
							Ext.Msg.confirm('请确认', '代码对照新增成功,您要继续添加代码对照吗?',
									function(btn, text) {
										if (btn == 'yes') {
											codeWindow.getComponent('codeForm').form
													.reset();
										} else {
											codeWindow.hide();
											synMemory('要立即进行内存同步吗？');
										}
									});
						},
						failure : function(form, action) {
							var msg = action.result.msg;
							Ext.MessageBox.alert('提示', '代码对照表保存失败:<br>' + msg);
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

	/** *****************修改代码对照*********************** */
	var enabledCombo_E = new Ext.form.ComboBox({
				name : 'enabled',
				hiddenName : 'enabled',
				store : ENABLEDStore,
				mode : 'local',
				triggerAction : 'all',
				valueField : 'value',
				displayField : 'text',
				value : '1',
				fieldLabel : '启用状态',
				emptyText : '请选择...',
				labelStyle : micolor,
				allowBlank : false,
				forceSelection : true,
				editable : false,
				typeAhead : true,
				anchor : '100%'
			});

	var editmodeCombo_E = new Ext.form.ComboBox({
				name : 'editmode',
				hiddenName : 'editmode',
				typeAhead : true,
				triggerAction : 'all',
				lazyRender : true,
				disabled : true,
				fieldClass : 'x-custom-field-disabled',
				mode : 'local',
				labelStyle : micolor,
				store : EDITMODEStore,
				valueField : 'value',
				displayField : 'text',
				anchor : '100%',
				value : '1',
				editable : false,
				emptyText : '请选择...',
				fieldLabel : '编辑模式'
			});

	var editCodeWindow, editCodeFormPanel;
	editCodeFormPanel = new Ext.form.FormPanel({
				labelAlign : 'right',
				labelWidth : 60,
				defaultType : 'textfield',
				frame : false,
				bodyStyle : 'padding:5 5 0',
				id : 'editCodeFormPanel',
				name : 'editCodeFormPanel',
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
						}, enabledCombo_E, editmodeCombo_E, {
							fieldLabel : '备注',
							name : 'remark',
							anchor : '100%',
							allowBlank : true
						}, {
							fieldLabel : '代码编号',
							name : 'codeid',
							anchor : '100%',
							hidden : true,
							hideLabel : true
						}]
			});

	editCodeWindow = new Ext.Window({
				layout : 'fit',
				width : 300,
				height : 273,
				resizable : false,
				draggable : true,
				closeAction : 'hide',
				title : '<span class="commoncss">修改字典</span>',
				modal : true,
				collapsible : true,
				titleCollapse : true,
				maximizable : false,
				buttonAlign : 'right',
				border : false,
				animCollapse : true,
				animateTarget : Ext.getBody(),
				constrain : true,
				items : [editCodeFormPanel],
				buttons : [{
					text : '保存',
					iconCls : 'acceptIcon',
					handler : function() {
						if (runMode == '0') {
							Ext.Msg.alert('提示',
									'系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						}
						updateCodeItem();
					}
				}, {
					text : '关闭',
					iconCls : 'deleteIcon',
					handler : function() {
						editCodeWindow.hide();
					}
				}]

			});
	/**
	 * 布局
	 */
	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [grid]
			});

	/**
	 * 初始化代码修改出口
	 */
	function ininEditCodeWindow() {
		var record = grid.getSelectionModel().getSelected();
		if (Ext.isEmpty(record)) {
			Ext.Msg.alert('提示', '请先选中要修改的项目');
			return;
		}
		record = grid.getSelectionModel().getSelected();
		if (record.get('editmode') == '0') {
			Ext.Msg.alert('提示', '您选中的记录为系统内置的代码对照,不允许修改');
			return;
		}
		editCodeWindow.show();
		editCodeFormPanel.getForm().loadRecord(record);
	}

	/**
	 * 修改字典
	 */
	function updateCodeItem() {
		if (!editCodeFormPanel.form.isValid()) {
			return;
		}
		editCodeFormPanel.form.submit({
					url : './resource.do?reqCode=updateCodeItem',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) {
						editCodeWindow.hide();
						store.reload();
						synMemory('字典修改成功,要立即进行内存同步吗？');
					},
					failure : function(form, action) {
						var msg = action.result.msg;
						Ext.MessageBox.alert('提示', '代码对照表保存失败:<br>' + msg);
					}
				});
	}

	/**
	 * 内存同步
	 */
	function synMemory(msg, flag) {
		Ext.Msg.confirm('请确认', msg, function(btn, text) {
					if (btn == 'yes') {
						showWaitMsg();
						Ext.Ajax.request({
									url : 'resource.do?reqCode=synMemory',
									success : function(response) {
										if (flag == '1') {
											store.reload();
										}
										var resultArray = Ext.util.JSON
												.decode(response.responseText);
										Ext.Msg.alert('提示', resultArray.msg);
									},
									failure : function(response) {
										Ext.Msg.alert('提示', '内存同步失败');
									}
								});
					}
				});
	}

	/**
	 * 删除代码对照
	 */
	function deleteCodeItems() {
		if (runMode == '0') {
			Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
			return;
		}
		var rows = grid.getSelectionModel().getSelections();
		var fields = '';
		for (var i = 0; i < rows.length; i++) {
			if (rows[i].get('editmode') == '0') {
				fields = fields + rows[i].get('fieldname') + '->'
						+ rows[i].get('codedesc') + '<br>';
			}
		}
		if (fields != '') {
			Ext.Msg.alert('提示', '<b>您选中的项目中包含如下系统内置的只读项目</b><br>' + fields
							+ '<font color=red>只读项目不能删除!</font>');
			return;
		}
		if (Ext.isEmpty(rows)) {
			Ext.Msg.alert('提示', '请先选中要删除的项目!');
			return;
		}
		var strChecked = jsArray2JsString(rows, 'codeid');
		Ext.Msg.confirm('请确认', '你真的要删除字典吗?', function(btn, text) {
					if (btn == 'yes') {
						showWaitMsg();
							Ext.Ajax.request({
										url : './resource.do?reqCode=deleteCodeItem',
										success : function(response) {
											store.reload();
											synMemory('字典删除成功,要立即进行内存同步吗？');
										},
										failure : function(response) {
											var resultArray = Ext.util.JSON
													.decode(response.responseText);
											Ext.Msg.alert('提示', resultArray.msg);
										},
										params : {
											strChecked : strChecked
										}
									});
					}
				});
	}

	/**
	 * 根据条件查询字典
	 */
	function queryCodeItem() {
		store.load({
					params : {
						start : 0,
						limit : bbar.pageSize,
						queryParam : Ext.getCmp('queryParam').getValue()
					}
				});
	}

	/**
	 * 刷新字典
	 */
	function refreshCodeTable() {
		store.load({
					params : {
						start : 0,
						limit : bbar.pageSize
					}
				});
	}
});
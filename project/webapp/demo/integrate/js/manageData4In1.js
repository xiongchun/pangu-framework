/**
 * 综合实例：数据维护(四合一)
 * 
 * @author XiongChun
 * @since 2010-11-20
 */
Ext.onReady(function() {
	var qForm = new Ext.form.FormPanel({
				region : 'north',
				margins : '3 3 3 3',
				title : '<span class="commoncss">查询条件<span>',
				collapsible : true,
				border : true,
				labelWidth : 50, // 标签宽度
				// frame : true, //是否渲染表单面板背景色
				labelAlign : 'right', // 标签对齐方式
				bodyStyle : 'padding:3 5 0', // 表单元素和表单面板的边距
				buttonAlign : 'center',
				height : 125,
				items : [{
					layout : 'column',
					border : false,
					items : [{
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											fieldLabel : '项目ID',
											name : 'xmid',
											id : 'id_txt_xmid',
											xtype : 'numberfield', // 设置为数字输入框类型
											anchor : '100%'
										}]
							}, {
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											fieldLabel : '项目名称', // 标签
											id : 'xmmc',
											name : 'xmmc', // name:后台根据此name属性取值
											allowBlank : true, // 是否允许为空
											maxLength : 50, // 可输入的最大文本长度,不区分中英文字符
											anchor : '100%' // 宽度百分比
										}]
							}, {
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [new Ext.form.ComboBox({
											hiddenName : 'sfdlbm',
											fieldLabel : '项目大类',
											emptyText : '请选择',
											triggerAction : 'all',
											store : new Ext.data.SimpleStore({
														fields : ['name',
																'code'],
														data : [['西药', '01'],
																['中成药', '02']]
													}),
											displayField : 'name',
											valueField : 'code',
											mode : 'local',
											forceSelection : false, // 选中内容必须为下拉列表的子项
											editable : false,
											typeAhead : true,
											// value:'0002',
											resizable : true,
											anchor : '100%'
										})]
							}]
				}, {
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .33,
						layout : 'form',
						labelWidth : 60, // 标签宽度
						defaultType : 'textfield',
						border : false,
						items : [new Ext.form.ComboBox({
									hiddenName : 'jx',
									fieldLabel : '剂型',
									triggerAction : 'all',
									emptyText : '请选择',
									store : new Ext.data.SimpleStore({
												fields : ['name', 'code'],
												data : [['注射剂', '注射剂'],
														['乳膏', '乳膏'],
														['片剂', '片剂']]
											}),
									displayField : 'name',
									valueField : 'code',
									mode : 'local',
									forceSelection : false, // 选中内容必须为下拉列表的子项
									editable : false,
									typeAhead : true,
									resizable : true,
									anchor : '100%'
								})]
					}, {
						columnWidth : .67,
						layout : 'form',
						labelWidth : 60, // 标签宽度
						defaultType : 'textfield',
						border : false,
						items : [{
									fieldLabel : '产地',
									name : 'cd',
									maxLength : 50,
									xtype : 'textfield',
									anchor : '99%'
								}]
					}]
				}],
				buttons : [{
							text : '查询',
							iconCls : 'previewIcon',
							handler : function() {
								Ext.getCmp('tbi_edit').disable();
								Ext.getCmp('tbi_del').disable();
								querySfxmDatas();
							}
						}, {
							text : '打印',
							id : 'id_btn_print',
							iconCls : 'printerIcon',
							handler : function() {
								printCatalog1();
							}
						}, {
							text : '重置',
							iconCls : 'tbar_synchronizeIcon',
							handler : function() {
								qForm.getForm().reset();
							}
						}]
			});

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
		header : '大类',
		dataIndex : 'sfdlbm',
		hidden : true, // 隐藏列
		sortable : true,
		width : 50
			// 列宽
		}, {
		header : '项目名称',
		dataIndex : 'xmmc',
		sortable : true
	}, {
		header : '项目热键',
		dataIndex : 'xmrj'
	}, {
		header : '报销比例',
		dataIndex : 'zfbl'
	}, {
		header : '规格',
		dataIndex : 'gg'
	}, {
		header : '单位',
		dataIndex : 'dw',
		width : 60
	}, {
		header : '启用状态',
		dataIndex : 'qybz',
		// 演示render的用法(代码转换,该render由<G4Studio:ext.codeRender/>标签生成)
		renderer : QYBZRender,
		width : 60
	}, {
		header : '剂型',
		dataIndex : 'jx',
		width : 60
	}, {
		header : '产地',
		dataIndex : 'cd',
		width : 200
	}, {
		header : '医院编码',
		dataIndex : 'yybm'
	}, {
		header : '更改时间',
		dataIndex : 'ggsj'
	}]);

	/**
	 * 数据存储
	 */
	var store = new Ext.data.Store({
				// 获取数据的方式
				proxy : new Ext.data.HttpProxy({
							url : 'integrateDemo.do?reqCode=querySfxmDatas'
						}),
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
									name : 'jx'
								}, {
									name : 'cd'
								}, {
									name : 'yybm'
								}, {
									name : 'ggsj'
								}, {
									name : 'zfbl'
								}])
			});

	/**
	 * 翻页排序时候的参数传递
	 */
	// 翻页排序时带上查询条件
	store.on('beforeload', function() {
				this.baseParams = qForm.getForm().getValues();
			});
	// 每页显示条数下拉选择框
	var pagesize_combo = new Ext.form.ComboBox({
				name : 'pagesize',
				triggerAction : 'all',
				mode : 'local',
				store : new Ext.data.ArrayStore({
							fields : ['value', 'text'],
							data : [[10, '10条/页'], [20, '20条/页'],
									[50, '50条/页'], [100, '100条/页'],
									[250, '250条/页'], [500, '500条/页']]
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
							text : '新增',
							iconCls : 'addIcon',
							id : 'id_tbi_add',
							handler : function() {
								addCatalogItem();
							}
						}, {
							text : '修改',
							id : 'tbi_edit',
							iconCls : 'edit1Icon',
							disabled : true,
							handler : function() {
								updateCatalogItem();
							}
						}, {
							text : '删除',
							id : 'tbi_del',
							iconCls : 'deleteIcon',
							disabled : true,
							handler : function() {
								deleteCatalogItem();
							}
						}, '->', {
							text : '刷新',
							iconCls : 'arrow_refreshIcon',
							handler : function() {
								store.reload();
							}
						}]
			});

	// 表格实例
	var grid = new Ext.grid.GridPanel({
				// 表格面板标题,默认为粗体，我不喜欢粗体，这里设置样式将其格式为正常字体
				title : '<span class="commoncss">医院收费项目</span>',
				height : 500,
				id : 'id_grid_sfxm',
				autoScroll : true,
				frame : true,
				region : 'center', // 和VIEWPORT布局模型对应，充当center区域布局
				margins : '3 3 3 3',
				store : store, // 数据存储
				stripeRows : true, // 斑马线
				cm : cm, // 列模型
				tbar : tbar, // 表格工具栏
				bbar : bbar,// 分页工具栏
				viewConfig : {
	// 不产横向生滚动条, 各列自动扩展自动压缩, 适用于列数比较少的情况
				// forceFit : true
				},
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				}
			});

	// 监听行选中事件
	grid.on('rowclick', function(pGrid, rowIndex, event) {
				Ext.getCmp('tbi_edit').enable();
				Ext.getCmp('tbi_del').enable();
			});

	grid.on('rowdblclick', function(grid, rowIndex, event) {
				updateCatalogItem();
			});

	var myForm = new Ext.form.FormPanel({
				collapsible : false,
				border : true,
				labelWidth : 60, // 标签宽度
				// frame : true, //是否渲染表单面板背景色
				labelAlign : 'right', // 标签对齐方式
				bodyStyle : 'padding:5 5 0', // 表单元素和表单面板的边距
				buttonAlign : 'center',
				height : 250,
				items : [{
					layout : 'column',
					border : false,
					items : [{
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											fieldLabel : '项目ID',
											name : 'xmid',
											disabled : true,
											fieldClass : 'x-custom-field-disabled',
											xtype : 'textfield', // 设置为数字输入框类型
											anchor : '100%'
										}, {
											fieldLabel : '项目热键',
											name : 'xmrj',
											maxLength : 20,
											anchor : '100%'
										}, {
											fieldLabel : '报销比例',
											name : 'zfbl',
											maxValue : 1,
											decimalPrecision : 2,// 小数精度
											allowBlank : false,
											xtype : 'numberfield',
											labelStyle : 'color:blue;',
											anchor : '100%'
										}]
							}, {
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											fieldLabel : '项目名称', // 标签
											name : 'xmmc', // name:后台根据此name属性取值
											maxLength : 20, // 可输入的最大文本长度,不区分中英文字符
											allowBlank : false,
											labelStyle : 'color:blue;',
											anchor : '100%'// 宽度百分比
										}, {
											fieldLabel : '规格',
											name : 'gg',
											xtype : 'textfield', // 设置为文字输入框类型
											maxLength : 25,
											anchor : '100%'
										}, new Ext.form.ComboBox({
													hiddenName : 'jx',
													fieldLabel : '剂型',
													triggerAction : 'all',
													emptyText : '请选择',
													store : new Ext.data.SimpleStore(
															{
																fields : [
																		'name',
																		'code'],
																data : [
																		['注射剂',
																				'注射剂'],
																		['乳膏',
																				'乳膏'],
																		['片剂',
																				'片剂']]
															}),
													displayField : 'name',
													valueField : 'code',
													mode : 'local',
													forceSelection : false, // 选中内容必须为下拉列表的子项
													editable : false,
													typeAhead : true,
													resizable : true,
													allowBlank : false,
													anchor : '100%'
												})]
							}, {
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [new Ext.form.ComboBox({
											hiddenName : 'sfdlbm',
											fieldLabel : '项目大类',
											emptyText : '请选择',
											triggerAction : 'all',
											store : new Ext.data.SimpleStore({
														fields : ['name',
																'code'],
														data : [['西药', '01'],
																['中成药', '02']]
													}),
											displayField : 'name',
											valueField : 'code',
											mode : 'local',
											forceSelection : false, // 选中内容必须为下拉列表的子项
											editable : false,
											typeAhead : true,
											// value:'0002',
											resizable : true,
											allowBlank : false,
											labelStyle : 'color:blue;',
											anchor : '100%'
										}), new Ext.form.ComboBox({
											hiddenName : 'dw',
											fieldLabel : '单位',
											emptyText : '请选择',
											triggerAction : 'all',
											store : new Ext.data.SimpleStore({
														fields : ['name',
																'code'],
														data : [['瓶', '瓶'],
																['盒', '盒']]
													}),
											displayField : 'name',
											valueField : 'code',
											mode : 'local',
											forceSelection : false, // 选中内容必须为下拉列表的子项
											editable : false,
											typeAhead : true,
											// value:'0002',
											resizable : true,
											allowBlank : false,
											labelStyle : 'color:blue;',
											anchor : '100%'
										}), new Ext.form.ComboBox({
											hiddenName : 'qybz',
											fieldLabel : '启用标志',
											triggerAction : 'all',
											store : new Ext.data.SimpleStore({
														fields : ['name',
																'code'],
														data : [['启用', '1'],
																['停用', '0']]
													}),
											displayField : 'name',
											valueField : 'code',
											mode : 'local',
											forceSelection : false, // 选中内容必须为下拉列表的子项
											editable : false,
											typeAhead : true,
											value : '1',
											resizable : true,
											allowBlank : false,
											labelStyle : 'color:blue;',
											anchor : '100%'
										})]
							}]
				}, {
					layout : 'column',
					border : false,
					items : [{
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											xtype : 'datefield',
											fieldLabel : '生效时间', // 标签
											name : 'ggsj', // name:后台根据此name属性取值
											format : 'Y-m-d', // 日期格式化
											value : new Date(),
											anchor : '100%' // 宽度百分比
										}]
							}, {
								columnWidth : .67,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											fieldLabel : '产地',
											name : 'cd',
											maxLength : 50,
											anchor : '99%'
										}]
							}]
				}, {
					fieldLabel : '备注',
					name : 'remark',
					xtype : 'textarea',
					maxLength : 100,
					emptyText : '备注信息.(说明:此字段仅用来演示表单跨列布局,数据不进行持久化)',
					anchor : '99%'
				}]
			});

	var firstWindow = new Ext.Window({
				title : '<span class="commoncss">录入医院收费项目<span>', // 窗口标题
				layout : 'fit', // 设置窗口布局模式
				width : 600, // 窗口宽度
				height : 260, // 窗口高度
				closable : false, // 是否可关闭
				collapsible : true, // 是否可收缩
				maximizable : true, // 设置是否可以最大化
				border : false, // 边框线设置
				constrain : true, // 设置窗口是否可以溢出父容器
				animateTarget : Ext.getBody(),
				pageY : 20, // 页面定位Y坐标
				pageX : document.body.clientWidth / 2 - 600 / 2, // 页面定位X坐标
				items : [myForm], // 嵌入的表单面板
				buttons : [{
							text : '保存1',
							iconCls : 'acceptIcon',
							handler : function() {
								submitTheForm();
							}
						}, {
							text : '保存2(batch批处理)',
							iconCls : 'acceptIcon',
							handler : function() {
								submitTheFormBasedBatch();
							}
						}, {
							text : '重置',
							iconCls : 'tbar_synchronizeIcon',
							handler : function() {
								myForm.getForm().reset();
							}
						}, {
							text : '关闭',
							iconCls : 'deleteIcon',
							handler : function() {
								firstWindow.hide();
							}
						}]
			});

	var updateForm = new Ext.form.FormPanel({
				collapsible : false,
				border : true,
				labelWidth : 60, // 标签宽度
				// frame : true, //是否渲染表单面板背景色
				labelAlign : 'right', // 标签对齐方式
				bodyStyle : 'padding:5 5 0', // 表单元素和表单面板的边距
				buttonAlign : 'center',
				height : 250,
				items : [{
					layout : 'column',
					border : false,
					items : [{
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											fieldLabel : '项目ID',
											name : 'xmid',
											readOnly : true,
											fieldClass : 'x-custom-field-disabled',
											xtype : 'textfield', // 设置为数字输入框类型
											anchor : '100%'
										}, {
											fieldLabel : '项目热键',
											name : 'xmrj',
											maxLength : 20,
											anchor : '100%'
										}, {
											fieldLabel : '报销比例',
											name : 'zfbl',
											maxValue : 1,
											decimalPrecision : 2,// 小数精度
											allowBlank : false,
											xtype : 'numberfield',
											labelStyle : 'color:blue;',
											anchor : '100%'
										}]
							}, {
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											fieldLabel : '项目名称', // 标签
											name : 'xmmc', // name:后台根据此name属性取值
											maxLength : 20, // 可输入的最大文本长度,不区分中英文字符
											allowBlank : false,
											labelStyle : 'color:blue;',
											anchor : '100%'// 宽度百分比
										}, {
											fieldLabel : '规格',
											name : 'gg',
											xtype : 'textfield', // 设置为文字输入框类型
											maxLength : 25,
											anchor : '100%'
										}, new Ext.form.ComboBox({
													hiddenName : 'jx',
													fieldLabel : '剂型',
													triggerAction : 'all',
													emptyText : '请选择',
													store : new Ext.data.SimpleStore(
															{
																fields : [
																		'name',
																		'code'],
																data : [
																		['注射剂',
																				'注射剂'],
																		['乳膏',
																				'乳膏'],
																		['片剂',
																				'片剂']]
															}),
													displayField : 'name',
													valueField : 'code',
													mode : 'local',
													forceSelection : false, // 选中内容必须为下拉列表的子项
													editable : false,
													typeAhead : true,
													resizable : true,
													allowBlank : false,
													anchor : '100%'
												})]
							}, {
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [new Ext.form.ComboBox({
											hiddenName : 'sfdlbm',
											fieldLabel : '项目大类',
											emptyText : '请选择',
											triggerAction : 'all',
											store : new Ext.data.SimpleStore({
														fields : ['name',
																'code'],
														data : [['西药', '01'],
																['中成药', '02']]
													}),
											displayField : 'name',
											valueField : 'code',
											mode : 'local',
											forceSelection : false, // 选中内容必须为下拉列表的子项
											editable : false,
											typeAhead : true,
											// value:'0002',
											resizable : true,
											allowBlank : false,
											labelStyle : 'color:blue;',
											anchor : '100%'
										}), new Ext.form.ComboBox({
											hiddenName : 'dw',
											fieldLabel : '单位',
											emptyText : '请选择',
											triggerAction : 'all',
											store : new Ext.data.SimpleStore({
														fields : ['name',
																'code'],
														data : [['瓶', '瓶'],
																['盒', '盒']]
													}),
											displayField : 'name',
											valueField : 'code',
											mode : 'local',
											forceSelection : false, // 选中内容必须为下拉列表的子项
											editable : false,
											typeAhead : true,
											// value:'0002',
											resizable : true,
											allowBlank : false,
											labelStyle : 'color:blue;',
											anchor : '100%'
										}), new Ext.form.ComboBox({
											hiddenName : 'qybz',
											fieldLabel : '启用标志',
											triggerAction : 'all',
											store : new Ext.data.SimpleStore({
														fields : ['name',
																'code'],
														data : [['启用', '1'],
																['停用', '0']]
													}),
											displayField : 'name',
											valueField : 'code',
											mode : 'local',
											forceSelection : false, // 选中内容必须为下拉列表的子项
											editable : false,
											typeAhead : true,
											value : '1',
											resizable : true,
											allowBlank : false,
											labelStyle : 'color:blue;',
											anchor : '100%'
										})]
							}]
				}, {
					layout : 'column',
					border : false,
					items : [{
								columnWidth : .33,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											xtype : 'datefield',
											fieldLabel : '生效时间', // 标签
											name : 'ggsj', // name:后台根据此name属性取值
											format : 'Y-m-d', // 日期格式化
											value : new Date(),
											anchor : '100%' // 宽度百分比
										}]
							}, {
								columnWidth : .67,
								layout : 'form',
								labelWidth : 60, // 标签宽度
								defaultType : 'textfield',
								border : false,
								items : [{
											fieldLabel : '产地',
											name : 'cd',
											maxLength : 50,
											anchor : '99%'
										}]
							}]
				}, {
					fieldLabel : '备注',
					name : 'remark',
					xtype : 'textarea',
					maxLength : 100,
					emptyText : '备注信息.(说明:此字段仅用来演示表单跨列布局,数据不进行持久化)',
					anchor : '99%'
				}]
			});

	var updateWindow = new Ext.Window({
				title : '<span class="commoncss">修改医院收费项目<span>', // 窗口标题
				layout : 'fit', // 设置窗口布局模式
				width : 600, // 窗口宽度
				height : 260, // 窗口高度
				closable : false, // 是否可关闭
				collapsible : true, // 是否可收缩
				maximizable : true, // 设置是否可以最大化
				border : false, // 边框线设置
				constrain : true, // 设置窗口是否可以溢出父容器
				animateTarget : Ext.getBody(),
				pageY : 20, // 页面定位Y坐标
				pageX : document.body.clientWidth / 2 - 600 / 2, // 页面定位X坐标
				items : [updateForm], // 嵌入的表单面板
				buttons : [{
							text : '保存',
							iconCls : 'acceptIcon',
							handler : function() {
								updateTheForm();
							}
						}, {
							text : '关闭',
							iconCls : 'deleteIcon',
							handler : function() {
								updateWindow.hide();
							}
						}]
			});

	// 布局
	// 如果把form作为center区域的话,其Height属性将失效。
	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [qForm, grid]
			});

	/**
	 * 查询项目列表
	 */
	function querySfxmDatas() {
		var params = qForm.getForm().getValues();
		params.start = 0;
		params.limit = bbar.pageSize;
		store.load({
					params : params
				});
	}

	/**
	 * 表单提交(表单自带Ajax提交)
	 */
	function submitTheForm() {
		if (!myForm.getForm().isValid())
			return;
		myForm.form.submit({
					url : 'integrateDemo.do?reqCode=updateSfxm',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) { // 回调函数有2个参数
						Ext.MessageBox.alert('提示', action.result.msg);
					},
					failure : function(form, action) {
						Ext.Msg
								.alert('提示', '数据查询失败,错误类型:'
												+ action.failureType);
					}
				});
	}

	/**
	 * 表单提交(以Batch方式批量执行SQL语句)
	 */
	function submitTheFormBasedBatch() {
		if (!myForm.getForm().isValid())
			return;
		if (runMode == '0') {
			Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
			return;
		}
		myForm.form.submit({
					url : 'integrateDemo.do?reqCode=batchSql',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) {
						Ext.MessageBox.alert('提示', action.result.msg);
					},
					failure : function(form, action) {
						Ext.Msg
								.alert('提示', '数据查询失败,错误类型:'
												+ action.failureType);
					}
				});
	}

	/**
	 * 新增项目
	 */
	function addCatalogItem() {
		firstWindow.show(); // 显示窗口
	}

	/**
	 * 表单提交(表单自带Ajax提交)
	 */
	function submitTheForm() {
		if (!myForm.getForm().isValid())
			return;
		myForm.form.submit({
					url : 'integrateDemo.do?reqCode=saveSfxmDomain',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) { // 回调函数有2个参数
						// Ext.MessageBox.alert('提示',
						// action.result.msg);
						var items = myForm.find('name', 'xmid');
						items[0].setValue(action.result.xmid);
						Ext.Msg.confirm('请确认', '新增成功,您要继续新增收费项目吗?', function(
										btn, text) {
									if (btn == 'yes') {
										myForm.getForm().reset();
									} else {
										firstWindow.hide();
										store.reload();
										//querySfxmDatas();
									}
								});
					},
					failure : function(form, action) {
						Ext.MessageBox.alert('提示', '数据保存失败');
					}
				});
	}

	/**
	 * 修改项目
	 */
	function updateCatalogItem() {
		var record = grid.getSelectionModel().getSelected();
		if (Ext.isEmpty(record)) {
			Ext.Msg.alert('提示:', '请先选中项目');
			return;
		}
		updateForm.getForm().loadRecord(record);
		updateWindow.show(); // 显示窗口
	}

	/**
	 * 表单提交(表单自带Ajax提交)
	 */
	function updateTheForm() {
		if (!updateForm.getForm().isValid())
			return;
		updateForm.form.submit({
					url : 'integrateDemo.do?reqCode=updateSfxm',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) { // 回调函数有2个参数
						Ext.MessageBox.alert('提示', action.result.msg);
						updateWindow.hide();
						store.reload();
					},
					failure : function(form, action) {
						Ext.Msg
								.alert('提示', '数据保存失败,错误类型:'
												+ action.failureType);
					}
				});
	}

	/**
	 * 删除项目
	 */
	function deleteCatalogItem() {
		var record = grid.getSelectionModel().getSelected();
		if (Ext.isEmpty(record)) {
			Ext.Msg.alert('提示:', '请先选中项目');
			return;
		}
		Ext.MessageBox.confirm('请确认', '确认删除吗?', function(btn, text) {
					if (btn == 'yes') {
						if (runMode == '0') {
							Ext.Msg.alert('提示',
									'系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						}
						showWaitMsg();
						Ext.Ajax.request({
									url : 'integrateDemo.do?reqCode=deleteSfxm',
									success : function(response) { // 回调函数有1个参数
										var resultArray = Ext.util.JSON
												.decode(response.responseText);
										Ext.Msg.alert('提示', resultArray.msg);
										store.reload();
									},
									failure : function(response) {
										Ext.MessageBox.alert('提示', '数删除失败');
									},
									params : {
										xmid : record.data.xmid
									}
								});
					}
				})
	}

	/**
	 * 打印一
	 */
	function printCatalog1() {
		showWaitMsg('正在准备报表数据,请稍等...');
		Ext.Ajax.request({
					url : 'integrateDemo.do?reqCode=buildReportDataObject',
					success : function(response) {
						hideWaitMsg();
						doPrint('hisCatalogReport4App');
					},
					failure : function(response) {
						hideWaitMsg();
						Ext.Msg.alert('提示', "准备报表数据对象发生错误,请检查!");
					}
				});
	}
	
	function callTuxedo(){
		Ext.Ajax.request({
			url : 'integrateDemo.do?reqCode=callTuxedo',
			success : function(response) { // 回调函数有1个参数
				var resultArray = Ext.util.JSON
						.decode(response.responseText);
				Ext.Msg.alert('提示', resultArray.msg);
			},
			failure : function(response) {
				Ext.MessageBox.alert('提示', '调用失败');
			},
			params : {
				par1 : '001'
			}
		});
	}

});
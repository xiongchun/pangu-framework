/**
 * Excel导入
 * 
 * @author XiongChun
 * @since 2010-08-20
 */
Ext.onReady(function() {
			var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
						header : '项目ID',
						dataIndex : 'xmid',
						sortable : true
					}, {
						header : '大类',
						dataIndex : 'sfdlbm',
						hidden : true,
						width : 50
					}, {
						header : '项目名称',
						dataIndex : 'xmmc',
						width : 200
					}, {
						header : '项目热键',
						dataIndex : 'xmrj'
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
						hidden : true,
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
						dataIndex : 'yybm',
						hidden : true
					}, {
						header : '更改时间',
						dataIndex : 'ggsj'
					}, {
						id : '_blank',
						header : '',
						dataIndex : '_blank'
					}]);

			/**
			 * 数据存储
			 */
			var store = new Ext.data.Store({
						proxy : new Ext.data.HttpProxy({
									url : 'excelReportDemo.do?reqCode=queryCatalogs4Import'
								}),
						reader : new Ext.data.JsonReader({
									totalProperty : 'TOTALCOUNT',
									root : 'ROOT'
								}, [{
											name : 'xmid'
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
										}])
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
									data : [[10, '10条/页'], [20, '20条/页'], [50, '50条/页'], [100, '100条/页'], [250, '250条/页'], [500, '500条/页']]
								}),
						valueField : 'value',
						displayField : 'text',
						value : '20',
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
						plugins : new Ext.ux.ProgressBarPager(), // 分页进度条						emptyMsg : "没有符合条件的记录",
						items : ['-', '&nbsp;&nbsp;', pagesize_combo]
					});

			var grid = new Ext.grid.GridPanel({
						title : '<span class="commoncss">医院收费目录</span>',
						height : 500,
						// width:600,
						autoScroll : true,
						region : 'center',
						margins : '3 3 3 3',
						store : store,
						loadMask : {
							msg : '正在加载表格数据,请稍等...'
						},
						stripeRows : true,
						frame : true,
						autoExpandColumn : '_blank',
						cm : cm,
						tbar : [{
									text : '选择导入文件',
									iconCls : 'page_excelIcon',
									handler : function() {
										window.show();
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
			bbar.on("change", function() {
						grid.getSelectionModel().selectFirstRow();
					});
			var formpanel = new Ext.form.FormPanel({
						id : 'formpanel',
						name : 'formpanel',
						defaultType : 'textfield',
						labelAlign : 'right',
						labelWidth : 99,
						frame : true,
						fileUpload : true,
						items : [{
									fieldLabel : '请选择导入文件',
									name : 'theFile',
									id : 'theFile',
									inputType : 'file',
									allowBlank : true,
									anchor : '99%'
								}]
					});

			var window = new Ext.Window({
						layout : 'fit',
						width : 380,
						height : 100,
						resizable : false,
						draggable : true,
						closeAction : 'hide',
						title : '导入Excel',
						modal : false,
						collapsible : true,
						titleCollapse : true,
						maximizable : false,
						buttonAlign : 'right',
						border : false,
						animCollapse : true,
						animateTarget : Ext.getBody(),
						constrain : true,
						items : [formpanel],
						buttons : [{
									text : '导入',
									iconCls : 'acceptIcon',
									handler : function() {
										var theFile = Ext.getCmp('theFile').getValue();
										if (Ext.isEmpty(theFile)) {
											Ext.Msg.alert('提示', '请先选择您要导入的xls文件...');
											return;
										}
										if (theFile.substring(theFile.length - 4, theFile.length) != ".xls") {
											Ext.Msg.alert('提示', '您选择的文件格式不对,只能导入.xls文件!');
											return;
										}
										formpanel.form.submit({
													url : 'excelReportDemo.do?reqCode=importExcel',
													waitTitle : '提示',
													method : 'POST',
													waitMsg : '正在处理数据,请稍候...',
													success : function(form, action) {
														store.load({
																	params : {
																		start : 0,
																		limit : bbar.pageSize
																	}
																});
														window.hide();
														// Ext.MessageBox.alert('提示',
														// action.result.msg);
										
													},
													failure : function(form, action) {
														var msg = action.result.msg;
														Ext.MessageBox.alert('提示', '参数数据保存失败:<br>' + msg);
													}
												});

									}
								}, {
									text : '关闭',
									id : 'btnReset',
									iconCls : 'deleteIcon',
									handler : function() {
										window.hide();
									}
								}]
					});

			window.show();
			/**
			 * 布局
			 */
			var viewport = new Ext.Viewport({
						layout : 'border',
						items : [grid]
					});

			/**
			 * 查询医院收费目录
			 */
			function queryCatalogItem() {
				store.load({
							params : {
								start : 0,
								limit : bbar.pageSize
							}
						});
			}

		});
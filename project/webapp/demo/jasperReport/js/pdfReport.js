/**
 * PDF报表打印导出
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
						header : '报销比例',
						dataIndex : 'zfbl',
						width : 80
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
						dataIndex : 'yybm'
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
									url : 'jasperReportDemo.do?reqCode=queryCatalogs4Print'
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
											name : 'zfbl'
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

			/**
			 * 翻页排序时候的参数传递
			 */
			store.on('beforeload', function() {
						this.baseParams = {
							xmmc : Ext.getCmp('xmmc').getValue()
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
						title : '<span class="commoncss">医院收费目录<font color=red>[请先确认允许浏览器弹出窗口,否则功能将失效]</font></span>',
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
						tbar : [new Ext.form.TextField({
											id : 'xmmc',
											name : 'xmmc',
											emptyText : '请输入项目名称',
											enableKeyEvents : true,
											listeners : {
												specialkey : function(field, e) {
													if (e.getKey() == Ext.EventObject.ENTER) {
														queryCatalogItem();
													}
												}
											},
											width : 150
										}), {
									text : '查询',
									iconCls : 'page_findIcon',
									handler : function() {
										queryCatalogItem();
									}
								}, '-', {
									text : '打印|导出(PDF)',
									iconCls : 'printerIcon',
									tooltip : '以弹出窗口嵌入PDF的方式实现报表展示和客户端打印\导出功能',
									handler : function() {
										exportCatalog1();
									}
								}, '-', {
									text : '打印|导出(PDF,支持回调函数)',
									iconCls : 'printerIcon',
									tooltip : '此种模式可以在回调函数里回写打印标志或者记录打印次数',
									handler : function() {
										exportCatalog2();
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
								limit : bbar.pageSize,
								xmmc : Ext.getCmp('xmmc').getValue()
							}
						});
			}

			/**
			 * 导出一
			 */
			function exportCatalog1() {
				showWaitMsg('正在准备报表数据,请稍等...');
				Ext.Ajax.request({
							url : 'jasperReportDemo.do?reqCode=buildReportDataObject',
							success : function(response) {
								hideWaitMsg();
								doExport('hisCatalogReport');
							},
							failure : function(response) {
								hideWaitMsg();
								Ext.Msg.alert('提示', "准备报表数据对象发生错误,请检查!");
							}
						});
			}

			/**
			 * 导出二(支持回调函数)
			 */
			function exportCatalog2() {
				showWaitMsg('正在准备报表数据,请稍等...');
				Ext.Ajax.request({
							url : 'jasperReportDemo.do?reqCode=buildReportDataObject',
							success : function(response) {
								hideWaitMsg();
								doExportWithCallback('hisCatalogReport');
							},
							failure : function(response) {
								hideWaitMsg();
								Ext.Msg.alert('提示', "准备报表数据对象发生错误,请检查!");
							}
						});
			}
		});

/**
 * 关闭PDF导出窗口的回调函数
 */
function fnExportCallback() {
	// 可以在此记录打印次数
	Ext.Msg.alert('提示', '窗口关闭了,可以在此事件的回调函数里记录打印/导出次数');
}
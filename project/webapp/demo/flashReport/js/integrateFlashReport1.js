/**
 * FlashReport报表综合实例(动态数据源|动态报表类型)
 */
Ext.onReady(function() {

			var rownum = new Ext.grid.RowNumberer({
						header : 'NO',
						width : 28
					});

			var cm = new Ext.grid.ColumnModel([rownum, {
						header : '月度',
						dataIndex : 'name',
						width : 80,
						sortable : false
					}, {
						header : '销售额(万元)',
						dataIndex : 'value',
						sortable : true
					}]);

			var store = new Ext.data.Store({
						proxy : new Ext.data.HttpProxy({
									url : 'flashReportDemo.do?reqCode=queryXsyjDatas'
								}),
						reader : new Ext.data.JsonReader({
									totalProperty : 'TOTALCOUNT',
									root : 'ROOT'
								}, [{
											name : 'name'
										}, {
											name : 'value'
										}])
					});

			var bbar = new Ext.PagingToolbar({
						pageSize : 100,
						store : store,
						displayInfo : true,
						displayMsg : '显示{0}条到{1}条,共{2}条',
						plugins : new Ext.ux.ProgressBarPager(),
						emptyMsg : "没有符合条件的记录",
						items : ['-', '&nbsp;&nbsp;']
					});

			var tbar = new Ext.Toolbar({
						items : ['<span class="commoncss">请选择产品类型:</span>',
								new Ext.form.ComboBox({
											id : 'idproduct',
											hiddenName : 'product',
											triggerAction : 'all',
											store : new Ext.data.SimpleStore({
														fields : ['value',
																'text'],
														data : [[1, '产品1'],
																[2, '产品2']]
													}),
											displayField : 'text',
											valueField : 'value',
											mode : 'local',
											forceSelection : true,
											typeAhead : true,
											value : '1',
											editable : false,
											resizable : true,
											width : 140
										})]
					});

			Ext.getCmp('idproduct').on('select', function(obj) {
						store.load({
									params : {
										product : obj.value,
										start : 0,
										limit : bbar.pageSize
									}
								});
						updateChart();
					});

			var grid = new Ext.grid.GridPanel({
						title : '<span style="font-weight:normal">销售业绩(表格展示)</span>',
						frame : true,
						width : 280,
						maxSize : 300,
						autoScroll : true,
						region : 'west',
						margins : '3 3 3 3',
						split : true,
						collapsible : true,
						store : store,
						stripeRows : true,
						cm : cm,
						tbar : tbar,
						bbar : bbar,
						viewConfig : {
			// forceFit : true
						},
						loadMask : {
							msg : '正在加载表格数据,请稍等...'
						}
					});

			store.on('beforeload', function() {
						this.baseParams = {
							product : Ext.getCmp('idproduct').getValue()
						};
					});

			store.load({
						params : {
							product : Ext.getCmp('idproduct').getValue(),
							start : 0,
							limit : bbar.pageSize
						}
					});

			var panel = new Ext.Panel({
						title : '<span style="font-weight:normal">销售业绩(图表展示)</span>',
						contentEl : 'my2DcChart_div',
						margins : '3 3 3 3',
						region : 'center'
					});

			var viewport = new Ext.Viewport({
						layout : 'border',
						items : [grid, panel]
					});

			function updateChart() {
				Ext.Ajax.request({
							url : 'flashReportDemo.do?reqCode=queryReportXmlDatas',
							success : function(response, opts) {
								var resultArray = Ext.util.JSON
										.decode(response.responseText);
								// Ext.Msg.alert('提示', resultArray.msg);
								var xmlstring = resultArray.xmlstring;
								updateChartXML('my2DcChart', xmlstring);
							},
							failure : function(response, opts) {
								Ext.MessageBox.alert('提示', '获取报表数据失败');
							},
							params : {
								product : Ext.getCmp('idproduct').getValue()
							}
						});
			}

		});
/**
 * Service切面监控
 * 
 * @author XiongChun
 * @since 2010-09-20
 */
Ext
		.onReady(function() {
			var expander = new Ext.grid.RowExpander(
					{
						tpl : new Ext.Template(
								'<p style=margin-left:70px;><span style=color:Teal;>方法</span><br><span>{methodname}</span></p>',
								'<p style=margin-left:70px;><span style=color:Teal;>激活时间</span><br><span>{activetime}</span></p>',
								'<p style=margin-left:70px;><span style=color:Teal;>类名</span><br><span>{clazz}</span></p>',
								'<p style=margin-left:70px;><span style=color:Teal;>异常信息</span><br><span style=color:red;>{exception}</span></p>'),
						// 屏蔽双击事件
						expandOnDblClick : true
					});
			var sm = new Ext.grid.CheckboxSelectionModel();
			var cm = new Ext.grid.ColumnModel([ new Ext.grid.RowNumberer(), sm, expander, {
				header : '异常编号',
				dataIndex : 'exceptionid',
				hidden : true,
				width : 120,
				sortable : true
			}, {
				header : '激活时间',
				dataIndex : 'activetime',
				sortable : true,
				width : 130
			}, {
				header : '类名',
				dataIndex : 'clazz',
				width : 350
			}, {
				header : '方法',
				dataIndex : 'methodname',
				width : 160
			}, {
				header : '异常信息',
				dataIndex : 'exception',
				id : 'exception'
			} ]);

			/**
			 * 数据存储
			 */
			var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
					url : 'beanMonitor.do?reqCode=queryMonitorDatas'
				}),
				reader : new Ext.data.JsonReader({
					totalProperty : 'TOTALCOUNT',
					root : 'ROOT'
				}, [ {
					name : 'exceptionid'
				}, {
					name : 'methodname'
				}, {
					name : 'activetime'
				}, {
					name : 'clazz'
				}, {
					name : 'exception'
				} ])
			});

			// 翻页排序时带上查询条件
			store.on('beforeload', function() {
				var ksrq = Ext.getCmp('ksrq').getValue();
				if (!Ext.isEmpty(ksrq)) {
					ksrq = ksrq.format('Y-m-d').toString();
				}
				var jsrq = Ext.getCmp('jsrq').getValue();
				if (!Ext.isEmpty(jsrq)) {
					jsrq = jsrq.format('Y-m-d').toString();
				}
				this.baseParams = {
					keyword : Ext.getCmp('keyword').getValue(),
					jsrq : jsrq,
					ksrq : ksrq
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
					fields : [ 'value', 'text' ],
					data : [ [ 10, '10条/页' ], [ 20, '20条/页' ], [ 50, '50条/页' ], [ 100, '100条/页' ], [ 250, '250条/页' ],
							[ 500, '500条/页' ] ]
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
				items : [ '-', '&nbsp;&nbsp;', pagesize_combo ]
			});

			var grid = new Ext.grid.GridPanel({
				title : '<span class="commoncss">系统异常监控</span>',
				height : 500,
				// width:600,
				autoScroll : true,
				region : 'center',
				store : store,
				margins : '3 3 3 3',
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				},
				stripeRows : true,
				frame : true,
				autoExpandColumn : 'exception',
				cm : cm,
				sm : sm,
				plugins : expander,
				tbar : [ {
					text : '删除',
					iconCls : 'deleteIcon',
					handler : function() {
						if (runMode == '0') {
							Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						}
						deleteMonitorDatas('del');
					}
				}, '-', {
					text : '清空',
					iconCls : 'tbar_synchronizeIcon',
					handler : function() {
						if (runMode == '0') {
							Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						}
						deleteMonitorDatas('reset');
					}
				}, '->', {
					id : 'ksrq',
					name : 'ksrq',
					xtype : 'datefield',
					emptyText : '开始日期',
					format : 'Y-m-d',
					width : 120
				}, '-', {
					id : 'jsrq',
					name : 'jsrq',
					xtype : 'datefield',
					emptyText : '结束日期',
					format : 'Y-m-d',
					width : 120
				}, '-', new Ext.form.TextField({
					id : 'keyword',
					name : 'keyword',
					emptyText : '类名|方法名|异常信息',
					enableKeyEvents : true,
					listeners : {
						specialkey : function(field, e) {
							if (e.getKey() == Ext.EventObject.ENTER) {
								queryMonitorDatas();
							}
						}
					},
					width : 150
				}), {
					text : '查询',
					iconCls : 'previewIcon',
					handler : function() {
						queryMonitorDatas();
					}
				}, '-', {
					text : '刷新',
					iconCls : 'arrow_refreshIcon',
					handler : function() {
						store.reload();
					}
				} ],
				bbar : bbar
			});
			store.load({
				params : {
					start : 0,
					limit : bbar.pageSize
				}
			});
			grid.on('sortchange', function() {
				grid.getSelectionModel().selectFirstRow();
			});

			bbar.on("change", function() {
				grid.getSelectionModel().selectFirstRow();
			});

			/**
			 * 布局
			 */
			var viewport = new Ext.Viewport({
				layout : 'border',
				items : [ grid ]
			});

			/**
			 * 查询事件
			 */
			function queryMonitorDatas() {
				var ksrq = Ext.getCmp('ksrq').getValue();
				if (!Ext.isEmpty(ksrq)) {
					ksrq = ksrq.format('Y-m-d').toString();
				}
				var jsrq = Ext.getCmp('jsrq').getValue();
				if (!Ext.isEmpty(jsrq)) {
					jsrq = jsrq.format('Y-m-d').toString();
				}
				store.load({
					params : {
						start : 0,
						limit : bbar.pageSize,
						keyword : Ext.getCmp('keyword').getValue(),
						jsrq : jsrq,
						ksrq : ksrq
					}
				});
			}

			/**
			 * 删除事件
			 */
			function deleteMonitorDatas(type) {
				var rows = grid.getSelectionModel().getSelections();
				if (Ext.isEmpty(rows)) {
					Ext.Msg.alert('提示', '请先选中要删除的项目!');
					return;
				}
				var strChecked = jsArray2JsString(rows, 'exceptionid');
				var msg = '确认删除选中的记录吗?';
				if (type == 'reset')
					msg = '确认清空所有监控记录吗?';
				Ext.Msg.confirm('请确认', msg, function(btn, text) {
					if (btn == 'yes') {
						showWaitMsg();
						Ext.Ajax.request({
							url : 'beanMonitor.do?reqCode=deleteMonitorDatas',
							success : function(response) {
								var resultArray = Ext.util.JSON.decode(response.responseText);
								store.reload();
								Ext.Msg.alert('提示', resultArray.msg);
							},
							params : {
								strChecked : strChecked,
								type : type
							}
						});
					}
				});
			}

		});
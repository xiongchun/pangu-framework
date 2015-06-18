/**
 * 会话监控
 * 
 * @author XiongChun
 * @since 2010-09-03
 */
Ext.onReady(function() {
			var sm = new Ext.grid.CheckboxSelectionModel();
			var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm,
					{
						header : '用户编号',
						dataIndex : 'userid',
						width : 75,
						hidden : true,
						sortable : true
					}, {
						header : '会话创建时间',
						dataIndex : 'sessionCreatedTime',
						width : 140
					}, {
						header : '登录账户',
						dataIndex : 'account',
						width : 150
					}, {
						header : '姓名',
						dataIndex : 'username',
						width : 90
					}, {
						header : '客户端IP',
						dataIndex : 'loginIP',
						width : 100
					}, {
						header : '客户端浏览器',
						dataIndex : 'explorer',
						width : 120
					}, {
						header : '会话ID',
						dataIndex : 'sessionID',
						width : 250
					}, {
						dataIndex : '_blank',
						id : '_blank'
					}]);

			var store = new Ext.data.Store({
						proxy : new Ext.data.HttpProxy({
									url : 'sessionMonitor.do?reqCode=getSessionList'
								}),
						reader : new Ext.data.JsonReader({
									totalProperty : 'TOTALCOUNT',
									root : 'ROOT'
								}, [{
											name : 'sessionID'
										}, {
											name : 'userid'
										}, {
											name : 'username'
										}, {
											name : 'account'
										}, {
											name : 'loginIP'
										}, {
											name : 'explorer'
										}, {
											name : 'sessionCreatedTime'
										}])
					});

			store.on('beforeload', function() {
						this.baseParams = {
							username : Ext.getCmp('username').getValue(),
							account : Ext.getCmp('account').getValue()
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
											[250, '250条/页'], [500, '500条/页'],
											[1000, '1000条/页']]
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
						title : '<span class="commoncss">会话监控</span>',
						height : 510,
						store : store,
						region : 'center',
						margins : '3 3 3 3',
						loadMask : {
							msg : '正在加载数据,请稍等...'
						},
						stripeRows : true,
						frame : true,
						autoExpandColumn : '_blank',
						cm : cm,
						sm : sm,
						tbar : [{
							text : '杀死会话',
							iconCls : 'deleteIcon',
							handler : function() {
								if (runMode == '0') {
									Ext.Msg
											.alert('提示',
													'系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
									return;
								}
								killSession();
							}
						}, '->', {
							id : 'account',
							name : 'account',
							xtype : 'textfield',
							emptyText : '登录帐户',
							enableKeyEvents : true,
							listeners : {
								specialkey : function(field, e) {
									if (e.getKey() == Ext.EventObject.ENTER) {
										query();
									}
								}
							},
							width : 120
						}, '-', {
							id : 'username',
							name : 'username',
							xtype : 'textfield',
							emptyText : '姓名',
							enableKeyEvents : true,
							listeners : {
								specialkey : function(field, e) {
									if (e.getKey() == Ext.EventObject.ENTER) {
										query();
									}
								}
							},
							width : 120
						}, {
							text : '查询',
							iconCls : 'previewIcon',
							handler : function() {
								query();
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

			grid.on('sortchange', function() {
						// grid.getSelectionModel().selectFirstRow();
					});

			bbar.on("change", function() {
						// grid.getSelectionModel().selectFirstRow();
					});
			/**
			 * 布局
			 */
			var viewport = new Ext.Viewport({
						layout : 'border',
						items : [grid]
					});

			/**
			 * 杀死会话
			 */
			function killSession() {
				var rows = grid.getSelectionModel().getSelections();
				if (Ext.isEmpty(rows)) {
					Ext.Msg.alert('提示', '请先选中杀死的会话!');
					return;
				}
				var strChecked = jsArray2JsString(rows, 'sessionID');
				showWaitMsg('正在杀死会话,请等待...');
				Ext.Ajax.request({
							url : 'sessionMonitor.do?reqCode=killSession',
							success : function(response) {
								var resultArray = Ext.util.JSON
										.decode(response.responseText);
								refreshSessionTable();
								Ext.Msg.alert('提示', resultArray.msg);
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

			function query() {
				store.load({
							params : {
								start : 0,
								limit : bbar.pageSize,
								username : Ext.getCmp('username').getValue(),
								account : Ext.getCmp('account').getValue()
							}
						});
			}

		});
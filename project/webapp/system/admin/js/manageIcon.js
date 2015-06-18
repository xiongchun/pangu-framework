/**
 * 系统预置图标
 * 
 * @author XiongChun
 * @since 2010-05-20
 */
Ext.onReady(function() {
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
				header : '图标编号',
				dataIndex : 'iconid',
				hidden : false,
				width : 80,
				sortable : true
			}, {
				header : '预览',
				dataIndex : 'previewpath',
				renderer : function(value) {
					return '<img src=' + value + ' />';
				},
				width : 50
			}, {
				id : 'cssname',
				header : 'CSS类名',
				dataIndex : 'cssname',
				width : 150
			}, {
				id : 'filename',
				header : '文件名',
				dataIndex : 'filename',
				width : 150
			}, {
				id : 'accesspath',
				header : '访问路径',
				dataIndex : 'accesspath'
			}]);

	/**
	 * 数据存储
	 */
	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : './resource.do?reqCode=queryIconItems'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'TOTALCOUNT',
							root : 'ROOT'
						}, [{
									name : 'iconid'
								}, {
									name : 'previewpath'
								}, {
									name : 'cssname'
								}, {
									name : 'filename'
								}, {
									name : 'accesspath'
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
				displayMsg : '共 {2} 条，当前页显示第 {0}条到 {1}条',
				emptyMsg : "没有符合条件的记录",
				items : ['-', '&nbsp;&nbsp;', pagesize_combo]
			});

	var grid = new Ext.grid.GridPanel({
				title : '<span style="font-weight:normal">系统预置图标</span>',
				iconCls : 'imagesIcon',
				height : 500,
				autoScroll : true,
				region : 'center',
				margins : '3 3 3 3',
				store : store,
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				},
				stripeRows : true,
				frame : true,
				autoExpandColumn : 'accesspath',
				cm : cm,
				tbar : ['->', new Ext.form.TextField({
									id : 'queryParam',
									name : 'queryParam',
									emptyText : '请输入文件名|CSS类名',
									enableKeyEvents : true,
									listeners : {
										specialkey : function(field, e) {
											if (e.getKey() == Ext.EventObject.ENTER) {
												queryIconItem();
											}
										}
									},
									width : 150
								}), {
							text : '查询',
							iconCls : 'page_findIcon',
							handler : function() {
								queryIconItem();
							}
						}, '-', {
							text : '刷新',
							iconCls : 'page_refreshIcon',
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
				grid.getSelectionModel().selectFirstRow();
			});

	bbar.on("change", function() {
				grid.getSelectionModel().selectFirstRow();
			});
	grid.on("celldblclick", function(grid, rowIndex, columnIndex, e) {
				var store = grid.getStore();
				var record = store.getAt(rowIndex);
				var fieldName = grid.getColumnModel().getDataIndex(columnIndex);
				var celldata = record.get(fieldName);
				// copyToClipboard(celldata);
				iconPanel.getForm().loadRecord(record);
				iconWindow.show();
			});

	var iconPanel = new Ext.form.FormPanel({
				id : 'iconPanel',
				name : 'iconPanel',
				defaultType : 'textfield',
				labelAlign : 'right',
				labelWidth : 65,
				frame : true,
				items : [{
							fieldLabel : 'CSS类名',
							name : 'cssname',
							allowBlank : true,
							anchor : '99%'
						}, {
							fieldLabel : '文件名',
							name : 'filename',
							allowBlank : true,
							anchor : '99%'
						}, {
							fieldLabel : '访问路径',
							name : 'accesspath',
							allowBlank : true,
							anchor : '99%'
						}]
			});

	var iconWindow = new Ext.Window({
				layout : 'fit',
				width : 400,
				height : 125,
				resizable : false,
				draggable : true,
				closeAction : 'hide',
				title : '<span class="commoncss">系统图标</span>',
				// iconCls : 'page_addIcon',
				modal : false,
				collapsible : true,
				titleCollapse : true,
				maximizable : false,
				buttonAlign : 'right',
				border : false,
				animCollapse : true,
				// pageY : 20,
				// pageX : document.body.clientWidth / 2 - 400 / 2,
				animateTarget : Ext.getBody(),
				constrain : true,
				items : [iconPanel]
			});

	/**
	 * 布局
	 */
	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [grid]
			});

	/**
	 * 查询参数
	 */
	function queryIconItem() {
		var queryParam = Ext.getCmp('queryParam').getValue();
		store.load({
					params : {
						start : 0,
						limit : bbar.pageSize,
						queryParam : queryParam
					}
				});
	}

	/**
	 * 显示窗口
	 */
	function showWindowInit() {
		var record = grid.getSelectionModel().getSelected();
		if (Ext.isEmpty(record)) {
			grid.getSelectionModel().selectFirstRow();
		}
		iconPanel.getForm().loadRecord(record);
		iconWindow.show();
	}
});
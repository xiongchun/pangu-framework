/**
 * UI元素托管
 * 
 * @author XiongChun
 * @since 2011-06-29
 */

Ext.onReady(function() {
	var menuid;
	var root = new Ext.tree.AsyncTreeNode({
				text : root_menuname,
				expanded : true,
				id : '01'
			});
	var menuTree = new Ext.tree.TreePanel({
				loader : new Ext.tree.TreeLoader({
							baseAttrs : {},
							dataUrl : 'part.do?reqCode=queryMenuItems'
						}),
				root : root,
				title : '',
				applyTo : 'menuTreeDiv',
				autoScroll : false,
				animate : false,
				useArrows : false,
				border : false
			});

	menuTree.on('click', function(node) {
				if (!node.isLeaf()) {
					store.removeAll();
					Ext.getCmp('id_addRow').setDisabled(true);
					Ext.getCmp('id_save').setDisabled(true);
					return;
				}
				Ext.getCmp('id_addRow').setDisabled(false);
				menuid = node.id
				store.load({
							params : {
								start : 0,
								limit : bbar.pageSize,
								menuid : menuid
							}
						});
			});

	menuTree.root.select();

	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
				header : '删除',
				dataIndex : 'delete',
				width : 35,
				renderer : iconColumnRender
			}, {
				header : '元素Dom标识',
				dataIndex : 'cmpid',
				sortable : true,
				width : 150,
				editor : new Ext.grid.GridEditor(new Ext.form.TextField({
							allowBlank : false,
							maxLength : 20
						}))

			}, {
				header : '元素类型',
				dataIndex : 'cmptype',
				width : 120,
				renderer : CMPTYPERender,
				editor : new Ext.grid.GridEditor(new Ext.form.ComboBox({
							store : CMPTYPEStore,
							mode : 'local',
							listWidth : 408,
							triggerAction : 'all',
							valueField : 'value',
							displayField : 'text',
							allowBlank : false,
							resizable : true,
							forceSelection : true,
							editable : false,
							typeAhead : true
						}))
			}, {
				header : '元素描述',
				dataIndex : 'remark',
				width : 200,
				editor : new Ext.grid.GridEditor(new Ext.form.TextField({
							maxLength : 50
						}))
			}, {
				header : '托管页面功能菜单',
				dataIndex : 'menuname',
				id : 'menuname',
				width : 150
			}, {
				header : '元素编号',
				dataIndex : 'partid',
				width : 120
			}, {
				header : '菜单编号',
				dataIndex : 'menuid',
				hidden : true,
				width : 120
			}]);

	var rec_part = new Ext.data.Record.create([{
				name : 'partid',
				type : 'string'
			}, {
				name : 'menuid',
				type : 'string'
			}, {
				name : 'menuname',
				type : 'string'
			}, {
				name : 'cmpid',
				type : 'string'
			}, {
				name : 'cmptype',
				type : 'string'
			}, {
				name : 'remark',
				type : 'string'
			}, {
				name : 'dirtytype',
				type : 'string'
			}]);

	var store = new Ext.data.Store({
				// True表示为，每次Store加载后，清除所有修改过的记录信息；record被移除时也会这样
				pruneModifiedRecords : true,
				proxy : new Ext.data.HttpProxy({
							url : 'part.do?reqCode=queryParts'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'TOTALCOUNT',
							root : 'ROOT'
						}, [{
									name : 'partid'
								}, {
									name : 'menuid'
								}, {
									name : 'menuname'
								}, {
									name : 'cmpid'
								}, {
									name : 'cmptype'
								}, {
									name : 'remark'
								}])
			});

	store.on('beforeload', function() {
				this.baseParams = {
					menuid : menuid
				};
			});

	store.on('load', function() {
				if (store.getTotalCount() == 0) {
					// Ext.getCmp('id_addRow').setDisabled(true);
					Ext.getCmp('id_save').setDisabled(true);
				} else {
					// Ext.getCmp('id_addRow').setDisabled(false);
					Ext.getCmp('id_save').setDisabled(false);
				}

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
				emptyMsg : "没有符合条件的记录",
				items : ['-', '&nbsp;&nbsp;', pagesize_combo]
			});

	var grid = new Ext.grid.EditorGridPanel({
				title : '<span class="commoncss">托管UI元素列表</span>',
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
				autoExpandColumn : 'menuname',
				cm : cm,
				clicksToEdit : 1,
				tbar : [{
							text : '新增',
							iconCls : 'addIcon',
							id : 'id_addRow',
							handler : function() {
								addInit();
							}
						}, '-', {
							text : '保存',
							iconCls : 'acceptIcon',
							id : 'id_save',
							handler : function() {
								if (runMode == '0') {
									Ext.Msg
											.alert('提示',
													'系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
									return;
								}
								saveOrUpdateData();
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

	grid.on("cellclick", function(pGrid, rowIndex, columnIndex, e) {
				store = pGrid.getStore();
				var record = store.getAt(rowIndex);
				var fieldName = pGrid.getColumnModel()
						.getDataIndex(columnIndex);
				if (fieldName == 'delete' && columnIndex == 1) {
					var dirtytype = record.get('dirtytype');
					if (Ext.isEmpty(dirtytype)) {
						Ext.Msg.confirm('请确认', '你确认要删除当前对象吗?', function(btn,
										text) {
									if (btn == 'yes') {

										delItem(record.get('partid'));

									} else {
										return;
									}
								});
					} else {
						store.remove(record);

					}
				}
			});

	Ext.getCmp('id_addRow').setDisabled(true);
	Ext.getCmp('id_save').setDisabled(true);

	/*
	 * store.load({ params : { start : 0, limit : bbar.pageSize } });
	 */
	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [{
							title : '<span style="font-weight:normal">功能菜单</span>',
							iconCls : 'layout_contentIcon',
							tools : [{
										id : 'refresh',
										handler : function() {
											menuTree.root.reload()
										}
									}],
							collapsible : true,
							width : 210,
							minSize : 160,
							maxSize : 280,
							split : true,
							region : 'west',
							autoScroll : true,
							margins : '3 3 3 3',
							items : [menuTree]
						}, grid]
			});

	function addInit() {
		var selectModel = menuTree.getSelectionModel();
		var selectNode = selectModel.getSelectedNode();
		var rec = new rec_part({});
		rec.set('partid', '保存后自动生成');
		rec.set('menuid', selectNode.id);
		rec.set('menuname', selectNode.text);
		rec.set('dirtytype', '1');
		grid.stopEditing();
		store.insert(0, rec);
		grid.startEditing(0, 2);
		// store.getAt(0).dirty=true; //不起作用
		store.getAt(0).set('cmpid', '不能为空,请输入');
		// 通过这种办法变相的将新增行标识为脏数据
		Ext.getCmp('id_save').setDisabled(false);
	}

	function saveOrUpdateData() {
		var m = store.modified.slice(0);
		if (Ext.isEmpty(m)) {
			Ext.MessageBox.alert('提示', '没有数据需要保存!');
			return;
		}

		for (var i = 0; i < m.length; i++) {
			var record = m[i];
			var rowIndex = store.indexOfId(record.id);
			if (Ext.isEmpty(record.get('cmpid'))) {
				Ext.Msg.alert('提示', '元素Dom标识字段数据校验不合法,请重新输入!', function() {
							grid.startEditing(rowIndex, 3);
						});
				return false;
			}
			if (Ext.isEmpty(record.get('cmptype'))) {
				Ext.Msg.alert('提示', '元素类型字段数据校验不合法,请重新输入!', function() {
							grid.startEditing(rowIndex, 4);
						});
				return false;
			}
		}

		var jsonArray = [];
		Ext.each(m, function(item) {
					jsonArray.push(item.data);
				});

		Ext.Ajax.request({
					url : 'part.do?reqCode=saveDirtyDatas',
					success : function(response) {

						var resultArray = Ext.util.JSON
								.decode(response.responseText);
						if (resultArray.bflag == '1') {
							Ext.getCmp('id_save').setDisabled(true);
							store.reload();
						}
						Ext.Msg.alert('提示', resultArray.msg);
					},
					failure : function(response) {
						Ext.MessageBox.alert('提示', '数据保存失败');
					},
					params : {
						dirtydata : Ext.encode(jsonArray)
					}
				});
	}

	function delItem(partid) {
		if (runMode == '0') {
			Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
			return;
		}
		Ext.Ajax.request({
					url : 'part.do?reqCode=deleteItem',
					success : function(response) {
						store.reload();
						var resultArray = Ext.util.JSON
								.decode(response.responseText);
						Ext.Msg.alert('提示', resultArray.msg);
					},
					failure : function(response) {
						Ext.MessageBox.alert('提示', '数据删除失败');
					},
					params : {
						partid : partid
					}
				});
	}

	function iconColumnRender(value) {
		return "<a href='javascript:void(0);'><img src='" + webContext
				+ "/resource/image/ext/delete.png'/></a>";;
	}

});
/**
 * 常用UI组件(工具栏)
 * 
 * @author XiongChun
 * @since 2010-10-27
 */
Ext.onReady(function() {
	// 一级菜单
	var contextmenu = new Ext.menu.Menu({
				items : [{
							text : '查看详情',
							iconCls : 'previewIcon',
							handler : function(item) {
								Ext.Msg.alert('提示', item.text);
							}
						}, {
							text : '导出列表',
							iconCls : 'page_excelIcon',
							handler : function(item) {
								Ext.Msg.alert('提示', item.text);
							}
						}, {
							text : '是否启用',
							checked : true,
							checkHandler : function(item) {
								alert(item.checked);
								// Ext.Msg.alert('提示', item.checked);
							}
						}, {
							text : '二级菜单',
							iconCls : 'cupIcon',
							menu : new Ext.menu.Menu({
										items : [{
													text : '金牌',
													iconCls : 'medal_gold_1Icon',
													handler : function(item) {
														Ext.Msg.alert('提示',
																item.text);
													}
												}, {
													text : '银牌',
													iconCls : 'medal_silver_3Icon',
													handler : function(item) {
														Ext.Msg.alert('提示',
																item.text);
													}
												}]
									})
						}]
			});

	// 定义工具栏
	var tb = new Ext.Toolbar();
	tb.add({
		text : '下拉菜单',
		iconCls : 'window_caise_listIcon',
		menu : contextmenu
			// 下拉菜单
		}, '-', {
		text : '删除',
		iconCls : 'page_delIcon',
		handler : function(item) {
			Ext.Msg.alert('提示', item.text);
		}
	}, '-', {
		text : '重置',
		iconCls : 'tbar_synchronizeIcon',
		handler : function(item) {
			Ext.Msg.alert('提示', item.text);
		}
	}, '-', {
		text : '刷新',
		iconCls : 'page_refreshIcon',
		// pressed:true, //按钮按下
		handler : function(item) {
			Ext.Msg.alert('提示', item.text);
		}
	}, '-', {
		id : 'remark',
		name : 'remark',
		xtype : 'tbtext',
		text : '<span style=font-size:12px>普通文本</span>',
		width : 100
	}, '->', {
		id : 'ksrq',
		name : 'ksrq',
		xtype : 'datefield',
		emptyText : '选择日期',
		format : 'Y-m-d',
		width : 100
	}, '-', {
		id : 'keyword',
		name : 'keyword',
		emptyText : '关键字过滤',
		xtype : 'textfield',
		enableKeyEvents : true,
		// 响应回车键
		listeners : {
			specialkey : function(field, e) {
				if (e.getKey() == Ext.EventObject.ENTER) {
				}
			}
		},
		width : 100
	}, {
		text : '查询',
		iconCls : 'page_findIcon',
		handler : function(item) {
			Ext.Msg.alert('提示', item.text);
		}
	});
	
	var firstWindow = new Ext.Window({
				title : '<span class="commoncss">常用UI组件(工具栏、菜单栏)</span>', // 窗口标题
				layout : 'fit', // 设置窗口布局模式
				width : 700, // 窗口宽度
				height : 200, // 窗口高度
				// tbar : tb, // 工具栏
				closable : false, // 是否可关闭
				collapsible : true, // 是否可收缩
				maximizable : true, // 设置是否可以最大化
				border : false, // 边框线设置
				pageY : 20, // 页面定位Y坐标
				pageX : document.body.clientWidth / 2 - 700 / 2, // 页面定位X坐标
				constrain : true,
				// 设置窗口是否可以溢出父容器
				items : [new Ext.form.FormPanel({
							tbar : tb
						})]
			});
	firstWindow.show(); // 显示窗口

});
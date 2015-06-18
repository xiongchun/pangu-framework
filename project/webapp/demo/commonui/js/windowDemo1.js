/**
 * 窗口范例
 * 
 * @author XiongChun
 * @since 2010-10-27
 */
Ext.onReady(function() {
	// 定义工具栏
	var tb = new Ext.Toolbar();
	tb.add({
		text : '<span class="commoncss">窗口一</span>',
		iconCls : 'imageIcon',
		handler : function(item) {
			initWindow1();
		}
	}, '-', {
		text : '<span class="commoncss">窗口二</span>',
		iconCls : 'imageIcon',
		handler : function(item) {
			initWindow2();
		}
	}, '-', {
		text : '<span class="commoncss">窗口三</span>',
		iconCls : 'imageIcon',
		handler : function(item) {
			initWindow3();
		}
	}, '-', {
		text : '窗口四',
		iconCls : 'imageIcon',
		handler : function(item) {
			initWindow4();
		}
	});
	tb.render(Ext.getBody());

	function initWindow1() {
		var firstWindow = new Ext.Window({
			title : '<span class="commoncss">窗口一</span>', // 窗口标题
			iconCls : 'imageIcon',
			layout : 'fit', // 设置窗口布局模式
			width : 400, // 窗口宽度
			height : 200, // 窗口高度
			// tbar : tb, // 工具栏
			closable : true, // 是否可关闭
			closeAction : 'hide', // 关闭策略
			bodyStyle : 'background-color:#FFFFFF',
			collapsible : true, // 是否可收缩
			maximizable : true, // 设置是否可以最大化
			animateTarget : Ext.getBody(),
			border : true, // 边框线设置
			pageY : 30, // 页面定位Y坐标
			pageX : document.body.clientWidth / 2 - 400 / 2, // 页面定位X坐标
			constrain : true,
			// 设置窗口是否可以溢出父容器
			buttonAlign : 'center',
			buttons : [ {
				text : '保存',
				iconCls : 'acceptIcon',
				handler : function() {
					// TODO
				}
			}, {
				text : '关闭',
				iconCls : 'deleteIcon',
				handler : function() {
					firstWindow.hide();
				}
			} ]
		});
		firstWindow.show(); // 显示窗口
	}

	function initWindow2() {
		var secondWindow = new Ext.Window({
			title : '<span class="commoncss">窗口二</span>', // 窗口标题
			iconCls : 'imageIcon',
			layout : 'fit', // 设置窗口布局模式
			width : 400, // 窗口宽度
			height : 200, // 窗口高度
			// tbar : tb, // 工具栏
			animateTarget : Ext.getBody(),
			closable : false, // 是否可关闭
			closeAction : 'hide', // 关闭策略
			collapsible : false, // 是否可收缩
			maximizable : false, // 设置是否可以最大化
			border : true, // 边框线设置
			pageY : 80, // 页面定位Y坐标
			pageX : document.body.clientWidth / 2 - 400 / 2, // 页面定位X坐标
			constrain : true,
			// 设置窗口是否可以溢出父容器
			buttonAlign : 'center',
			buttons : [ {
				text : '保存',
				iconCls : 'acceptIcon',
				handler : function() {
					// TODO
				}
			}, {
				text : '关闭',
				iconCls : 'deleteIcon',
				handler : function() {
					secondWindow.hide();
				}
			} ]
		});
		secondWindow.show(); // 显示窗口
	}
	var panel = new Ext.Panel({
		// renderTo : 'panelDiv1', // 渲染到的Dom元素
		title : '<span class="commoncss">面板标题</span>', // 标题
		iconCls : 'book_previousIcon', // 图标
		collapsible : true, // 是否允许折叠
		animateTarget : Ext.getBody(),
		// contentEl : 'contentDiv', // 内容DIV
		// width : 400,
		frame : false,
		height : 100,
		buttonAlign : 'center',
		buttons : [ {
			text : '保存',
			iconCls : 'acceptIcon',
			handler : function() {
				// TODO
			}
		}, {
			text : '关闭',
			iconCls : 'deleteIcon',
			handler : function() {
				// TODO
			}
		} ]
	});
	function initWindow3() {
		var thirdWindow = new Ext.Window({
			title : '<span class="commoncss">窗口三</span>', // 窗口标题
			iconCls : 'imageIcon',
			layout : 'fit', // 设置窗口布局模式
			width : 400, // 窗口宽度
			height : 200, // 窗口高度
			// tbar : tb, // 工具栏
			closable : false, // 是否可关闭
			closeAction : 'hide', // 关闭策略
			collapsible : true, // 是否可收缩
			maximizable : false, // 设置是否可以最大化
			modal : true,
			border : false, // 边框线设置
			pageY : 120, // 页面定位Y坐标
			pageX : document.body.clientWidth / 2 - 400 / 2, // 页面定位X坐标
			constrain : true,
			items : [ panel ],
			// 设置窗口是否可以溢出父容器
			buttonAlign : 'center',
			buttons : [ {
				text : '保存',
				iconCls : 'acceptIcon',
				handler : function() {
					// TODO
				}
			}, {
				text : '关闭',
				iconCls : 'deleteIcon',
				handler : function() {
					thirdWindow.hide();
				}
			} ]
		});
		thirdWindow.show(); // 显示窗口
	}

	function initWindow4() {
		var fourthWindow = new parent.Ext.Window({
			title : '<span class="commoncss">窗口四(置于最顶层:不建议使用这种方式)</span>', // 窗口标题
			iconCls : 'imageIcon',
			layout : 'fit', // 设置窗口布局模式
			width : 400, // 窗口宽度
			height : 200, // 窗口高度
			// tbar : tb, // 工具栏
			closable : true, // 是否可关闭
			closeAction : 'hide', // 关闭策略
			bodyStyle : 'background-color:#FFFFFF',
			collapsible : true, // 是否可收缩
			maximizable : true, // 设置是否可以最大化
			animateTarget : Ext.getBody(),
			border : true, // 边框线设置
			modal : true,
			pageY : 50, // 页面定位Y坐标
			pageX : 150, // 页面定位X坐标
			constrain : true,
			// 设置窗口是否可以溢出父容器
			buttonAlign : 'center',
			buttons : [ {
				text : '保存',
				iconCls : 'acceptIcon',
				handler : function() {
					// TODO
				}
			}, {
				text : '关闭',
				iconCls : 'deleteIcon',
				handler : function() {
					fourthWindow.hide();
				}
			} ]
		});
		fourthWindow.show(); // 显示窗口
	}
});
/**
 * Tab标签卡范例
 * 
 * @author XiongChun
 * @since 2010-10-27
 */
Ext.onReady(function() {
			var tabs = new Ext.TabPanel({
						region:'center',
						margins : '3 3 3 3',
						enableTabScroll : true,
						//autoWidth : true,
						height : 200,
						buttonAlign : 'center',
						buttons : [{
									text : '切换1',
									iconCls : 'acceptIcon',
									handler : function() {
										tabs.activate(1);
									}
								}, {
									text : '禁用',
									iconCls : 'deleteIcon',
									handler : function() {
										Ext.getCmp('tab2').disable();
									}
								}, {
									text : '激活',
									iconCls : 'acceptIcon',
									handler : function() {
										Ext.getCmp('tab2').enable();
									}
								}]
					});
			// 每一个Tab都可以看作为一个Panel
			tabs.add({
						title : '<span class="commoncss">汇总信息</span>',
						html : '汇总信息',
						
						// tbar:tb, //工具栏
						// items:[],
						iconCls : 'book_previousIcon', // 图标
						closable : true
					});
			tabs.add({
						id : 'tab2',
						title : '<span class="commoncss">明细信息</span>',
						html : '明细信息'
					});
			tabs.activate(0);
			
			// 布局模型
			var viewport = new Ext.Viewport({
						layout : 'border',
						items : [tabs]
					});

		});
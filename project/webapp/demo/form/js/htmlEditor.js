/**
 * 表单：富文本输入
 * 
 * @author XiongChun
 * @since 2010-08-20
 */
Ext.onReady(function() {

			var panel = new Ext.form.FormPanel({
						layout : 'fit',
						frame : true,
						items : [{
									id : 'htmleditor',
									name : 'htmleditor',
									xtype : 'htmleditor'
								}]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">富文本输入</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 600, // 窗口宽度
						height : 380, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : false, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						draggable : false,
						animateTarget : Ext.getBody(),
						pageY : 20, // 页面定位Y坐标
						pageX : document.body.clientWidth / 2 - 600 / 2, // 页面定位X坐标
						items : [panel], // 嵌入的表单面板
						buttons : [{ // 窗口底部按钮配置
							text : '保存', // 按钮文本
							iconCls : 'acceptIcon', // 按钮图标
							handler : function() { // 按钮响应函数
								var value = Ext.getCmp('htmleditor').getValue();
								// Ext.MessageBox.alert('提示', value);
								alert(value);
							}
						}, {	// 窗口底部按钮配置
									text : '重置', // 按钮文本
									iconCls : 'tbar_synchronizeIcon', // 按钮图标
									handler : function() { // 按钮响应函数
										panel.form.reset();
									}
								}]
					});
			firstWindow.show(); // 显示窗口

			Ext.getCmp('htmleditor').on('initialize', function() {
						Ext.getCmp('htmleditor').focus();
					})
		});
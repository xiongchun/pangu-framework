/**
 * 表单：复合布局
 * 
 * @author XiongChun
 * @since 2010-11-20
 */
Ext.onReady(function() {
			var firstForm = new Ext.form.FormPanel({
						// frame : true, // 是否渲染表单面板背景色
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						labelWidth : 40,
						items : [{
									layout : 'column',
									border : false,
									items : [{
												columnWidth : .5,
												layout : 'form',
												labelWidth : 40, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '姓名1',
															name : 'name1',
															anchor : '95%'
														}, {
															fieldLabel : '姓名2',
															name : 'name2',
															anchor : '95%'
														}]
											}, {
												columnWidth : .5,
												layout : 'form',
												labelWidth : 65, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '身份证号1',
															name : 'pid1',
															anchor : '100%'
														}, {
															fieldLabel : '身份证号2',
															name : 'pid2',
															anchor : '100%'
														}]
											}]
								}, {
									fieldLabel : '籍贯',
									labelWidth : 40,
									name : 'jg',
									xtype : 'textfield',
									anchor : '100%'
								}, {
									layout : 'column',
									border : false,
									items : [{
												columnWidth : .5,
												layout : 'form',
												labelWidth : 40, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '年龄1',
															name : 'age1',
															anchor : '95%'
														}, {
															fieldLabel : '年龄2',
															name : 'age2',
															anchor : '95%'
														}]
											}, {
												columnWidth : .5,
												layout : 'form',
												labelWidth : 65, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '所学专业1',
															name : 'field1',
															anchor : '100%'
														}, {
															fieldLabel : '所学专业2',
															name : 'field2',
															anchor : '100%'
														}]
											}]
								}, {
									fieldLabel : '备注',
									labelWidth : 40,
									name : 'remark',
									xtype : 'textarea',
									anchor : '100%'
								}]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">综合布局1</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 430, // 窗口宽度
						height : 285, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						animateTarget : Ext.getBody(),
						pageY : 20, // 页面定位Y坐标
						pageX : document.body.clientWidth / 2 - 450 / 2, // 页面定位X坐标
						items : [firstForm], // 嵌入的表单面板
						buttons : [{ // 窗口底部按钮配置
							text : '重置', // 按钮文本
							iconCls : 'tbar_synchronizeIcon', // 按钮图标
							handler : function() { // 按钮响应函数
								firstForm.form.reset();
							}
						}]
					});
			firstWindow.show(); // 显示窗口

		});
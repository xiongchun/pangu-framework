/**
 * 表单：分列布局
 * 
 * @author XiongChun
 * @since 2010-11-20
 */
Ext.onReady(function() {
			var firstForm = new Ext.form.FormPanel({
						// frame : true, // 是否渲染表单面板背景色
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						items : [{
									layout : 'column',
									border : false,
									items : [{
												columnWidth : .4,
												layout : 'form',
												labelWidth : 40, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '姓名1',
															name : 'name1',
															anchor : '90%'
														}, {
															fieldLabel : '姓名2',
															name : 'name2',
															anchor : '90%'
														}, {
															fieldLabel : '姓名3',
															name : 'name3',
															anchor : '90%'
														}, {
															fieldLabel : '姓名4',
															name : 'name4',
															anchor : '90%'
														}, {
															fieldLabel : '姓名5',
															name : 'name5',
															anchor : '90%'
														}]
											}, {
												columnWidth : .6,
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
														}, {
															fieldLabel : '身份证号3',
															name : 'pid3',
															anchor : '100%'
														}, {
															fieldLabel : '身份证号4',
															name : 'pid4',
															anchor : '100%'
														}]
											}]
								}]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">Column布局</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 430, // 窗口宽度
						height : 230, // 窗口高度
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
/**
 * 表单：单选、复选框
 * 
 * @author XiongChun
 * @since 2010-08-20
 */
Ext.onReady(function() {
			var firstForm = new Ext.form.FormPanel({
						id : 'firstForm',
						name : 'firstForm',
						labelWidth : 40, // 标签宽度
						// frame : true, //是否渲染表单面板背景色
						defaultType : 'textfield', // 表单元素默认类型
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						items : [new Ext.form.Radio({
											name : 'sex',// 名字相同的单选框会作为一组
											fieldLabel : '性别',
											boxLabel : '男'
										}), new Ext.form.Radio({
											name : 'sex',// 名字相同的单选框会作为一组
											boxLabel : '女'
										}), new Ext.form.Checkbox({
											name : 'swim',
											fieldLabel : '爱好',
											boxLabel : '游泳'
										}), new Ext.form.Checkbox({
											name : 'walk',
											boxLabel : '散步'
										}), new Ext.form.Checkbox({
											name : 'basketball',
											checked : true,
											boxLabel : '打篮球'
										})]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">表单：单选、复选框</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 200, // 窗口宽度
						height : 300, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						pageY : 20, // 页面定位Y坐标
						pageX : document.body.clientWidth / 2 - 200 / 2, // 页面定位X坐标
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
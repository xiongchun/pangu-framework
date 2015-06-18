/**
 * 存储过程调用
 * 
 * @author XiongChun
 * @since 2011-03-20
 */
Ext.onReady(function() {
			var firstForm = new Ext.form.FormPanel({
						id : 'firstForm',
						name : 'firstForm',
						labelWidth : 50, // 标签宽度
						// frame : true, // 是否渲染表单面板背景色
						defaultType : 'textfield', // 表单元素默认类型
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						items : [{
									fieldLabel : '被加数', // 标签
									name : 'number1', // name:后台根据此name属性取值
									xtype : 'numberfield', // 设置为数字输入框类型
									allowDecimals : false, // 是否允许输入小数
									allowNegative : false, // 是否允许输入负数
									allowBlank:false,
									anchor : '40%' // 宽度百分比
								}, {
									fieldLabel : '加数', // 标签
									name : 'number2', // name:后台根据此name属性取值
									xtype : 'numberfield', // 设置为数字输入框类型
									allowDecimals : false, // 是否允许输入小数
									allowNegative : false, // 是否允许输入负数
									allowBlank:false,
									value : '熊春',
									anchor : '40%' // 宽度百分比
								}, {
									fieldLabel : '结果', // 标签
									name : 'result', // name:后台根据此name属性取值
									id:'result',
									readOnly : true,
									fieldClass : 'x-custom-field-disabled',
									anchor : '100%' // 宽度百分比
								}]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">数学计算[演示存储过程调用]</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 400, // 窗口宽度
						height : 200, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						pageY : 20, // 页面定位X坐标
						pageX : document.body.clientWidth / 2 - 400 / 2, // 页面定位Y坐标
						items : [firstForm], // 嵌入的表单面板
						buttons : [{	// 窗口底部按钮配置
									text : '调用存储过程进行数学计算', // 按钮文本
									iconCls : 'acceptIcon', // 按钮图标
									handler : function() { // 按钮响应函数
										callPrc();
									}
								}, { // 窗口底部按钮配置
									text : '重置', // 按钮文本
									iconCls : 'tbar_synchronizeIcon', // 按钮图标
									handler : function() { // 按钮响应函数
										firstForm.getForm().reset();
									}
								}]
					});
			firstWindow.show(); // 显示窗口
			firstForm.getForm().reset();

			/**
			 * 存储过程异步调用
			 */
			function callPrc() {
				if (!firstForm.form.isValid()) {
					return;
				}
				var params = firstForm.getForm().getValues();
				Ext.Ajax.request({
							url : 'integrateDemo.do?reqCode=callPrc',
							success : function(response) {
								var resultArray = Ext.util.JSON.decode(response.responseText);
								Ext.getCmp("result").setValue(resultArray.result);
								Ext.Msg.alert('提示', resultArray.msg);
							},
							failure : function(response) {
								var resultArray = Ext.util.JSON.decode(response.responseText);
								Ext.MessageBox.alert('提示', resultArray.msg);
							},
							params : params
						});
			}

		});
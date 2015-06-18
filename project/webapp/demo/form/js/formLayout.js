/**
 * 表单：平铺布局(缺省)
 * 
 * @author XiongChun
 * @since 2010-08-20
 */
Ext.onReady(function() {
			var firstForm = new Ext.form.FormPanel({
						labelWidth : 80, // 标签宽度
						// frame : true, //是否渲染表单面板背景色
						defaultType : 'textfield', // 表单元素默认类型
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						layout : 'form',
						items : [{
									fieldLabel : '普通文本', // 标签
									name : 'name', // name:后台根据此name属性取值
									allowBlank : false, // 是否允许为空
									maxLength : 8, // 可输入的最大文本长度,不区分中英文字符
									minLength : 2,// 可输入的最小文本长度,不区分中英文字符
									anchor : '100%' // 宽度百分比
								}, {
									fieldLabel : '身份证号输入', // 标签
									name : 'personId', // name:后台根据此name属性取值
									id : 'personId',
									emptyText : '请输入身份证号码',
									maxLength : 18, // 可输入的最大文本长度,不区分中英文字符
									allowBlank : true,
									listeners : {
										'blur' : function(obj) {
											isIdCardNo(obj.getValue());
										}
									},
									anchor : '100%'// 宽度百分比
								}, {
									fieldLabel : '密码框',
									name : 'password',
									inputType : 'password', // 设置为密码框输入类型
									anchor : '100%'
								}, {
									fieldLabel : '整数输入',
									name : 'num1',
									xtype : 'numberfield', // 设置为数字输入框类型
									allowDecimals : false, // 是否允许输入小数
									allowNegative : false, // 是否允许输入负数
									maxValue : 9999, // 允许输入的最大值
									minValue : 1000, // 允许输入的最小值
									anchor : '100%'
								}, {
									fieldLabel : '小数/负数',
									name : 'num2',
									xtype : 'numberfield',
									decimalPrecision : 3,// 小数精度
									anchor : '100%'
								}]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">Form布局(缺省平铺布局)</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 380, // 窗口宽度
						height : 250, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						animateTarget : Ext.getBody(),
						pageY : 20, // 页面定位Y坐标
						pageX : document.body.clientWidth / 2 - 380 / 2, // 页面定位X坐标
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
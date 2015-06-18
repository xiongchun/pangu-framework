/**
 * 表单：日期时间输入组件
 * 
 * @author XiongChun
 * @since 2010-08-20
 */
Ext.onReady(function() {
			var firstForm = new Ext.form.FormPanel({
						id : 'firstForm',
						name : 'firstForm',
						labelWidth : 75, // 标签宽度
						defaultType : 'textfield', // 表单元素默认类型
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						items : [{
							        xtype : 'datefield',
									fieldLabel : '日期输入1', // 标签
									name : 'data1', // name:后台根据此name属性取值 
									format:'Y-m-d', //日期格式化
									value:new Date(),
									anchor : '100%' // 宽度百分比
								},{
							        xtype : 'datefield',
									fieldLabel : '日期输入2', // 标签
									name : 'data2', // name:后台根据此name属性取值 
									format:'Y年m月d日', //日期格式化
									disabledDays:[0,6], //禁止选择的星期
									disabledDaysText:'禁止选择星期天和星期6',
									anchor : '100%' // 宽度百分比
								},{
							        xtype : 'datefield',
									fieldLabel : '日期输入3', // 标签
									name : 'data3', // name:后台根据此name属性取值 
									format:'Y-m-d', //日期格式化
									maxValue:'2010-12-31', //允许选择的最大日期
									minValue:'2010-01-01', //允许选择的最小日期
									anchor : '100%' // 宽度百分比
								},{
							        xtype : 'datetimefield',
									fieldLabel : '日期时间11', // 标签
									//maxValue : new Date('2011-08-11 17:55:04'), //允许选择的最大时间    
									//maxValue : new Date(2011, 8, 11, 17, 0),
									name : 'time1', // name:后台根据此name属性取值 
									anchor : '100%' // 宽度百分比
								},{
							        xtype : 'datefield',
									fieldLabel : '年月输入1', // 标签
									name : 'month1', // name:后台根据此name属性取值 
									format:'Y-m', //日期格式化
									plugins:'monthPickerPlugin',
									anchor : '100%' // 宽度百分比
								}]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">日期时间输入框</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 320, // 窗口宽度
						height : 220, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						pageY : 20, //页面定位Y坐标
						pageX : document.body.clientWidth / 2 - 300 / 2, //页面定位X坐标
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
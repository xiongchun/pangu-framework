/**
 * 表单：下拉选择框(本地数据源)
 * 
 * @author XiongChun
 * @since 2010-08-20
 */
Ext.onReady(function() {
			// 准备本地数据
			var store = new Ext.data.SimpleStore({
						fields : ['name', 'code'],
						data : [['云南省', '0001'], ['北京市', '0002'], ['四川省', '0003'], ['香港特别行政区', '0004']]
					});

			var firstForm = new Ext.form.FormPanel({
						id : 'firstForm',
						name : 'firstForm',
						labelWidth : 50, // 标签宽度
						// frame : true, //是否渲染表单面板背景色
						defaultType : 'textfield', // 表单元素默认类型
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						items : [new Ext.form.ComboBox({
											id : 'id_area1',
											hiddenName : 'area1',
											fieldLabel : '请选择',
											triggerAction : 'all',
											store : store,
											displayField : 'name',
											valueField : 'code',
											mode : 'local',
											listWidth : 120, // 下拉列表的宽度,默认为下拉选择框的宽度
											forceSelection : true,
											typeAhead : true,
											value : '0002',
											resizable : true,
											anchor : '95%'
										}), new Ext.form.ComboBox({
											id : 'id_area2',
											hiddenName : 'area2',
											fieldLabel : '请选择',
											emptyText : '请选择',
											triggerAction : 'all',
											store : store,
											displayField : 'name',
											valueField : 'code',
											mode : 'local',
											forceSelection : false, // 选中内容必须为下拉列表的子项
											editable : false,
											typeAhead : true,
											// value:'0002',
											resizable : true,
											anchor : '95%'
										})],
						tbar : [{
									text : '取值',
									iconCls : 'lockIcon',
									handler : function() {
										var value = firstForm.findById('id_area1').getValue();
										Ext.MessageBox.alert('提示', '选择框1的值为：' + value);
									}
								},'-', {
									text : '禁用',
									iconCls : 'deleteIcon',
									handler : function() {
										firstForm.findById('id_area1').disable();
										firstForm.findById('id_area1').addClass('x-custom-field-disabled');
										Ext.MessageBox.alert('提示', '选择框1被禁用');
									}
								}, {
									text : '激活',
									iconCls : 'acceptIcon',
									handler : function() {
										firstForm.findById('id_area1').enable();
										firstForm.findById('id_area1').removeClass('x-custom-field-disabled');
										Ext.MessageBox.alert('提示', '选择框1被激活');
									}
								}]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">下拉选择框(本地数据源)</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 300, // 窗口宽度
						height : 250, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						pageY : 20, // 页面定位Y坐标
						pageX : document.body.clientWidth / 2 - 300 / 2, // 页面定位X坐标
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
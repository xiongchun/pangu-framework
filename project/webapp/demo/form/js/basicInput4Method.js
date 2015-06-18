/**
 * 表单：文本框(行为方法)
 * 
 * @author XiongChun
 * @since 2010-08-20
 */
Ext.onReady(function() {
	var firstForm = new Ext.form.FormPanel({
		id : 'firstForm',
		name : 'firstForm',
		labelWidth : 65, // 标签宽度
		// frame : true, // 是否渲染表单面板背景色
		defaultType : 'textfield', // 表单元素默认类型
		labelAlign : 'right', // 标签对齐方式
		bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
		items : [{
			fieldLabel : '普通文本1', // 标签
			id : 'name1',
			name : 'name1', // name:后台根据此name属性取值
			// 添加一个监听事件
			listeners : {
				'blur' : function(obj) {
					Ext.Msg.alert('提示', '普通文本1的[onblur]事件被触发,输入值为：'
									+ obj.getValue());
				}
			},
			anchor : '100%' // 宽度百分比
		}, {
			fieldLabel : '普通文本2', // 标签
			id : 'name2',
			name : 'name2', // name:后台根据此name属性取值
			value : '熊春',
			anchor : '100%' // 宽度百分比
		}, {
			fieldLabel : '普通文本3', // 标签
			id : 'name3',
			// hideLabel :true,
			name : 'name3', // name:后台根据此name属性取值
			anchor : '100%'// 宽度百分比
		}],
		tbar : [{
			text : '只读',
			iconCls : 'lockIcon',
			handler : function() {
				firstForm.findById('name3').setReadOnly(true);
				firstForm.findById('name3').addClass('x-custom-field-disabled');
			}
		}, {
			text : '编辑',
			iconCls : 'page_edit_1Icon',
			handler : function() {
				firstForm.findById('name3').setReadOnly(false);
				firstForm.findById('name3').removeClass('x-custom-field-disabled');
			}
		}, '-', {
			text : '禁用',
			iconCls : 'deleteIcon',
			handler : function() {
				firstForm.findById('name2').disable();
				firstForm.findById('name2').addClass('x-custom-field-disabled');
			}
		}, {
			text : '激活',
			iconCls : 'acceptIcon',
			handler : function() {
				firstForm.findById('name2').enable();
				firstForm.findById('name2')
						.removeClass('x-custom-field-disabled');
			}
		}],
		bbar : [{
			text : '隐藏',
			handler : function() {
				firstForm.findById('name2').hide();
				firstForm.findById('name2').getEl().up('.x-form-item')
						.setDisplayed(false);
			}
		}, {
			text : '显示',
			handler : function() {
				firstForm.findById('name2').show();
				firstForm.findById('name2').getEl().up('.x-form-item')
						.setDisplayed(true);
			}
		}, '-', {
			text : '赋值',
			handler : function() {
				firstForm.get('name1').setValue('反,道之动.');

			}
		}, {
			text : '取值',
			handler : function() {
				// 三种写法都必须给输入框显式指定ID属性
				// firstForm.findById('name3').getValue();
				// Ext.get('name3').getValue()
				var value = firstForm.get('name3').getValue();
				Ext.MessageBox.alert('提示', '普通文本3的值为：' + value);
			}
		}, {
			text : '焦点',
			handler : function() {
				var value = firstForm.get('name1').focus();
			}
		}]
	});

	var firstWindow = new Ext.Window({
				title : '<span class="commoncss">输入框(属性配置)</span>', // 窗口标题
				layout : 'fit', // 设置窗口布局模式
				width : 400, // 窗口宽度
				height : 250, // 窗口高度
				closable : false, // 是否可关闭
				collapsible : true, // 是否可收缩
				maximizable : true, // 设置是否可以最大化
				border : false, // 边框线设置
				constrain : true, // 设置窗口是否可以溢出父容器
				pageY : 20, // 页面定位X坐标
				pageX : document.body.clientWidth / 2 - 400 / 2, // 页面定位Y坐标
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
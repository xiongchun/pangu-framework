/**
 * 表单：表单同步提交
 * 
 * @author XiongChun
 * @since 2011-03-22
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
							fieldLabel : '文本1', // 标签
							name : 'text1', // name:后台根据此name属性取值
							value : '甄子丹',
							allowBlank : false,
							anchor : '100%' // 宽度百分比
						}, {
							fieldLabel : '文本2', // 标签
							name : 'text2', // name:后台根据此name属性取值
							value : '熊春',
							anchor : '100%' // 宽度百分比
						}, {
							fieldLabel : '文本3', // 标签
							name : 'text3', // name:后台根据此name属性取值
							value : '托尼贾',
							anchor : '100%' // 宽度百分比
						}]
			});

	var firstWindow = new Ext.Window({
				title : '<span class="commoncss">表单同步提交(提交完成后进行页面跳转)</span>', // 窗口标题
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
				buttons : [{ // 窗口底部按钮配置
					text : '同步提交,提交后跳转', // 按钮文本
					iconCls : 'acceptIcon', // 按钮图标
					handler : function() { // 按钮响应函数
						submitTheForm();
					}
				}]
			});
	firstWindow.show(); // 显示窗口

	/**
	 * 表单同步提交
	 */
	function submitTheForm() {
		if (!firstForm.form.isValid()) {
			return;
		}
		firstForm.getForm().getEl().dom.action = 'formDemo.do?reqCode=formSynForwardInit';
		firstForm.getForm().getEl().dom.submit();
	}

});
/**
 * 客户端异常演示
 * 
 * @author XiongChun
 * @since 2012-08-20
 */
Ext.onReady(function() {
			var firstForm = new Ext.form.FormPanel({
						id : 'firstForm',
						name : 'firstForm',
						labelWidth : 40, // 标签宽度
						// frame : true, // 是否渲染表单面板背景色
						defaultType : 'textfield', // 表单元素默认类型
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						items : [{
									fieldLabel : '文本1', // 标签
									name : 'text1', // name:后台根据此name属性取值
									allowBlank : true,
									anchor : '100%' // 宽度百分比
								}]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">演示客户端请求异常处理</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 580, // 窗口宽度
						height : 120, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						pageY : 20, // 页面定位X坐标
						pageX : document.body.clientWidth / 2 - 580 / 2, // 页面定位Y坐标
						items : [firstForm], // 嵌入的表单面板
						buttons : [{ // 窗口底部按钮配置
							text : '请求1(form.submit)', // 按钮文本
							iconCls : 'acceptIcon', // 按钮图标
							handler : function() { // 按钮响应函数
								submitTheForm();
							}
						}, {	// 窗口底部按钮配置
									text : '请求2(ajax.request)', // 按钮文本
									iconCls : 'acceptIcon', // 按钮图标
									handler : function() { // 按钮响应函数
										submitTheFormBasedAjaxRequest();
									}
								}, { // 窗口底部按钮配置
									text : '请求3(form.load)', // 按钮文本
									iconCls : 'acceptIcon', // 按钮图标
									handler : function() { // 按钮响应函数
										loadCallBack();
									}
								}, { // 窗口底部按钮配置
									text : '请求4(data.store.load)', // 按钮文本
									iconCls : 'acceptIcon', // 按钮图标
									handler : function() { // 按钮响应函数
										loadCallBack();
									}
								}]
					});
			firstWindow.show(); // 显示窗口

			/**
			 * 表单提交(表单自带Ajax提交)
			 */
			function submitTheForm() {
				if (!firstForm.form.isValid())
					return;
				firstForm.form.submit({
							url : 'otherDemo.do?reqCode=doError',
							waitTitle : '提示',
							method : 'POST',
							waitMsg : '正在处理数据,请稍候...',
							success : function(form, action) {
								Ext.MessageBox.alert('提示', action.result.msg);
							}
						});
			}

			/**
			 * 表单提交(Ext.Ajax提交)
			 */
			function submitTheFormBasedAjaxRequest() {
				if (!firstForm.form.isValid())
					return;
				var params = firstForm.getForm().getValues();
				params.text4 = '文本4附加参数';
				Ext.Ajax.request({
							url : 'otherDemo.do?reqCode=doError',
							success : function(response, opts) {
								var resultArray = Ext.util.JSON
										.decode(response.responseText);
								Ext.Msg.alert('提示', resultArray.msg);
							},
							params : params
						});
			}

			// 表单加载数据的回调函数
			function loadCallBack() {
				firstForm.form.load({
							waitMsg : '正在读取信息',// 提示信息
							waitTitle : '提示',// 标题
							url : 'otherDemo.do?reqCode=doError',// 请求的url地址
							// method : 'GET',// 请求方式
							success : function(form, action) {// 加载成功的处理函数
								Ext.Msg.alert('提示', '数据读取成功');
							}
						});
			}

			// 表格数据查询
			function storeLoad() {
				var store = new Ext.data.Store({
							// 获取数据的方式
							proxy : new Ext.data.HttpProxy({
										url : 'otherDemo.do?reqCode=doError'
									}),
							// 数据读取器
							reader : new Ext.data.JsonReader({
										totalProperty : 'TOTALCOUNT', // 记录总数
										root : 'ROOT' // Json中的列表数据根节点
									}, [{
												name : 'xmid' // Json中的属性Key值
											}])
						});
				store.load();
			}

		});
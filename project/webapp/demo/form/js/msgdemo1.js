/**
 * 表单：表单交互(提交、数据填充)
 * 
 * @author XiongChun
 * @since 2010-08-20
 */
Ext.onReady(function() {
			var btn1 = new Ext.Button({
						text : '提示框1',
						applyTo : 'btn1_div',
						handler : function() {
							Ext.MessageBox.alert('提示', '最简单的书写方式,<b>无进程阻塞!</b>');
							// alert('我不会被上面的提示窗口阻塞哦!');
						}
					});
var btn2 = new Ext.Button({
			text : '提示框2',
			applyTo : 'btn2_div',
			handler : function() {
				// 对话框的回调函数
				Ext.MessageBox.alert('提示', '有进程阻塞!', function() {
							alert('我刚才被阻塞掉了,我靠!');
						});
			}
		});
			var btn3 = new Ext.Button({
						text : '确认框1',
						applyTo : 'btn3_div',
						handler : function() {
							Ext.MessageBox.show({
										title : '提示',
										msg : '你是纯爷们吗？',
										buttons : Ext.MessageBox.YESNO,
										animEl : Ext.getBody(),
										icon : Ext.MessageBox.QUESTION,
										fn : function(btn) {
											// 回调函数
											if (btn == 'yes') {
												// 是
												alert(btn + ' 是');
											} else {
												// 否
												alert(btn + ' 否');
											}
										}
									});

						}
					});
			var btn4 = new Ext.Button({
						text : '输入框',
						applyTo : 'btn4_div',
						handler : function() {
							Ext.MessageBox.show({
										title : '提示',
										msg : '请输入您的地址信息：',
										width : 300,
										buttons : Ext.MessageBox.OKCANCEL,
										multiline : true, // 是否可以输入多行
										// 动画淡入淡出参考点
										animEl : Ext.getBody(),
										fn : function(btn, text) {
											if (btn == 'ok') {
												alert('你输入的值为:' + text);
											}
										}
									});
						}
					});

			var btn5 = new Ext.Button({
						text : '确认框2',
						applyTo : 'btn5_div',
						handler : function() {
							// 确认框的简单写法
							Ext.MessageBox.confirm('请确认', '你是纯爷们吗?', function(btn) {
										alert(btn);
									})
						}
					});

			var btn6 = new Ext.Button({
						text : '等待框',
						applyTo : 'btn6_div',
						handler : function() {
							Ext.MessageBox.show({
										title : '请等待',
										msg : '正在初始化...',
										width : 300,
										wait : true,
										waitConfig : {
											interval : 200
										}, // 滚动条的速度
										closable : false
									});
							// 在处理成功的回调函数中关闭等待窗口
							// Ext.MessageBox.hide();
						}
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">消息对话框</span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 400, // 窗口宽度
						height : 100, // 窗口高度
						// tbar : tb, // 工具栏
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						pageY : 20, // 页面定位Y坐标
						pageX : document.body.clientWidth / 2 - 400 / 2, // 页面定位X坐标
						constrain : true,
						// 设置窗口是否可以溢出父容器
						items : [new Ext.Panel({
									contentEl : 'btn'
								})]
					});
			firstWindow.show(); // 显示窗口
		});
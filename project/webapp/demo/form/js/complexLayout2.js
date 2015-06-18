/**
 * 表单综合布局
 * 
 * @author XiongChun
 * @since 2010-11-20
 */
Ext.onReady(function() {
			var myForm = new Ext.form.FormPanel({
						collapsible : false,
						border : true,
						labelWidth : 60, // 标签宽度
						// frame : true, //是否渲染表单面板背景色
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 0', // 表单元素和表单面板的边距
						buttonAlign : 'center',
						height : 250,
						items : [{
									layout : 'column',
									border : false,
									items : [{
												columnWidth : .33,
												layout : 'form',
												labelWidth : 65, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '项目ID',
															name : 'xmid',
															id : 'xmid',
															disabled : true,
															fieldClass : 'x-custom-field-disabled',
															xtype : 'textfield', // 设置为数字输入框类型
															anchor : '100%'
														}, {
															fieldLabel : '项目热键',
															name : 'xmrj',
															maxLength : 20,
															anchor : '100%'
														}, {
															fieldLabel : '报销比例',
															name : 'zfbl',
															maxValue : 1,
															decimalPrecision : 2,// 小数精度
															allowBlank : false,
															xtype : 'numberfield',
															labelStyle : 'color:blue;',
															anchor : '100%'
														}]
											}, {
												columnWidth : .33,
												layout : 'form',
												labelWidth : 60, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '项目名称', // 标签
															name : 'xmmc', // name:后台根据此name属性取值
															maxLength : 20, // 可输入的最大文本长度,不区分中英文字符
															allowBlank : false,
															labelStyle : 'color:blue;',
															anchor : '100%'// 宽度百分比
														}, {
															fieldLabel : '规格',
															name : 'gg',
															xtype : 'textfield', // 设置为文字输入框类型
															maxLength : 25,
															anchor : '100%'
														}, new Ext.form.ComboBox({
																	hiddenName : 'jx',
																	fieldLabel : '剂型',
																	triggerAction : 'all',
																	emptyText : '请选择',
																	store : new Ext.data.SimpleStore({
																				fields : ['name', 'code'],
																				data : [['注射剂', '注射剂'], ['乳膏', '乳膏'], ['片剂', '片剂']]
																			}),
																	displayField : 'name',
																	valueField : 'code',
																	mode : 'local',
																	forceSelection : false, // 选中内容必须为下拉列表的子项
																	editable : false,
																	typeAhead : true,
																	resizable : true,
																	allowBlank : false,
																	anchor : '100%'
																})]
											}, {
												columnWidth : .33,
												layout : 'form',
												labelWidth : 60, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [new Ext.form.ComboBox({
																	hiddenName : 'sfdlbm',
																	fieldLabel : '项目大类',
																	emptyText : '请选择',
																	triggerAction : 'all',
																	store : new Ext.data.SimpleStore({
																				fields : ['name', 'code'],
																				data : [['西药', '01'], ['中成药', '02']]
																			}),
																	displayField : 'name',
																	valueField : 'code',
																	mode : 'local',
																	forceSelection : false, // 选中内容必须为下拉列表的子项
																	editable : false,
																	typeAhead : true,
																	// value:'0002',
																	resizable : true,
																	allowBlank : false,
																	labelStyle : 'color:blue;',
																	anchor : '100%'
																}), new Ext.form.ComboBox({
																	hiddenName : 'dw',
																	fieldLabel : '单位',
																	emptyText : '请选择',
																	triggerAction : 'all',
																	store : new Ext.data.SimpleStore({
																				fields : ['name', 'code'],
																				data : [['瓶', '瓶'], ['盒', '盒']]
																			}),
																	displayField : 'name',
																	valueField : 'code',
																	mode : 'local',
																	forceSelection : false, // 选中内容必须为下拉列表的子项
																	editable : false,
																	typeAhead : true,
																	// value:'0002',
																	resizable : true,
																	allowBlank : false,
																	labelStyle : 'color:blue;',
																	anchor : '100%'
																}), new Ext.form.ComboBox({
																	hiddenName : 'qybz',
																	fieldLabel : '启用标志',
																	triggerAction : 'all',
																	store : new Ext.data.SimpleStore({
																				fields : ['name', 'code'],
																				data : [['启用', '1'], ['停用', '0']]
																			}),
																	displayField : 'name',
																	valueField : 'code',
																	mode : 'local',
																	forceSelection : false, // 选中内容必须为下拉列表的子项
																	editable : false,
																	typeAhead : true,
																	value : '1',
																	resizable : true,
																	allowBlank : false,
																	labelStyle : 'color:blue;',
																	anchor : '100%'
																})]
											}]
								}, {
									layout : 'column',
									border : false,
									items : [{
												columnWidth : .33,
												layout : 'form',
												labelWidth : 60, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															xtype : 'datefield',
															fieldLabel : '生效时间', // 标签
															name : 'ggsj', // name:后台根据此name属性取值
															format : 'Y-m-d', // 日期格式化
															value : new Date(),
															anchor : '100%' // 宽度百分比
														}]
											}, {
												columnWidth : .67,
												layout : 'form',
												labelWidth : 60, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '产地',
															name : 'cd',
															maxLength : 50,
															anchor : '99%'
														}]
											}]
								}, {
									fieldLabel : '备注',
									name : 'remark',
									xtype : 'textarea',
									maxLength : 100,
									emptyText : '备注信息.(说明:此字段仅用来演示表单跨列布局,数据不进行持久化)',
									anchor : '99%'
								}]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">综合布局2<span>', // 窗口标题
						layout : 'fit', // 设置窗口布局模式
						width : 600, // 窗口宽度
						height : 260, // 窗口高度
						closable : false, // 是否可关闭
						collapsible : true, // 是否可收缩
						maximizable : true, // 设置是否可以最大化
						border : false, // 边框线设置
						constrain : true, // 设置窗口是否可以溢出父容器
						pageY : 20, // 页面定位Y坐标
						animateTarget : Ext.getBody(),
						pageX : document.body.clientWidth / 2 - 600 / 2, // 页面定位X坐标
						items : [myForm], // 嵌入的表单面板
						buttons : [{
									text : '重置',
									iconCls : 'tbar_synchronizeIcon',
									handler : function() {
										myForm.getForm().reset();
									}
								}]
					});
			firstWindow.show(); // 显示窗口

		});
/**
 * 综合实例：查询1
 * 
 * @author XiongChun
 * @since 2010-11-20
 */
Ext.onReady(function() {
			var qForm = new Ext.form.FormPanel({
						region : 'north',
						margins : '3 3 3 3',
						title : '<span class="commoncss">查询条件<span>',
						collapsible : true,
						border : true,
						labelWidth : 90, // 标签宽度
						// frame : true, //是否渲染表单面板背景色
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:3 5 0', // 表单元素和表单面板的边距
						buttonAlign : 'center',
						height : 125,
						items : [{
									layout : 'column',
									border : false,
									items : [{
												columnWidth : .33,
												layout : 'form',
												labelWidth : 60, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '个人编码',
															name : 'grbm',
															xtype : 'textfield', // 设置为数字输入框类型
															anchor : '100%'
														}, {
															fieldLabel : '现年龄从',
															name : 'xnl1',
															xtype : 'numberfield', // 设置为数字输入框类型
															allowDecimals : false, // 是否允许输入小数
															allowNegative : false, // 是否允许输入负数
															maxValue : 120,
															anchor : '100%'
														}]
											}, {
												columnWidth : .33,
												layout : 'form',
												labelWidth : 60, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '姓名', // 标签
															id : 'xm',
															name : 'xm', // name:后台根据此name属性取值
															allowBlank : true, // 是否允许为空
															maxLength : 6, // 可输入的最大文本长度,不区分中英文字符
															anchor : '100%' // 宽度百分比
														}, {
															fieldLabel : '到',
															name : 'xnl2',
															xtype : 'numberfield', // 设置为数字输入框类型
															allowDecimals : false, // 是否允许输入小数
															allowNegative : false, // 是否允许输入负数
															maxValue : 120,
															anchor : '100%'
														}]
											}, {
												columnWidth : .33,
												layout : 'form',
												labelWidth : 60, // 标签宽度
												defaultType : 'textfield',
												border : false,
												items : [{
															fieldLabel : '单位名称', // 标签
															name : 'dwmc', // name:后台根据此name属性取值
															maxLength : 20, // 可输入的最大文本长度,不区分中英文字符
															allowBlank : true,
															anchor : '100%'// 宽度百分比
														}]
											}]
								}],
						buttons : [{
									text : '查询',
									iconCls : 'previewIcon',
									handler : function() {
										queryBalanceInfo(qForm.getForm());
									}
								}, {
									text : '重置',
									iconCls : 'tbar_synchronizeIcon',
									handler : function() {
										qForm.getForm().reset();
									}
								}]
					});

			// 定义自动当前页行号
			var rownum = new Ext.grid.RowNumberer({
						header : 'NO',
						width : 28
					});

			// 定义列模型
			var cm = new Ext.grid.ColumnModel([rownum, {
				header : '结算顺序号', // 列标题
				dataIndex : 'sxh', // 数据索引:和Store模型对应
				width : 200,
				sortable : true
					// 是否可排序
				}, {
				header : '个人编码',
				dataIndex : 'grbm',
				sortable : true
			}, {
				header : '姓名',
				dataIndex : 'xm'
			}, {
				header : '性别',
				dataIndex : 'xb'
			}, {
				header : '现年龄',
				dataIndex : 'xnl'
			}, {
				header : '费用总额',
				dataIndex : 'fyze'
			}, {
				header : '医保报销',
				dataIndex : 'ybbx'
			}, {
				header : '自付金额',
				dataIndex : 'zfje'
			}, {
				header : '结算时间',
				dataIndex : 'jssj'
			}, {
				header : '就诊医院',
				dataIndex : 'yymc'
			}]);

			/**
			 * 数据存储
			 */
			var store = new Ext.data.Store({
						// 获取数据的方式
						proxy : new Ext.data.HttpProxy({
									url : 'integrateDemo.do?reqCode=queryBalanceInfo'
								}),
						// 数据读取器
						reader : new Ext.data.JsonReader({
									totalProperty : 'TOTALCOUNT', // 记录总数
									root : 'ROOT' // Json中的列表数据根节点
								}, [{
											name : 'sxh' // Json中的属性Key值
										}, {
											name : 'grbm'
										}, {
											name : 'xm'
										}, {
											name : 'xb'
										}, {
											name : 'xnl'
										}, {
											name : 'fyze'
										}, {
											name : 'ybbx'
										}, {
											name : 'zfje'
										}, {
											name : 'jssj'
										}, {
											name : 'yymc'
										}])
					});

			// 翻页排序时带上查询条件
			store.on('beforeload', function() {
						this.baseParams = qForm.getForm().getValues();
					});
			// 每页显示条数下拉选择框
			var pagesize_combo = new Ext.form.ComboBox({
						name : 'pagesize',
						triggerAction : 'all',
						mode : 'local',
						store : new Ext.data.ArrayStore({
									fields : ['value', 'text'],
									data : [[10, '10条/页'], [20, '20条/页'], [50, '50条/页'], [100, '100条/页'], [250, '250条/页'], [500, '500条/页']]
								}),
						valueField : 'value',
						displayField : 'text',
						value : '20',
						editable : false,
						width : 85
					});

			// 改变每页显示条数reload数据
			pagesize_combo.on("select", function(comboBox) {
						bbar.pageSize = parseInt(comboBox.getValue());
						number = parseInt(comboBox.getValue());
						store.reload({
									params : {
										start : 0,
										limit : bbar.pageSize
									}
								});
					});
			var number = parseInt(pagesize_combo.getValue());
			// 分页工具栏
			var bbar = new Ext.PagingToolbar({
						pageSize : number,
						store : store,
						displayInfo : true,
						displayMsg : '显示{0}条到{1}条,共{2}条',
						plugins : new Ext.ux.ProgressBarPager(), // 分页进度条
						emptyMsg : "没有符合条件的记录",
						items : ['-', '&nbsp;&nbsp;', pagesize_combo]
					});

			// 表格实例
			var grid = new Ext.grid.GridPanel({
						region : 'center', // 和VIEWPORT布局模型对应，充当center区域布局
						margins : '3 3 3 3',
						// collapsible : true,
						border : false,
						// 表格面板标题,默认为粗体，我不喜欢粗体，这里设置样式将其格式为正常字体
						title : '<span class="commoncss">病人结算信息</span>',
						// height : 500,
						autoScroll : true,
						frame : true,
						store : store, // 数据存储
						stripeRows : true, // 斑马线
						cm : cm, // 列模型
						bbar : bbar,// 分页工具栏
						viewConfig : {
							// 不产横向生滚动条, 各列自动扩展自动压缩, 适用于列数比较少的情况
							forceFit : true
						},
						loadMask : {
							msg : '正在加载表格数据,请稍等...'
						}
					});

			// 布局
			var viewport = new Ext.Viewport({
						layout : 'border',
						items : [qForm, grid]
					});

			// 查询表格数据
			function queryBalanceInfo(pForm) {
				var params = pForm.getValues();
				params.start = 0;
				params.limit = bbar.pageSize;
				store.load({
							params : params
						});
			}

		});
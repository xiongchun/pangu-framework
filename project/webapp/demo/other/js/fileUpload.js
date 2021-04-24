/**
 * 文件上传
 * 
 * @author XiongChun
 * @since 2010-10-20
 */
Ext.onReady(function() {
	var mode = "http";
	// 复选框
	var sm = new Ext.grid.CheckboxSelectionModel();

	// 定义自动当前页行号
	var rownum = new Ext.grid.RowNumberer({
				header : 'NO',
				width : 28
			});

	// 定义列模型
	var cm = new Ext.grid.ColumnModel([rownum, sm, {
				header : '下载', // 列标题
				dataIndex : 'download',
				width : 35,
				renderer : downloadColumnRender
			}, {
				header : '文件ID',
				dataIndex : 'fileid',
				sortable : true
			}, {
				header : '标题',
				dataIndex : 'title',
				width : 180
			}, {
				header : '大小(byte)',
				dataIndex : 'filesize'
			}, {
				header : '存储路径',
				dataIndex : 'path',
				id : 'id_path',
				width : 280
			}, {
				header : '描述',
				dataIndex : 'remark'
			}]);

	/**
	 * 数据存储
	 */
	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : 'otherDemo.do?reqCode=queryFileDatas'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'TOTALCOUNT',
							root : 'ROOT'
						}, [{
									name : 'fileid'
								}, {
									name : 'title'
								}, {
									name : 'path'
								}, {
									name : 'filesize'
								}, {
									name : 'remark'
								}])
			});

	// 翻页排序时带上查询条件
	store.on('beforeload', function() {
				this.baseParams = {
					title : Ext.getCmp('filetitle').getValue()
				};
			});
	// 每页显示条数下拉选择框
	var pagesize_combo = new Ext.form.ComboBox({
				name : 'pagesize',
				triggerAction : 'all',
				mode : 'local',
				store : new Ext.data.ArrayStore({
							fields : ['value', 'text'],
							data : [[10, '10条/页'], [20, '20条/页'],
									[50, '50条/页'], [100, '100条/页'],
									[250, '250条/页'], [500, '500条/页']]
						}),
				valueField : 'value',
				displayField : 'text',
				value : '20',
				editable : false,
				width : 85
			});
	var number = parseInt(pagesize_combo.getValue());
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

	// 表格工具栏
	var tbar = new Ext.Toolbar({
				items : [{
							text : '上传[传统Web模式]',
							iconCls : 'uploadIcon',
							handler : function() {
								mode = 'http';
								firstWindow.show();
							}
						}, '-', {
							text : '上传[Flash组件模式]',
							iconCls : 'uploadIcon',
							handler : function() {
								win_swfupload.show();
							}
						}, '-', {
							text : '删除文件',
							iconCls : 'deleteIcon',
							handler : function() {
								delFiles();
							}
						}, '->', {
							xtype : 'textfield',
							id : 'filetitle',
							name : 'filetitle',
							emptyText : '请输入文件标题',
							width : 150,
							enableKeyEvents : true,
							// 响应回车键
							listeners : {
								specialkey : function(field, e) {
									if (e.getKey() == Ext.EventObject.ENTER) {
										queryFiles();
									}
								}
							}
						}, {
							text : '查询',
							iconCls : 'page_findIcon',
							handler : function() {
								queryFiles();
							}
						}, {
							text : '刷新',
							iconCls : 'page_refreshIcon',
							handler : function() {
								store.reload();
							}
						}]
			});

	// 表格实例
	var grid = new Ext.grid.GridPanel({
				title : '<span class="commoncss">文件列表</span>',
				height : 500,
				frame : true,
				autoScroll : true,
				region : 'center', // 和VIEWPORT布局模型对应，充当center区域布局
				margins : '3 3 3 3',
				store : store, // 数据存储
				stripeRows : true, // 斑马线
				autoExpandColumn : 'id_path',
				cm : cm, // 列模型
				sm : sm, // 复选框
				tbar : tbar, // 表格工具栏
				bbar : bbar,// 分页工具栏
				viewConfig : {
	// 不产横向生滚动条, 各列自动扩展自动压缩, 适用于列数比较少的情况
				// forceFit : true
				},
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				}
			});

	grid.on("cellclick", function(pGrid, rowIndex, columnIndex, e) {
				var store = pGrid.getStore();
				var record = store.getAt(rowIndex);
				var fieldName = pGrid.getColumnModel()
						.getDataIndex(columnIndex);
				// columnIndex为小画笔所在列的索引,缩阴从0开始
				// 这里要非常注意!!!!!
				if (fieldName == 'download' && columnIndex == 2) {
					var fileid = record.get("fileid");
					// 通过iFrame实现类ajax文件下载
					// 这个很重要
					var downloadIframe = document.createElement('iframe');
					downloadIframe.src = 'otherDemo.do?reqCode=downloadFile&fileid='
							+ fileid;
					downloadIframe.style.display = "none";
					document.body.appendChild(downloadIframe);
				}
			});

	// 页面初始自动查询数据
	store.load({
				params : {
					start : 0,
					limit : bbar.pageSize
				}
			});

	// 布局模型
	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [grid]
			});

	var firstForm = new Ext.form.FormPanel({
				id : 'firstForm',
				name : 'firstForm',
				fileUpload : true, // 一定要设置这个属性,否则获取不到上传对象的
				labelWidth : 60,
				defaultType : 'textfield',
				labelAlign : 'right',
				bodyStyle : 'padding:5 5 5 5',
				items : [{
							fieldLabel : '选择文件',
							id : 'file1',
							name : 'file1', // 必须为file1/file2/file3/file4/file5.目前Web标准上传模式支持最多5个文件的批量上传
							xtype : 'fileuploadfield', // 上传字段
							allowBlank : false,
							anchor : '100%'
						}, {
							fieldLabel : '文件标题',
							id : 'title',
							name : 'title',
							disabled : true,
							fieldClass : 'x-custom-field-disabled',
							anchor : '100%'
						}, {
							fieldLabel : '文件描述',
							id : 'remark',
							name : 'remark',
							xtype : 'textarea',
							anchor : '100%'
						}]
			});

	var firstWindow = new Ext.Window({
				title : '<span class="commoncss">上传[传统Web模式]</span>', // 窗口标题
				layout : 'fit', // 设置窗口布局模式
				width : 500, // 窗口宽度
				height : 200, // 窗口高度
				closable : true, // 是否可关闭
				collapsible : true, // 是否可收缩
				maximizable : true, // 设置是否可以最大化
				closeAction : 'hide',
				animCollapse : true,
				animateTarget : Ext.getBody(),
				border : false, // 边框线设置
				constrain : true, // 设置窗口是否可以溢出父容器
				// pageY : 20, // 页面定位X坐标
				pageX : document.body.clientWidth / 2 - 500 / 2, // 页面定位Y坐标
				items : [firstForm], // 嵌入的表单面板
				buttons : [{ // 窗口底部按钮配置
					text : '上传', // 按钮文本
					iconCls : 'uploadIcon', // 按钮图标
					handler : function() { // 按钮响应函数
						submitTheForm();
					}
				}, {	// 窗口底部按钮配置
							text : '重置', // 按钮文本
							iconCls : 'tbar_synchronizeIcon', // 按钮图标
							handler : function() { // 按钮响应函数
								firstForm.form.reset();
							}
						}]
			});

	// SWFUpload窗口
	var win_swfupload = new Ext.Window({
				title : '<span class="commoncss">上传[Flash组件模式]</span>',
				width : 500,
				height : 350,
				resizable : false,
				layout : 'fit',
				constrain : true,
				closeAction : 'hide',
				maximizable : true,
				listeners : {
					'hide' : function(obj) {
						store.reload();
					}
				},
				items : [{
					xtype : 'uploadpanel',
					uploadUrl : webContext
							+ '/demo/otherDemo.do?reqCode=doUploadBasedFlah',
					filePostName : 'swfUploadFile',
					flashUrl : webContext
							+ '/resource/myux/uploadpanel/swf/swfupload.swf',
					fileSize : '800MB',
					border : false,
					fileTypes : '*.*', // 在这里限制文件类型:'*.jpg,*.png,*.gif'
					fileTypesDescription : '所有文件',
					postParams : {
						postType : 1
						// path : 'upload\\' //这只是个参数,由后台来读取;也可以直接由后台来分配路径
					}
				}]
			});

	/**
	 * 表单提交(表单自带Ajax提交)
	 */
	function submitTheForm() {
		if (!firstForm.form.isValid()) {
			return;
		}
		if (runMode == '0') {
			Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
			return;
		}
		if (mode == 'ftp') {
			// Ext.Msg.alert('提示', '此演示需要FTP服务器配合,请直接查看后台代码.');
			// return;
		}
		var requesturl = 'otherDemo.do?reqCode=doUpload';
		if (mode == 'ftp') {
			requesturl = 'otherDemo.do?reqCode=doUploadByFTP';
		}
		firstForm.form.submit({
					url : requesturl,
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在上传文件,请稍候...',
					timeout : 60000, // 60s
					success : function(form, action) {
						firstForm.form.reset();
						firstWindow.hide();
						if (mode == 'http')
							store.reload();
						Ext.MessageBox.alert('提示', action.result.msg);

					},
					failure : function(response) {
						Ext.MessageBox.alert('提示', '文件上传失败');
					}
				});
	}

	// 查询表格数据
	function queryFiles() {
		store.load({
					params : {
						start : 0,
						limit : bbar.pageSize,
						title : Ext.getCmp('filetitle').getValue()
					}
				});
	}

	// 获取选择行
	function getCheckboxValues() {
		// 返回一个行集合JS数组
		var rows = grid.getSelectionModel().getSelections();
		if (Ext.isEmpty(rows)) {
			Ext.MessageBox.alert('提示', '您没有选中任何数据!');
			return;
		}
		// 将JS数组中的行级主键，生成以,分隔的字符串
		var strChecked = jsArray2JsString(rows, 'fileid');
		Ext.MessageBox.alert('提示', strChecked);
		// 获得选中数据后则可以传入后台继续处理
	}

	// 生成一个下载图标列
	function downloadColumnRender(value) {
		return "<a href='javascript:void(0);'><img src='" + webContext
				+ "/resource/image/ext/download.png'/></a>";;
	}

	/**
	 * 删除文件
	 */
	function delFiles() {
		if (runMode == '0') {
			Ext.Msg.alert('提示', '系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
			return;
		}
		var rows = grid.getSelectionModel().getSelections();
		if (Ext.isEmpty(rows)) {
			Ext.Msg.alert('提示', '请先选中要删除的文件!');
			return;
		}
		var strChecked = jsArray2JsString(rows, 'fileid');
		Ext.Msg.confirm('请确认', '你真的要删除选中的文件吗?', function(btn, text) {
					if (btn == 'yes') {
						showWaitMsg();
						Ext.Ajax.request({
									url : 'otherDemo.do?reqCode=delFiles',
									success : function(response) {
										var resultArray = Ext.util.JSON
												.decode(response.responseText);
										Ext.Msg.alert('提示', resultArray.msg);
										store.reload();
									},
									failure : function(response) {
										Ext.Msg.alert('提示', "文件删除失败");
									},
									params : {
										strChecked : strChecked
									}
								});
					}
				});
	}

});
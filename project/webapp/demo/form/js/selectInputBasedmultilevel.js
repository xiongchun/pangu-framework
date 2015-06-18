/**
 * 表单：下拉选择框(N级联动)
 * 
 * @author XiongChun
 * @since 2010-10-20
 */
Ext.onReady(function() {
			var provinceStore = new Ext.data.Store({
						proxy : new Ext.data.HttpProxy({
									url : 'formDemo.do?reqCode=queryAreaDatas'
								}),
						reader : new Ext.data.JsonReader({}, [{
											name : 'value'
										}, {
											name : 'text'
										}]),
						baseParams : {
							areacodelength : '2'
						}
					});
			// areaStore.load(); //如果mode : 'local',时候才需要手动load();

			var provinceCombo = new Ext.form.ComboBox({
						hiddenName : 'area',
						fieldLabel : '省',
						emptyText : '请选择省份...',
						triggerAction : 'all',
						store : provinceStore,
						displayField : 'text',
						valueField : 'value',
						loadingText : '正在加载数据...',
						mode : 'remote', // 数据会自动读取,如果设置为local又调用了store.load()则会读取2次；也可以将其设置为local，然后通过store.load()方法来读取
						forceSelection : true,
						typeAhead : true,
						resizable : true,
						editable : false,
						anchor : '100%'
					});

			provinceCombo.on('select', function() {
						cityCombo.reset();
						countyCombo.reset();
						var value = provinceCombo.getValue();
						cityStore.load({
									params : {
										areacode : value
									}
								});
					});

			var cityStore = new Ext.data.Store({
						proxy : new Ext.data.HttpProxy({
									url : 'formDemo.do?reqCode=queryAreaDatas'
								}),
						reader : new Ext.data.JsonReader({}, [{
											name : 'value'
										}, {
											name : 'text'
										}]),
						baseParams : {
							areacodelength : '4'
						}
					});

			var cityCombo = new Ext.form.ComboBox({
						hiddenName : 'area',
						fieldLabel : '州、市',
						emptyText : '请选择州市...',
						triggerAction : 'all',
						store : cityStore,
						displayField : 'text',
						valueField : 'value',
						loadingText : '正在加载数据...',
						mode : 'local', // 数据会自动读取,如果设置为local又调用了store.load()则会读取2次；也可以将其设置为local，然后通过store.load()方法来读取
						forceSelection : true,
						typeAhead : true,
						resizable : true,
						editable : false,
						anchor : '100%'
					});

			cityCombo.on('select', function() {
						countyCombo.reset();
						var value = cityCombo.getValue();
						countyStore.load({
									params : {
										areacode : value
									}
								});
					});

			var countyStore = new Ext.data.Store({
						proxy : new Ext.data.HttpProxy({
									url : 'formDemo.do?reqCode=queryAreaDatas'
								}),
						reader : new Ext.data.JsonReader({}, [{
											name : 'value'
										}, {
											name : 'text'
										}]),
						baseParams : {
							areacodelength : '6'
						}
					});

			var countyCombo = new Ext.form.ComboBox({
						hiddenName : 'area',
						fieldLabel : '县、区',
						emptyText : '请选择县区...',
						triggerAction : 'all',
						store : countyStore,
						displayField : 'text',
						valueField : 'value',
						loadingText : '正在加载数据...',
						mode : 'local', // 数据会自动读取,如果设置为local又调用了store.load()则会读取2次；也可以将其设置为local，然后通过store.load()方法来读取
						forceSelection : true,
						typeAhead : true,
						resizable : true,
						editable : false,
						anchor : '100%'
					});

			var firstForm = new Ext.form.FormPanel({
						id : 'firstForm',
						name : 'firstForm',
						labelWidth : 50, // 标签宽度
						// frame : true, //是否渲染表单面板背景色
						defaultType : 'textfield', // 表单元素默认类型
						labelAlign : 'right', // 标签对齐方式
						bodyStyle : 'padding:5 5 5 5', // 表单元素和表单面板的边距
						items : [provinceCombo, cityCombo, countyCombo]
					});

			var firstWindow = new Ext.Window({
						title : '<span class="commoncss">下拉选择框(省市县三级联动)</span>', // 窗口标题
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
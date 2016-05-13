<%@ page contentType="text/html; charset=utf-8"%>




<!--
AOS应用基础平台
http://git.oschina.net/osworks/AOS
-->
<!DOCTYPE html>
<html>
<head>
<title>组合选择框</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="AOS应用基础平台">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<link rel="shortcut icon" href="/aos/static/icon/ico/aos2.ico" />
<link rel="stylesheet" type="text/css" href="/aos/static/weblib/awesome/css/font-awesome.min.css" />
<style type="text/css">
.ux-notification-light {
	background-image: url('/aos/static/image/notification/blue.png');
}

.x-tree-node-text {
	cursor: pointer;
}
</style>
<link rel="stylesheet" type="text/css" href="/aos/static/weblib/ext/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="/aos/static/css/skin/blue.css" />
<link rel="stylesheet" type="text/css" href="/aos/static/css/aos-all.css" />
<script type="text/javascript" src="/aos/static/weblib/ext/bootstrap.js"></script>
<script type="text/javascript" src="/aos/static/weblib/ext/locale/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="/aos/static/js/aos.js"></script>


<base href="http://localhost:1690/aos/demo/ui/" />
</head>
<style type="text/css">
body {
	background-color: #FFFFFF !important;
	background-attachment: fixed !important;
	background-position: bottom center !important;
	background-repeat: repeat-x !important;
	background-image: url("/aos/static/image/background/main/blue.png")
		!important;
}
</style>
<body id="_id_a259a2ee">
</body>

<script type="text/javascript">
	Ext.Loader.setConfig({
		enabled : true,
		paths : {
			'Ext.ux' : '/aos/static/weblib/ext/ux',
			'AOS.ux' : '/aos/static/weblib/myux'
		}
	});
	Ext.require('AOS.ux.Notification');
	Ext.Ajax.timeout = 120000;
	Ext.Ajax.on('beforerequest', function(conn, options, eopts) {
		Ext.Ajax.extraParams = {
			'app' : '169'
		};
	});
	Ext.Ajax.on('requestexception', function(conn, response, options, eopts) {
		if (response.status === 500) {
			Ext.Msg.alert('提示', response.responseText);
		} else if (response.status === 0) {
			Ext.Msg.alert('提示', response.responseText);
		} else {
			Ext.Msg.alert('提示', response.responseText);
		}
	});
	var x_field_required = '<span class="mustinput-label">*</span>';
	Ext
			.onReady(function() {
				Ext.QuickTips.init();
				Ext.form.Field.prototype.msgTarget = 'under';
				var _bank_1_store = Ext.create('Ext.data.Store', {
					fields : [ 'value', 'display', 'c', 'd' ],
					proxy : {
						type : 'ajax',
						url : 'listComboBoxData.jhtml',
						reader : {
							type : 'json'
						}
					}
				});
				var _bank_1_cfg = {
					id : '_bank_1',
					xtype : 'combobox',
					columnWidth : 0.5,
					fieldCls : 'app-form-fieldcls',
					fieldLabel : '一级节点',
					name : 'bank_1_',
					emptyText : '请选择分行...',
					editable : false,
					padding : '0 0 5 0',
					hiddenName : 'bank_1_',
					forceSelection : true,
					editable : false,
					queryMode : 'remote',
					displayField : 'display',
					valueField : 'value',
					store : _bank_1_store,
					app : 169
				};
				var _bank_1 = Ext
						.create('Ext.form.field.ComboBox', _bank_1_cfg);
				_bank_1.on('select', fn_bank1_onselect);
				var _bank_2_store = Ext.create('Ext.data.Store', {
					fields : [ 'value', 'display', 'c', 'd' ],
					proxy : {
						type : 'ajax',
						url : 'listComboBoxData2.jhtml',
						reader : {
							type : 'json'
						}
					}
				});
				var _bank_2_cfg = {
					id : '_bank_2',
					xtype : 'combobox',
					columnWidth : 0.49,
					fieldCls : 'app-form-fieldcls',
					fieldLabel : '二级节点',
					name : 'bank_2_',
					emptyText : '请选择支行...',
					editable : false,
					padding : '0 0 5 0',
					hiddenName : 'bank_2_',
					forceSelection : true,
					editable : false,
					queryMode : 'local',
					displayField : 'display',
					valueField : 'value',
					store : _bank_2_store,
					app : 169
				};
				var _bank_2 = Ext.create('Ext.form.field.ComboBox',_bank_2_cfg);
var _id_deb18a70_cfg = {
					id : '_id_deb18a70',
					xtype : 'fieldset',
					style : {
						backgroundColor : '#FFFFFF'
					},
					columnWidth : 1,
					layout : 'column',
					loader : {},
					title : '<span class="app-container-title-normal">多级联动下拉选择框</span>',
					collapsible : true,
					defaults : {
						anchor : '100%',
					},
					fieldDefaults : {
						labelWidth : 90,
						labelAlign : 'right',
					},
					defaultType : 'textfield',
					padding : '0 0 3 0',
					app : 169
				};
var _id_deb18a70 = Ext.create('Ext.form.FieldSet',_id_deb18a70_cfg);
Ext.getCmp('_id_deb18a70').add(_bank_1);
Ext.getCmp('_id_deb18a70').add(_bank_2);
var _f_info_cfg = {
					id : '_f_info',
					xtype : 'formpanel',
					width : 650,
					icon : '/aos/static/icon/icon152.png',
					style : {
						backgroundColor : '#FFFFFF'
					},
					layout : 'column',
					constrain : true,
					loader : {},
					autoRender : true,
					autoShow : true,
					title : '<span class="app-container-title-normal">组合选择框</span>',
					bodyPadding : '5',
					defaults : {
						anchor : '100%',
					},
					fieldDefaults : {
						labelAlign : 'right',
						msgTarget : 'qtip',
					},
					defaultType : 'textfield',
					app : 169
				};
				var _f_info = Ext.create('Ext.form.Panel', _f_info_cfg);
				Ext.getCmp('_f_info').add(_id_deb18a70);
				var _id_77dec691_cfg = {
					id : '_id_77dec691',
					xtype : 'viewport',
					loader : {},
					app : 169
				};
				var _id_77dec691 = Ext.create('Ext.container.Viewport',
						_id_77dec691_cfg);
				Ext.getCmp('_id_77dec691').add(_f_info);
				_f_info.center();
				Ext.EventManager.onWindowResize(function() {
					var left = (Ext.getBody().getViewSize().width - _f_info
							.getWidth()) / 2;
					var top = (Ext.getBody().getViewSize().height - _f_info
							.getHeight()) / 2;
					_f_info.setPosition(left, top, true)
				});
				function fn_bank1_onselect(me, records, eOpts) {
					var parent_id_ = me.getValue();
					_bank_2_store.getProxy().extraParams = {
						parent_id_ : parent_id_
					};
					_bank_2_store.load();
				}
			});
</script>
</html>
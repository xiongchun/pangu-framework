

<%@ page contentType="text/html; charset=utf-8"%>




<!--
AOS JavaEE应用开发套件
http://git.oschina.net/osworks/AOS
-->
<!DOCTYPE html>
<html>

<!-- =========head开始 ==========-->
<head>
<base href="http://localhost:10010/aosuite/http/" />
<title>表单组件</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="AOS应用基础平台">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<link rel="shortcut icon" href="/aosuite/static/image/ico/aos.ico" />
<link rel="stylesheet" type="text/css" href="/aosuite/static/weblib/awesome/css/font-awesome.min.css" />
<style type="text/css">
.ux-notification-light {
	background-image: url('/aosuite/static/image/notification/blue.png');
}
</style>
<link rel="stylesheet" type="text/css" href="/aosuite/static/weblib/ext/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="/aosuite/static/css/skin/blue.css" />
<link rel="stylesheet" type="text/css" href="/aosuite/static/css/aos-all.css" />
<script type="text/javascript" src="/aosuite/static/weblib/ext/ext-all.js"></script>
<script type="text/javascript" src="/aosuite/static/weblib/ext/locale/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="/aosuite/static/js/aos.js"></script>

</head>
<!-- =========head结束 ==========-->

<body id="_id_6cbb70c2">
</body>
</html>

<link rel="stylesheet" type="text/css" href="/aosuite/static/weblib/myux/clearbutton/css/ClearButton.css" />
<script type="text/javascript">
	Ext.Loader.setConfig({
		enabled : true,
		paths : {
			'Ext.ux' : '/aosuite/static/weblib/ext/ux',
			'AOS.ux' : '/aosuite/static/weblib/myux'
		}
	});
	Ext.require('AOS.ux.Notification');
	Ext.require('AOS.ux.clearbutton.ClearButton');
	Ext.Ajax.timeout = 120000;
	Ext.Ajax.on('beforerequest', function(conn, options, eopts) {
		Ext.Ajax.extraParams = {
			'juid' : Ext.util.Cookies.get('juid'),
			'app' : '169'
		};
	});
	Ext.Ajax.on('requestexception', function(conn, response, options, eopts) {
		if (response.status == 500) {
			AOS.err(response.responseText);
		} else if (response.status === 0) {
			AOS.err(response.responseText);
		} else {
			AOS.err(response.responseText);
		}
	});
	var x_field_required = '<span class="mustinput-label">*</span>';
	Ext.onReady(function() {
		Ext.QuickTips.init();
		Ext.form.Field.prototype.msgTarget = '$msgtarget_';
		var _id_471ed0bf_cfg = {
			id : '_id_471ed0bf',
			xtype : 'textfield',
			columnWidth : 0.25,
			fieldCls : 'app-form-fieldcls',
			fieldLabel : '绑定KeyDown事件',
			name : 'event5',
			emptyText : 'KeyDown事件',
			padding : '0 0 5 0',
			plugins : [ 'clearbutton' ],
			enableKeyEvents: true,
			app : 169
		};
		var _id_471ed0bf = Ext.create('Ext.form.field.Text', _id_471ed0bf_cfg);
		 _id_471ed0bf.on('keydown', fn_onkeydown);
		var _id_ac02d1e9_cfg = {
			id : '_id_ac02d1e9',
			xtype : 'textfield',
			columnWidth : 0.25,
			fieldCls : 'app-form-fieldcls',
			fieldLabel : '绑定KeyUP事件',
			name : 'event6',
			emptyText : 'KeyUP事件',
			padding : '0 0 5 0',
			enableKeyEvents: true,
			app : 169
		};
		var _id_ac02d1e9 = Ext.create('Ext.form.field.Text', _id_ac02d1e9_cfg);
		 _id_ac02d1e9.on('keyup', fn_onkeyup);
		var form3_cfg = {
			id : 'form3',
			xtype : 'formpanel',
			region : 'center',
			width : 200,
			border : true,
			autoScroll : true,
			margin : '5',
			style : {
				backgroundColor : '#FFFFFF'
			},
			layout : 'column',
			anchor : '100%',
			constrain : true,
			loader : {},
			title : '<span class="app-container-title-normal">表单3：事件绑定</span>',
			bodyPadding : '5',
			defaults : {
				anchor : '100%',
			},
			fieldDefaults : {
				labelWidth : 110,
				labelAlign : 'right',
			},
			defaultType : 'textfield',
			app : 169
		};
		var form3 = Ext.create('Ext.form.Panel', form3_cfg);
		Ext.getCmp('form3').add(_id_471ed0bf);
		Ext.getCmp('form3').add(_id_ac02d1e9);
		var _id_137d6142_cfg = {
			id : '_id_137d6142',
			xtype : 'viewport',
			layout : 'border',
			loader : {},
			app : 169
		};
		var _id_137d6142 = Ext.create('Ext.container.Viewport',
				_id_137d6142_cfg);
		Ext.getCmp('_id_137d6142').add(form3);
		function fn_onkeydown() {
			alert(1);
		}
		function fn_onkeyup() {
			alert(1);
		}
	});
</script>
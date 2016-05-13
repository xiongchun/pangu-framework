<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="开关状态切换标签">
	<aos:include lib="ext" />
	<style type="text/css">
body {
	padding: 8px;
}

.custom-color label.x-toggle-slide-label-on {
	background: #83B264;
	color: #F9FBF7;
	text-shadow: 0px 0px 2px #346817;
}

.custom-color label.x-toggle-slide-label-off {
	background: #C56333;
	color: #7F1F06;
	text-shadow: 1px 0px 1px #DD9A78;
	text-shadow: 1px 1px -1px #D7875F;
	text-align: right;
	text-shadow: 1px 1px -1px #D7875F;
}
</style>
</aos:head>
<aos:body>
	<div id="_my01"></div>
	<br>
	<table>
		<tr>
			<td><div id="_my02"></div></td>
			<td><div id="_my03"></div></td>
			<td><div id="_my04"></div></td>
			<td><div id="_my05"></div></td>
			<td><div id="_my06"></div></td>
		</tr>
	</table>
</aos:body>
<aos:onready>
	<aos:formpanel id="_myform" renderTo="_my01" width="500" layout="column" labelWidth="80" collapsible="true"
		title="状态切换组件演示">
		<aos:docked>
			<aos:toggle offText="坏蛋" onText="好人" state="false" />
			<aos:dockeditem xtype="tbseparator" />
			<aos:dockeditem xtype="tbfill" />
			<aos:textfield fieldLabel="基地名称" name="name1" width="250" />
			<aos:toggle offText="坏蛋" onText="好人" state="true" />
		</aos:docked>
		<aos:textfield name="name" fieldLabel="账户" columnWidth="1" />
		<aos:toggle name="toggle1" fieldLabel="是否共党" offText="否" onText="是" state="true" columnWidth="0.25" />
		<aos:toggle name="toggle2" fieldLabel="卡状态" offText="注销" onText="正常" state="false" columnWidth="0.35" />
		<aos:toggle name="toggle3" offText="我是国民党" onText="我是共产党" state="true" columnWidth="0.4" />
		<aos:textfield name="card" fieldLabel="银行卡号" columnWidth="1" />
		<aos:toggle name="toggle4" id="_toggle2" fieldLabel="隐藏切换手柄" offText="蒋总统也万岁！" onText="毛主席万岁！" state="true"
			resizeHandle="false" columnWidth="0.4" />
		<aos:docked dock="bottom" ui="default">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem xtype="button" onclick="fnsubmit" icon="ok1.png" text="获取表单值" />
			<aos:dockeditem xtype="button" onclick="fnreset" icon="refresh1.png" text="重置表单" />
		</aos:docked>
	</aos:formpanel>
	<aos:toggle offText="否" onText="是" state="true" renderTo="_my02" onchang="_fn_onchange" />
	<aos:toggle offText="注销" onText="正常" state="false" renderTo="_my03" />
	<%-- 自定义显示样式 --%>
	<aos:toggle id="_toggle1" offText="国民党" onText="共产党" cls="custom-color" state="true" renderTo="_my04" />
	<aos:toggle offText="蒋总统也万岁！" onText="毛主席万岁！" resizeHandle="false" renderTo="_my05" />
	<aos:toggle xtype="togglefield" offText="否" onText="是" state="true" renderTo="_my06" />
	<script type="text/javascript">
		//切换
		function _fn_onchange(toggle, state) {
			AOS.info(state.toString());
		}

		//重置
		function fnreset() {
			_myform.form.reset();
		}

		//获取表单值
		function fnsubmit() {
			var values = _myform.getValues();
			AOS.info(Ext.encode(values));
		}

		//定时自动切换
		AOS.task(function() {
			_toggle1.toggle();
		}, 1000);
	</script>
</aos:onready>

</aos:html>
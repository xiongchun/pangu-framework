<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="StatusBar标签">
	<aos:include lib="ext" var="user,sysCfg" />
	<style>
.app-x-status-ok {
	padding-left: 25px !important;
	background: transparent no-repeat 3px 0;
	background-image: url(${cxt}/static/icon/ok1.png);
}
</style>
</aos:head>
<aos:body>
	<div id="_id_01"></div>
</aos:body>
<aos:onready>
	<aos:panel id="_id_panel1" collapsible="true" width="500" titleCollapse="true" html="AOS应用基础平台" bodyPadding="5"
		renderTo="_id_01" layout="fit" title="状态栏">
		<aos:docked id="_id_statusbar" xtype="statusbar" dock="bottom" iconCls="app-x-status-init" text="初始完成"
			defaultText="缺省文本信息">
			<aos:dockeditem xtype="button" text="正在加载" onclick="fnBusy()" />
			<aos:dockeditem xtype="button" text="加载完成" onclick="fnOk" />
			<aos:dockeditem xtype="tbseparator" />
			<aos:dockeditem xtype="button" text="清除" onclick="fnClear" />
		</aos:docked>
	</aos:panel>
	<script type="text/javascript">
		function fnBusy() {
			_id_statusbar.showBusy('正在加载...');
		}

		function fnOk() {
			_id_statusbar.setStatus({
				text : '加载完成',
				iconCls : 'app-x-status-ok',
				//设置的text是否会在一段间隔后自动消失并显示toobar设置的defaultText
				clear : true
			});
		}

		function fnClear() {
			_id_statusbar.clearStatus();
		}
	</script>
</aos:onready>
</aos:html>
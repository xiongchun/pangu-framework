<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body id="my01">
</aos:body>
<aos:onready>
	<aos:formpanel renderTo="my01" width="1024" layout="column" labelWidth="40" collapsible="true" title="个人基本信息"
		center="true">
		<aos:textfield fieldLabel="姓名1" name="name" columnWidth="0.5">
			<aos:on fn="fntest" event="change" />
		</aos:textfield>
		<aos:textfield fieldLabel="年龄" name="age" columnWidth="0.3" />
		<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.2" />
		<aos:textfield fieldLabel="年龄" name="age" columnWidth="0.5" />
		<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.5" />
		<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.3" />
		<aos:fillfield columnWidth="0.7" />
		<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.5" />
	</aos:formpanel>
	<script type="text/javascript">
		function fntest() {
			alert('ok');
		}
	</script>
</aos:onready>
</aos:html>
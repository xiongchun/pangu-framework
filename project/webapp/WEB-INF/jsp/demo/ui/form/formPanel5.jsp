<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body id="my01">
</aos:body>
<aos:onready>
	<aos:formpanel renderTo="my01" width="800" layout="column" margin="5" titleCollapse="true" labelWidth="60"
		collapsible="true" title="个人基本信息" center="true">
		<aos:fieldset title="银行卡" columnWidth="1">
			<aos:textfield fieldLabel="姓名1" name="age" columnWidth="0.3" />
			<aos:textfield fieldLabel="姓名2" name="name" columnWidth="0.2" />
			<aos:button text="查询" margin="0 0 0 10" onclick="fntest" />
		</aos:fieldset>
		<aos:fieldset title="卡信息" columnWidth="1">
			<aos:textfield fieldLabel="姓名4" name="name" columnWidth="0.5" />
			<aos:textfield fieldLabel="姓名5" name="name" columnWidth="0.3" />
			<aos:textfield fieldLabel="姓名6" name="name" columnWidth="0.2" />
			<aos:textfield fieldLabel="姓名4" name="name" columnWidth="0.5" />
			<aos:textfield fieldLabel="姓名5" name="name" columnWidth="0.3" />
			<aos:textfield fieldLabel="姓名6" name="name" columnWidth="0.2" />
		</aos:fieldset>
		<aos:textfield fieldLabel="姓名4" name="name" columnWidth="1" />
		<aos:textfield fieldLabel="姓名5" name="name" columnWidth="0.3" />
		<aos:textfield fieldLabel="姓名6" name="name" columnWidth="0.2" />
		<aos:textfield fieldLabel="姓名4" name="name" columnWidth="0.5" />
		<aos:textfield fieldLabel="姓名5" name="name" columnWidth="0.3" />
		<aos:textfield fieldLabel="姓名6" name="name" columnWidth="0.7" />
	</aos:formpanel>
	<script type="text/javascript">
		function fntest() {
			alert('忆江南');
		}
	</script>
</aos:onready>
</aos:html>
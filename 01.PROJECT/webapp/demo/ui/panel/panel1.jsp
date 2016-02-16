<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="Panel标签">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:panel id="_id_panel1" autoShow="true" icon="vcard.png" collapsible="true" titleCollapse="true" margin="2"
		bodyPadding="5" layout="fit" title="测试1" width="800" html="测试" any="titleAlign:'center',maxWidth:800">
		<aos:tool type="search" tooltip="设置" onclick="!fntest" />
		<aos:tool type="plus" tooltip="搜索" onclick="!fntest" />

	</aos:panel>
	<script type="text/javascript">
		function fntest(panel, tool, event) {
			alert(panel.title);
		}
	</script>
</aos:onready>
</aos:html>
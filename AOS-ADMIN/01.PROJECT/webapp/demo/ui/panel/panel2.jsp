<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="Panel标签">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:panel id="_id_panel1" icon="vcard.png" collapsible="true" titleCollapse="true" margin="2" bodyPadding="5"
		autoShow="true" layout="fit" title="测试1" width="800" html="测试">
		<aos:on event="collapse" fn="fntest" delay="1000" />
		<aos:tool type="search" tooltip="设置" onclick="fntest" />
		<aos:tool type="plus" tooltip="搜索" onclick="fntest" />
		<aos:docked dock="top">
			<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
			<aos:dockeditem xtype="button" onclick="fntest" text="测试" />
			<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
		</aos:docked>
	</aos:panel>

	<script type="text/javascript">
		function fntest() {
			alert('ok');
		}
	</script>
</aos:onready>
</aos:html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:panel region="north" frame="false" html="OSWorks" height="60" border="false">
		</aos:panel>
		<aos:panel region="west" title="系统导航" split="true" maxWidth="250" minWidth="100" html="OSWorks" width="180"
			collapsible="true">
		</aos:panel>
		<aos:panel icon="vcard.png" layout="border" region="center" title="测试1">
			<aos:docked dock="top">
				<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
			</aos:docked>
			<aos:panel icon="vcard.png" headerBorder="0 1 1" region="center" title="嵌套1" html="测试" bodyPadding="5">

			</aos:panel>

			<aos:panel region="west" collapseMode="mini" split="true" headerBorder="0 0 0" bodyBorder="1 1 1 0" maxWidth="250"
				minWidth="100" html="OSWorks" title="系统导航1" width="180" collapsible="true">

			</aos:panel>
		</aos:panel>

	</aos:viewport>
	<script type="text/javascript">
		function fntest() {
			alert('169Studio');
		}
	</script>
</aos:onready>
</aos:html>
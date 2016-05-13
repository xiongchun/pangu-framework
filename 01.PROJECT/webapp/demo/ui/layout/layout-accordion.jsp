<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:panel region="west" renderTo="!document.body" height="500" margin="5" split="true" title="accordion布局" width="200"
		collapsible="true">
		<aos:layout type="accordion" activeOnTop="false" hideCollapseTool="true" animate="true" />
		<aos:panel title="第一栏" html="第一栏" bodyPadding="5">
			<aos:docked dock="top" border="false">
				<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
				<aos:dockeditem xtype="button" onclick="fntest" text="测试" />
				<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
			</aos:docked>
		</aos:panel>
		<aos:panel title="第二栏" html="第二栏" bodyPadding="5">

		</aos:panel>
	</aos:panel>
	<script type="text/javascript">
		function fntest() {
			alert('169Studio');
		}
	</script>
</aos:onready>
</aos:html>
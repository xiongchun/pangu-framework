<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:panel id="id_panels" region="center" layout="column" bodyPadding="5" height="400" margin="20" split="true"
			title="anchor布局" width="600" collapsible="true">
			<aos:panel title="第一列" html="第一列" width="80">
			</aos:panel>
			<aos:panel title="第二列" html="第二列" columnWidth="0.2">
			</aos:panel>
			<aos:panel title="第三列" html="第三列" columnWidth="0.8">
			</aos:panel>
		</aos:panel>
	</aos:viewport>
</aos:onready>
</aos:html>
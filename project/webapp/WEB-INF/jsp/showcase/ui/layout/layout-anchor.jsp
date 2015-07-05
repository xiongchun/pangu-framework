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
		<aos:panel id="id_panels" region="center" layout="anchor" height="400" margin="20" split="true" title="anchor布局"
			width="450" collapsible="true" bodyPadding="5">
			<aos:panel title="上海" html="上海" bodyPadding="5" anchor="60% 30%" collapsible="true">
			</aos:panel>
			<aos:panel title="昆明" html="昆明" bodyPadding="5" anchor="-20" margin="5 0 5 0">
			</aos:panel>
			<aos:panel title="苏州" html="苏州" bodyPadding="5" anchor="100% -10">
			</aos:panel>
		</aos:panel>
	</aos:viewport>
</aos:onready>
</aos:html>
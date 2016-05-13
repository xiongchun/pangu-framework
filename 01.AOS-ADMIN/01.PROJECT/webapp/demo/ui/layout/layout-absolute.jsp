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
		<aos:panel id="id_panels" region="center" layout="absolute" height="400" margin="20" split="true" title="absolute布局"
			width="600" collapsible="true">
			<aos:panel title="上海" html="上海" width="100" height="100" x="20" y="5" collapsible="true">
			</aos:panel>
			<aos:panel title="昆明" html="昆明" width="200" x="150" y="20">
			</aos:panel>
			<aos:panel title="苏州" html="苏州" anchor="-20 -10" x="20" y="150">
			</aos:panel>
		</aos:panel>
	</aos:viewport>
</aos:onready>
</aos:html>
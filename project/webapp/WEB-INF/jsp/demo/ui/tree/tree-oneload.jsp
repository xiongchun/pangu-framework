<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
	<aos:base href="/showcase/tag/" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:window title="银行组织机构" autoShow="true" maximized="true" layout="fit" width="1024" height="600" maximizable="true">
		<aos:treepanel url="listAllTreeNodes.jhtml" />
	</aos:window>
	<script type="text/javascript">
		
	</script>
</aos:onready>
</aos:html>
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
	<aos:window title="磁盘文件目录" autoShow="true" maximized="true" layout="fit" width="1024" height="600" maximizable="true">
		<aos:treepanel id="mytree" url="listFileTree.jhtml" nodeParam="path" rootId="E:/北极星/01.应用开发平台/01.程序/"
			rootText="AOS Project" rootIcon="icon25.gif" />
	</aos:window>
	<script type="text/javascript">
		
	</script>
</aos:onready>
</aos:html>
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
	<aos:treepanel id="_myTree" title="后加载模式" url="listTreeNodes.jhtml" singleClick="false" renderTo="!document.body"
		margin="20" nodeParam="az02a3" rootExpanded="false">
		<aos:docked forceBoder="1 1 0 1">
			<aos:dockeditem onclick="_fn_read" text="读取树节点数据" icon="ok.png" />
		</aos:docked>
	</aos:treepanel>
	<script type="text/javascript">
		function _fn_read() {
			//在需要load的时候调用根节点的expand()方法，就会触发load()。
			_myTree.getRootNode().expand();
		}
	</script>
</aos:onready>
</aos:html>
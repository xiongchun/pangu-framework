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
	<aos:treepanel id="_myTree" title="级联选择树节点" cascade="true" url="listAllTreeNodes4Cascade.jhtml" singleClick="false"
		expandAll="true" renderTo="!document.body" margin="20">
		<aos:docked forceBoder="1 1 0 1">
			<aos:dockeditem onclick="_fn_select" text="查看选中节点" icon="ok.png" />
		</aos:docked>
	</aos:treepanel>
	<script type="text/javascript">
		function _fn_select() {
			var _selected = AOS.selection(_myTree, 'text');
			AOS.info(_selected);
		}
	</script>
</aos:onready>
</aos:html>
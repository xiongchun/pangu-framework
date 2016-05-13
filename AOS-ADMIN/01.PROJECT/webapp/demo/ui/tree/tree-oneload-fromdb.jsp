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
	<aos:treepanel id="_myTree" title="从数据库一次加载所有节点" cascade="true" url="listAllTreeNodes4FromDB.jhtml" singleClick="false"
		renderTo="!document.body" margin="20" rootText="功能模块菜单" rootId="p" height="600">
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
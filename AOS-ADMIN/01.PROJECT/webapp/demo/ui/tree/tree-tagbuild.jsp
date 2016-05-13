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
		<aos:treepanel id="mytree" expandAll="true" onitemclick="fnclick">
			<aos:treenode text="中国工商银行">
				<aos:treenode text="北京市分行" checked="false" />
				<aos:treenode text="上海市分行" checked="true" />
				<aos:treenode text="云南省分行">
					<aos:treenode text="昆明市支行" />
					<aos:treenode text="大理州支行" />
				</aos:treenode>
			</aos:treenode>
		</aos:treepanel>
	</aos:window>
	<script type="text/javascript">
		function fnclick(view, record, node, item, e) {
			//AOS.info("节点ID：" + record.raw.id + "; 文字：" + record.raw.text);
			if (record.isExpanded()) {
				//都可以
				view.collapse(record);
				//record.collapse();
			} else {
				record.expand();
			}
		}
	</script>
</aos:onready>
</aos:html>
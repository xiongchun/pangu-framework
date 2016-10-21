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
	<aos:window title="银行组织机构" autoShow="true"  layout="fit" width="800" height="600" maximizable="true" center="true">
		<aos:treepanel id="mytree" expandAll="true">
			<aos:menu>
				<aos:menuitem text="菜单1" onclick="fntest1" />
				<aos:menuitem text="菜单2" onclick="fntest1" />
			</aos:menu>
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
		function fntest1() {
			var record = AOS.selectone(mytree);
			AOS.info(record.raw.text);
		}
	</script>
</aos:onready>
</aos:html>
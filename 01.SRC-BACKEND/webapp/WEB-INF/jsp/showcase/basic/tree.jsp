<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="树组件" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="fit">
		<aos:panel border="false">
			<aos:layout type="hbox" align="stretch" />
			<aos:treepanel id="idTree1" flex="1" title="一次性加载" rootVisible="false" url="demoService.getTreeData" margin="5"
				border="true" onitemclick="fnclick" />

			<aos:treepanel id="idTree2" flex="1" title="一次性加载(复选树)" singleClick="false" cascade="true" rootVisible="false"
				url="demoService.getCheckboxTreeData" margin="5" border="true">
				<aos:docked forceBoder="1 1 0 1">
					<aos:dockeditem text="获取选中节点" onclick="fnChecked" />
				</aos:docked>
			</aos:treepanel>

			<aos:treepanel id="idTree3" flex="1" title="按需加载(展开树枝节点时加载数据)" singleClick="false" rootVisible="false"
				url="demoService.getAsyncTreeData" nodeParam="parent_id" rootId="0" margin="5" border="true" rootExpanded="true">
				<%-- 树节点右键菜单 --%>
				<aos:menu>
					<aos:menuitem text="刷新" icon="refresh.png" onclick="refresh" />
				</aos:menu>
			</aos:treepanel>

			<aos:treepanel id="idTree4" flex="1" title="标签组装树" expandAll="true" margin="5" border="true">
				<aos:treenode text="中国工商银行">
					<aos:treenode text="北京市分行" checked="false" />
					<aos:treenode text="上海市分行" checked="true" />
					<aos:treenode text="云南省分行">
						<aos:treenode text="昆明市支行" />
						<aos:treenode text="大理州支行" />
					</aos:treenode>
				</aos:treenode>
			</aos:treepanel>

		</aos:panel>

	</aos:viewport>

	<script type="text/javascript">
	
		function fnclick(view, record, node, item, e) {
			AOS.tip("节点ID：" + record.raw.id + "; 节点名称：" + record.raw.text);
		}
	
		//获取选中节点
		function fnChecked() {
			var checked = AOS.selection(idTree2, 'id');
			if(AOS.empty(checked)){
				AOS.info("请先选中节点");
				return;
			}
			AOS.info(checked);
		}

		//把treepanel属性rootExpanded="false"，则tree不会自动加载数据，需要调用这个api实现灵活的数据加载控制
		function fnLoad() {
			//在需要load的时候调用根节点的expand()方法，就会触发load()。
			idTree3.getRootNode().expand();
		}
		
		//刷新树枝节点
		function refresh() {
			var refreshnode = AOS.selectone(idTree3);
			if (!refreshnode) {
				refreshnode =idTree3.getRootNode();
			}
			if (refreshnode.isLeaf()) {
				refreshnode = refreshnode.parentNode;
			}
			idTree3_store.load({
				node : refreshnode,
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
					idTree3.getSelectionModel().select(refreshnode);
				}
			});
		}
		
	</script>
</aos:onready>
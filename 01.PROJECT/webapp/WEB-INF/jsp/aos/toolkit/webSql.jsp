<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="WebSQL">
	<aos:include lib="ext" />
	<aos:base href="system/webSql" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_dataobjs" width="260" region="west" url="listTables.jhtml" onitemclick="_g_dataobj_query"
			singleClick="false" useArrows="false" rootVisible="true" rootIcon="folder10.png" rootText="数据表" bodyBorder="0 1 0 0"
			headerBorder="0 1 0 0" rootId="0" header="false" collapsible="true" collapseMode="mini" split="true">
			<aos:docked forceBoder="0 1 1 0">
				<aos:triggerfield emptyText="${table_emptytext}" name="tablename" id="_tablename" onenterkey="_t_dataobjs_refresh"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_t_dataobjs_refresh" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="_t_dataobjs_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:tabpanel region="center" activeTab="0" bodyBorder="0 0 0 1" tabBarHeight="25">
			<aos:tab title="WebSQL" icon="sql3.png" border="false" layout="fit">
				<aos:panel html="该功能即将上线..." border="false" margin="5" />
			</aos:tab>
			<aos:tab title="数据" border="false" icon="table_edit.png" layout="fit">
				<aos:panel html="该功能即将上线..." border="false" margin="5" />
			</aos:tab>
			<aos:gridpanel id="_g_dataobj" title="字段" url="listTableCols.jhtml" icon="table2.png" onrender="_g_dataobj_query"
				border="false">
				<aos:docked forceBoder="0 0 1 0">
					<aos:triggerfield emptyText="${col_emptytext}" name="colname" id="_colname" onenterkey="_g_dataobj_query"
						trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_dataobj_query" width="180" />
				</aos:docked>
				<aos:menu>
					<aos:menuitem text="刷新" onclick="#_g_dataobj_store.reload();" icon="refresh.png" />
				</aos:menu>
				<aos:column type="rowno" />
				<aos:column header="主键" dataIndex="isPkey" rendererFn="fnKeyRenderer" width="50" />
				<aos:column header="字段名称" dataIndex="name" width="120" />
				<aos:column header="注释" dataIndex="comment" flex="1" width="150" maxWidth="250" celltip="true" />
				<aos:column header="数据类型" dataIndex="type" />
				<aos:column header="长度" dataIndex="length" width="50" />
				<aos:column header="小数点" dataIndex="scale" width="50" />
				<aos:column header="非空" dataIndex="notnull" rendererFn="fnNotnullRenderer" width="50" />
				<aos:column header="缺省值" dataIndex="defaultValue" hidden="true" />
				<aos:column header="所属表" dataIndex="tablename" width="120" flex="1" celltip="true" />
			</aos:gridpanel>
			<aos:tab title="表" border="false" icon="tables.png" layout="fit">
				<aos:panel html="该功能即将上线..." border="false" margin="5" />
			</aos:tab>
		</aos:tabpanel>

	</aos:viewport>
	<script type="text/javascript">
			//查询数据表列表
			function _g_dataobj_query() {
				var params = {
					colname : _colname.getValue()
				};
				var record = AOS.selectone(_t_dataobjs);
				if (!AOS.empty(record)) {
					params.tablename = record.raw.a;
				}
				_g_dataobj_store.getProxy().extraParams = params;
				_g_dataobj_store.loadPage(1);
			}

			//刷新分类树
			function _t_dataobjs_refresh() {
				var refreshnode = AOS.selectone(_t_dataobjs);
				if (!refreshnode) {
					refreshnode = _t_dataobjs.getRootNode();
				}
				if (refreshnode.isLeaf()) {
					refreshnode = refreshnode.parentNode;
				}
				var params = {
					tablename : _tablename.getValue()
				};
				_t_dataobjs_store.getProxy().extraParams = params;
				_t_dataobjs_store.load({
					node : refreshnode,
					callback : function() {
						//refreshnode.collapse();
						refreshnode.expand();
					}
				});
			}

			//主键Render
			function fnKeyRenderer(value) {
				if (value) {
					var src = '${cxt}/static/icon/key.png';
					return AOS.merge('<img src={0} />', src);
				} else {
					return '';
				}
			}

			//非空Render
			function fnNotnullRenderer(value) {
				if (value) {
					var src = '${cxt}/static/icon/ok5.png';
					return AOS.merge('<img src={0} />', src);
				} else {
					return '';
				}
			}

			//监听
			_t_dataobjs_store.on('load', function() {
				var node = _t_dataobjs.getRootNode();
				var text = '数据表';
				text = text + '(' + node.childNodes.length + ')';
				node.data.text = text;
			});
		</script>
</aos:onready>
</aos:html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="会话监控">
	<aos:include lib="ext" />
	<aos:base href="system/sessionLog" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_session" url="listSessions.jhtml" onrender="_g_session_query">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="当前会话列表" xtype="tbtext" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="登录账户或用户姓名" id="query_key_" onenterkey="_g_session_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_session_query" width="200" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="#_g_session_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:column type="rowno" />
			<aos:column header="会话ID" dataIndex="id_" width="200" />
			<aos:column header="用户ID" dataIndex="user_id_" hidden="true" />
			<aos:column header="登录账户" dataIndex="account_" width="120" />
			<aos:column header="用户姓名" dataIndex="user_name_" width="100" />
			<aos:column header="服务器节点" dataIndex="owner_"  width="140" />
			<aos:column header="客户端IP" dataIndex="ip_address_" width="120" />
			<aos:column header="客户端类型" dataIndex="client_type_" celltip="true"  minWidth="300" maxWidth="800" />
			<aos:column header="登录时间" dataIndex="create_time_" width="160" />
			<%-- <aos:column header="操作" rendererFn="fn_offline_render" align="center" width="60" /> --%>
		</aos:gridpanel>
	</aos:viewport>

	<script type="text/javascript">
	
		//加载表格数据
		function _g_session_query() {
			var params = {
					query_key_:query_key_.getValue()
			};
			_g_session_store.getProxy().extraParams = params;
			_g_session_store.loadPage(1);
		}
		
		//按钮列
		function fn_offline_render(value, metaData, record, rowIndex, colIndex, store){
			return '<input type="button" value="下线" class="cbtn" onclick="" />';
		}
	</script>
</aos:onready>
</aos:html>
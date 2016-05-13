<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="我的已办任务">
	<aos:include lib="ext" />
	<aos:base href="bpm/mytask" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_task" url="listDoneTasks.jhtml" onrender="_g_task_query" >
			<aos:docked>
				<aos:triggerfield emptyText="流程任务名称" id="name_" onenterkey="_g_task_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_task_query" width="200" />
			</aos:docked>
			<aos:column type="rowno" />
			<aos:column header="流程任务ID" dataIndex="id_" />
			<aos:column header="流程定义ID" dataIndex="proc_def_id_" hidden="true" />
			<aos:column header="流程实例ID" dataIndex="proc_inst_id_" hidden="true" />
			<aos:column header="执行流ID" dataIndex="execution_id_" hidden="true" />
			<aos:column header="任务名称" dataIndex="name_" width="150" celltip="true" />
			<aos:column header="所属流程实例" dataIndex="proc_inst_name_" width="150" celltip="true" />
			<aos:column header="拥有人" dataIndex="owner_" width="80" />
			<aos:column header="执行人" dataIndex="assignee_user_" width="80" />
			<aos:column header="持续时间[秒]" dataIndex="duration_s_" />
			<aos:column header="开始时间" dataIndex="start_time_" width="160" />
			<aos:column header="结束时间" dataIndex="end_time_" width="160" />
			<aos:column header="任务描述" dataIndex="description_" celltip="true"  />
			<aos:column header="优先级" dataIndex="priority_" width="60" hidden="true" />
			<aos:column header="数据版本" dataIndex="rev_" width="60" hidden="true" />
			<aos:column header="签收时间" dataIndex="claim_time_"  width="160" hidden="true" />			
		</aos:gridpanel>
	</aos:viewport>

	<script type="text/javascript">
		//查询流程任务列表
		function _g_task_query() {
			var params = {
				name_ : AOS.getValue('name_')
			};
			_g_task_store.getProxy().extraParams = params;
			_g_task_store.loadPage(1);
		}
	</script>
</aos:onready>
</aos:html>
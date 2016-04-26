<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="流程任务监管">
	<aos:include lib="ext" />
	<aos:base href="workflow/procTask" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_task" url="listProcTasks.jhtml" onrender="_g_task_query" >
			<aos:docked>
				<aos:dockeditem icon="user6.png" onclick="_fn_candidateTask" text="候选人[测试]" />
				<aos:dockeditem icon="del.png" onclick="_fn_delProcTask" text="删除" />
				<aos:dockeditem xtype="tbspacer"/>
				<aos:combobox emptyText="流程任务状态" dicField="proctask_status_" dicFilter="!2" id="proctask_status_" onchang="_g_task_query" width="120" />
				<aos:triggerfield emptyText="流程任务名称" id="name_" onenterkey="_g_task_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_task_query" width="200" />
			</aos:docked>
			<aos:column type="rowno" />
			<aos:column header="流程任务ID" dataIndex="id_" />
			<aos:column header="流程定义ID" dataIndex="proc_def_id_" hidden="true" />
			<aos:column header="流程实例ID" dataIndex="proc_inst_id_" hidden="true" />
			<aos:column header="执行流ID" dataIndex="execution_id_" hidden="true" />
			<aos:column header="任务名称" dataIndex="name_" width="150" celltip="true" />
			<aos:column header="拥有人" dataIndex="owner_" width="80" />
			<aos:column header="执行人" dataIndex="assignee_user_" width="80" />
			<aos:column header="任务状态" dataIndex="proctask_status_" rendererField="proctask_status_" width="80" />
			<aos:column header="活动状态" dataIndex="suspension_state_" rendererField="suspension_state_" dataType="number" width="80" />
			<aos:column header="委派状态" dataIndex="delegation_" rendererField="delegation_" width="80" />
			<aos:column header="开始时间" dataIndex="create_time_" width="160" />
			<aos:column header="签收时间" dataIndex="claim_time_" width="160" />
			<aos:column header="任务描述" dataIndex="description_" celltip="true" width="150" flex="1" />
			<aos:column header="优先级" dataIndex="priority_" width="60" hidden="true" />
			<aos:column header="数据版本" dataIndex="rev_" width="60" hidden="true" />
		</aos:gridpanel>
	</aos:viewport>

	<script type="text/javascript">
		//查询流程任务列表
		function _g_task_query() {
			var params = {
				proctask_status_ : AOS.getValue('proctask_status_'),
				name_ : AOS.getValue('name_')
			};
			_g_task_store.getProxy().extraParams = params;
			_g_task_store.loadPage(1);
		}
		
		//设置候选人
		function _fn_candidateTask(){
			var rec = AOS.selectone(_g_task); 
			AOS.ajax({
				url : 'candidateProcTask.jhtml',
				params : rec.data,
				ok : function(data) {
					AOS.tip(data.appmsg);
					_g_task_store.reload();
				}
			});
		}

		//删除流程任务
		function _fn_delProcTask() {
			var rec = AOS.selectone(_g_task); 
			var msg = AOS.merge('确认要删除流程任务[ID:{0}, 名称:{1}]吗？', rec.data.id_, rec.data.name_);
			AOS.confirm(msg, function(btn) {
				if (btn === 'cancel') {
					AOS.tip('操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'delProcTask.jhtml',
					params : rec.data,
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_task_store.reload();
					}
				});
			});
		}
		
		AOS.job(function(){
			AOS.tip('此模块正在开发中，敬请期待……');
		},1000);
	</script>
</aos:onready>
</aos:html>
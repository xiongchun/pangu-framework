<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="任务办理">
	<aos:include lib="ext" />
	<aos:base href="bpm/mytask" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:gridpanel id="_g_todo" url="listDoTasks.jhtml" region="center" onrender="_g_todo_query">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="我的待办任务" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="任务名称" id="_task_name_" padding="0 0 0 5" onenterkey="_g_todo_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_todo_query" width="200" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="#_g_todo_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:column type="rowno" />
			<aos:column header="任务ID" dataIndex="id_" width="100" />
			<aos:column header="流程定义ID" dataIndex="proc_def_id_" hidden="true" />
			<aos:column header="流程实例ID" dataIndex="proc_inst_id_" hidden="true" />
			<aos:column header="执行流ID" dataIndex="execution_id_" hidden="true" />
			<aos:column header="任务名称" dataIndex="name_" width="150" celltip="true" />
			<aos:column header="所属流程实例" dataIndex="proc_inst_name_" width="150" celltip="true" />
			<aos:column header="拥有人" dataIndex="owner_" width="80" />
			<aos:column header="执行人" dataIndex="assignee_user_" width="80" />
			<aos:column header="活动状态" dataIndex="suspension_state_" rendererField="suspension_state_" dataType="number"
				width="80" />
			<aos:column header="开始时间" dataIndex="create_time_" width="160" />
			<aos:column header="签收时间" dataIndex="claim_time_" width="160" />
			<aos:column header="任务描述" dataIndex="description_" celltip="true" width="150" hidden="true" />
			<aos:column header="<b>办理</b>" type="action" width="45" align="center" >
				<aos:action icon="icon_19.png" tooltip="任务办理" handler="_fn_do_task" />
			</aos:column>
			<aos:column header="<b>反签收</b>"  width="50" align="center" rendererFn="fn_unclaim_renderer" />
		</aos:gridpanel>
		<aos:gridpanel id="_g_claim" url="listClaimTasks.jhtml" region="south" height="280" minHeight="150" maxHeight="500"
			split="true" collapseMode="mini" collapsible="true" header="false" splitterBorder="1 0 0 0" onrender="_g_claim_query">
			<aos:docked forceBoder="1 0 1 0">
				<aos:dockeditem xtype="tbtext" text="我可签收的任务" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="任务名称" id="_task_name_2_" padding="0 0 0 5" onenterkey="_g_claim_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_claim_query" width="200" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="#_g_claim_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:column type="rowno" />
			<aos:column header="任务ID" dataIndex="id_" width="100" />
			<aos:column header="流程定义ID" dataIndex="proc_def_id_" hidden="true" />
			<aos:column header="流程实例ID" dataIndex="proc_inst_id_" hidden="true" />
			<aos:column header="执行流ID" dataIndex="execution_id_" hidden="true" />
			<aos:column header="任务名称" dataIndex="name_" width="150" celltip="true" />
			<aos:column header="所属流程实例" dataIndex="proc_inst_name_" width="150" celltip="true" />
			<aos:column header="拥有人" dataIndex="owner_" width="80" />
			<aos:column header="活动状态" dataIndex="suspension_state_" rendererField="suspension_state_" dataType="number"
				width="80" />
			<aos:column header="开始时间" dataIndex="create_time_" width="160" />
			<aos:column header="任务描述" dataIndex="description_" celltip="true" width="150" hidden="true" />
			<aos:column header="<b>签收</b>" type="action" width="35" align="center">
				<aos:action icon="ok.png" tooltip="任务签收" handler="_fn_claim" />
			</aos:column>
		</aos:gridpanel>
	</aos:viewport>
	<script type="text/javascript">
	
	    //查询待办任务列表
	    function _g_todo_query() {
	        var params = {
	        	name_: AOS.getValue('_task_name_')
	        };
	        _g_todo_store.getProxy().extraParams = params;
	        _g_todo_store.loadPage(1);
	    }
	    
	    //查询待签收任务列表
	    function _g_claim_query() {
	        var params = {
	        		name_: AOS.getValue('_task_name_2_')
	        };
	        _g_claim_store.getProxy().extraParams = params;
	        _g_claim_store.loadPage(1);
	    }
    
	    //弹出任务办理页面
		function _fn_do_task(grid, rowIndex, colIndex) {
			var rec = grid.getStore().getAt(rowIndex);
			parent.parent.fnaddtab('${param.aos_module_id_ }_' + rec.data.id_, '任务办理', '/bpm/modeler/init.jhtml?id=-1');
		}

		//签收
		function _fn_claim() {
			var rec = AOS.selectone(_g_claim);
			var msg = AOS.merge('确认要签收任务[ID:{0}, 名称:{1}]吗？',
					rec.data.id_, rec.data.name_);
			AOS.confirm(msg, function(btn) {
				if (btn === 'cancel') {
					AOS.tip('操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'claimTask.jhtml',
					params : rec.data,
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_claim_store.reload();
						 _g_todo_store.reload();
					}
				});
			});
		}
		
		//反签收
		function _fn_unclaim(rec) {
			var msg = AOS.merge('确认要反签收任务[ID:{0}, 名称:{1}]吗？',
					rec.data.id_, rec.data.name_);
			AOS.confirm(msg, function(btn) {
				if (btn === 'cancel') {
					AOS.tip('操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'unClaimTask.jhtml',
					params : rec.data,
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_claim_store.reload();
						 _g_todo_store.reload();
					}
				});
			});
		}
		
	    //反签收rebderer
		function fn_unclaim_renderer(value, metaData, record) {
	    	if(AOS.empty(record.data.claim_time_)){
	    		return '-';
	    	}else{
				return '<a href="javascript:void(0);"><img src="${cxt}/static/icon/del3.png"/></a>';
	    	}
		}
	    
	    //监听反签收列
		_g_todo.on("cellclick", function(obj, td, colIndex, record,tr,rowIndex, e) {
			if(colIndex === 10){
				if(!AOS.empty(record.data.claim_time_)){
					_fn_unclaim(record);
				}
			}
		});
		
	</script>
</aos:onready>
</aos:html>
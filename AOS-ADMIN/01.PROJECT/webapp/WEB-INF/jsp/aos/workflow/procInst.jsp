<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="流程实例监管">
	<aos:include lib="ext" />
	<aos:base href="workflow/procInst" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:gridpanel id="_g_procdef" url="listProcdefs.jhtml" region="north" hidePagebar="true" height="280"
			onrender="_g_procdef_query" onitemclick="_g_inst_query">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="流程列表" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="流程名称" id="_proc_name_" onenterkey="_g_procdef_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_procdef_query" width="200" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="#_g_procdef_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:column type="rowno" />
			<aos:column header="流程定义扩展流水号" dataIndex="id_" hidden="true" />
			<aos:column header="模型ID" dataIndex="model_id_" hidden="true" />
			<aos:column header="流程定义ID" dataIndex="proc_def_id_" width="150" />
			<aos:column header="流程KEY" dataIndex="key_" width="120" celltip="true" />
			<aos:column header="流程名称" dataIndex="name_" width="200" celltip="true" />
			<aos:column header="活动状态" dataIndex="suspension_state_" rendererField="suspension_state_" dataType="number"
				width="80" />
			<aos:column header="版本号" dataIndex="version_" width="80" />
			<aos:column header="部署时间" dataIndex="deploy_time_" width="160" />
			<aos:column header="部署人" dataIndex="deploy_user_" width="80" />
			<aos:column header="流程描述" dataIndex="description_" flex="1" minWidth="250" celltip="true" />
		</aos:gridpanel>
		<aos:gridpanel id="_g_inst" url="listProcInsts.jhtml" region="center">
			<aos:docked forceBoder="1 0 1 0">
				<aos:dockeditem xtype="tbtext" text="流程实例管理" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem onclick="_fn_activateProcInst" icon="go.png" text="激活实例" />
				<aos:dockeditem onclick="_fn_suspendProcInst" icon="stop2.png" text="挂起实例" />
				<aos:dockeditem onclick="_fn_delProcInst" icon="stop3.png" text="结束实例" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:combobox emptyText="流程实例状态" dicField="procinst_status_" id="procinst_status_" onchang="_g_inst_query"
					width="120" />
				<aos:triggerfield emptyText="流程实例名称" id="name_" onenterkey="_g_inst_query" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="_g_inst_query" width="200" />
			</aos:docked>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流程实例ID" dataIndex="proc_inst_id_" width="80" />
			<aos:column header="流程定义ID" dataIndex="proc_def_id_" width="120" hidden="true" />
			<aos:column header="业务Key" dataIndex="business_key_" width="150" celltip="true" />
			<aos:column header="当前节点ID" dataIndex="act_id_" width="120" hidden="true"  />
			<aos:column header="流程实例名称" dataIndex="name_" width="200" celltip="true" />
			<aos:column header="实例状态" dataIndex="procinst_status_" rendererField="procinst_status_" width="80" />
			<aos:column header="活动状态" dataIndex="suspension_state_" rendererField="suspension_state_" dataType="number"
				width="80" />
			<aos:column header="启动人" dataIndex="start_user_" width="80" />
			<aos:column header="启动时间" dataIndex="start_time_" width="160" />
			<aos:column header="结束时间" dataIndex="end_time_" width="160" />
			<aos:column header="持续时间[秒]" dataIndex="duration_s_" />
			<aos:column header="结束条件描述" dataIndex="delete_reason_" width="160" />
			<aos:column header="数据版本" dataIndex="rev_" width="60" hidden="true" />
		</aos:gridpanel>
	</aos:viewport>

	<script type="text/javascript">
	
	    //查询流程定义列表
	    function _g_procdef_query() {
	        var params = {
	        	name_: AOS.getValue('_proc_name_')
	        };
	        _g_procdef_store.getProxy().extraParams = params;
	        _g_procdef_store.loadPage(1,{
                callback: function () {
                	_g_inst_query();
                }
            });
	    }
    
		//查询流程实例列表
		function _g_inst_query() {
			var params = {
				procinst_status_: AOS.getValue('procinst_status_'),
				name_ : AOS.getValue('name_')
			};
	        var record = AOS.selectone(_g_procdef, true);
	        if(!AOS.empty(record)){
	        	params.proc_def_id_ = record.data.proc_def_id_;
	        }
			_g_inst_store.getProxy().extraParams = params;
			_g_inst_store.loadPage(1);
		}

		//挂起
		function _fn_suspendProcInst() {
			var rec = AOS.selectone(_g_inst); //右键菜单
			var msg = AOS.merge('确认要挂起流程实例[ID:{0}, 名称:{1}]吗？',
					rec.data.proc_inst_id_, rec.data.name_);
			AOS.confirm(msg, function(btn) {
				if (btn === 'cancel') {
					AOS.tip('操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'suspendProcInst.jhtml',
					params : rec.data,
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_inst_store.reload();
					}
				});
			});
		}

		//激活流程实例
		function _fn_activateProcInst() {
			var rec = AOS.selectone(_g_inst); //右键菜单
			var msg = AOS.merge('确认要激活流程实例[ID:{0}, 名称:{1}]吗？',
					rec.data.proc_inst_id_, rec.data.name_);
			AOS.confirm(msg, function(btn) {
				if (btn === 'cancel') {
					AOS.tip('操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'activateProcInst.jhtml',
					params : rec.data,
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_inst_store.reload();
					}
				});
			});
		}

		//结束流程实例
		function _fn_delProcInst() {
			var rows = AOS.rows(_g_inst);
			if (rows == 0) {
				AOS.tip('请先选中数据。');
				return;
			}
			var msg = AOS.merge('确认要终止选中的[{0}]条流程实例吗？', rows);
			AOS.confirm(msg, function(btn) {
				if (btn === 'cancel') {
					AOS.tip('结束操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'delProcInst.jhtml',
					params : {
						aos_rows_ : AOS.selection(_g_inst, 'proc_inst_id_')
					},
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_inst_store.reload();
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
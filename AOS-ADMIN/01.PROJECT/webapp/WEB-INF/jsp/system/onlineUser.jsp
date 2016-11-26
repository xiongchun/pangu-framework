<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="在线用户" base="http" lib="ext">
	<aos:body>
	</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_user" url="onlineUserService.listUsers" onrender="_g_user_query">
			<aos:docked forceBoder="0 0 1 0">
				<aos:triggerfield emptyText="请输入JUID进行查询..." id="id_juid" margin="0 0 0 5" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="_g_user_query" width="280" />
				<%--
				<aos:dockeditem xtype="tbfill" />
				<aos:toggle id="id_toggle_" offText="关闭刷新" onText="5秒刷新" state="false" /> 
				--%>
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="#_g_user_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:column type="rowno" />
			<aos:column header="用户ID" dataIndex="id_" hidden="true" />
			<aos:column header="JUID" dataIndex="juid" fixedWidth="250" />
			<aos:column header="登录账号" dataIndex="account_" fixedWidth="120" />
			<aos:column header="用户姓名" dataIndex="name_" fixedWidth="100" />
			<aos:column header="登录IP" dataIndex="client_ip_" fixedWidth="160" />
			<aos:column header="登录时间" dataIndex="login_time_" fixedWidth="160" />
			<aos:column header="客户端指纹" dataIndex="client_key_" celltip="true" minWidth="250" />
			<aos:column header="下线" rendererFn="fn_offline_render" align="center" fixedWidth="60" />
		</aos:gridpanel>
	</aos:viewport>

	<script type="text/javascript">
		//定时自动刷新
		AOS.task(function() {
			if(id_toggle_.getValue()){
				_g_user_store.reload();
			}
		}, 5000);
	
		//加载表格数据
		function _g_user_query() {
			var params = {
					juid_:id_juid.getValue()
			};
			_g_user_store.getProxy().extraParams = params;
			_g_user_store.loadPage(1);
		}
		
		//按钮列
		function fn_offline_render(value, metaData, record, rowIndex, colIndex, store){
			var html = '<input type="button" value="下线" class="cbtn_danger" onclick="killUser();" />';
			if(record.data.juid == '${juid}'){
				html = '--';
			}
			return html;
		}
		
	</script>
</aos:onready>

<script type="text/javascript">
    //强制下线
    function killUser(){
    	var record = AOS.selectone(Ext.getCmp('_g_user'));
        var msg = AOS.merge('确认要将用户[{0}]强制下线吗？', record.data.name_);
        AOS.confirm(msg, function (btn) {
            if (btn === 'cancel') {
                AOS.tip('强制下线操作被取消。');
                return;
            }
            AOS.ajax({
                params: {
                	juid_:record.data.juid,
                	name_:record.data.name_
                },
                url: 'onlineUserService.killUser',
                ok: function (data) {
                	Ext.getCmp('_g_user').getStore().reload();
                    AOS.tip(data.appmsg);
                }
            });
        });
    }
</script>
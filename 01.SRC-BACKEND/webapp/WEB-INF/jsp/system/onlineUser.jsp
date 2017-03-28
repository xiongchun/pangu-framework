<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="在线用户" base="http" lib="ext">
	<aos:body>
	</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="g_user" url="onlineUserService.listUsers" onrender="g_user_query">
			<aos:docked forceBoder="0 0 1 0">
				<aos:triggerfield emptyText="请输入JUID进行查询..." id="id_juid" margin="0 0 0 5" trigger1Cls="x-form-search-trigger" onenterkey="g_user_query"
					onTrigger1Click="g_user_query" width="280" />
				<%--
				<aos:dockeditem xtype="tbfill" />
				<aos:toggle id="id_toggle" offText="关闭刷新" onText="5秒刷新" state="false" /> 
				--%>
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="#g_user_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:column type="rowno" />
			<aos:column header="用户ID" dataIndex="id" hidden="true" />
			<aos:column header="JUID" dataIndex="juid" fixedWidth="250" />
			<aos:column header="登录账号" dataIndex="account" fixedWidth="120" />
			<aos:column header="用户姓名" dataIndex="name" fixedWidth="100" />
			<aos:column header="登录IP" dataIndex="client_ip" fixedWidth="160" />
			<aos:column header="登录时间" dataIndex="login_time" fixedWidth="160" />
			<aos:column header="客户端指纹" dataIndex="client_key" celltip="true" minWidth="250" />
			<aos:column header="下线" rendererFn="fn_offline_render" align="center" fixedWidth="60" />
		</aos:gridpanel>
	</aos:viewport>

	<script type="text/javascript">
		//定时自动刷新
		AOS.task(function() {
			if(id_toggle_.getValue()){
				g_user_store.reload();
			}
		}, 5000);
	
		//加载表格数据
		function g_user_query() {
			var params = {
					juidQuery : id_juid.getValue()
			};
			g_user_store.getProxy().extraParams = params;
			g_user_store.loadPage(1);
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
    	var record = AOS.selectone(Ext.getCmp('g_user'));
        var msg = AOS.merge('确认要将用户[{0}]强制下线吗？', record.data.name);
        AOS.confirm(msg, function (btn) {
            if (btn === 'cancel') {
                AOS.tip('强制下线操作被取消。');
                return;
            }
            AOS.ajax({
                params: {
                	juidSelected : record.data.juid,
                	name : record.data.name
                },
                url: 'onlineUserService.killUser',
                ok: function (data) {
                	Ext.getCmp('g_user').getStore().reload();
                    AOS.tip(data.appmsg);
                }
            });
        });
    }
</script>
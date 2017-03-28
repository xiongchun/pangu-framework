<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="Redis缓存管理" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:gridpanel id="g_key" url="cacheManageService.listKeys" onrender="g_key_query" region="west" width="450"
			onitemclick="show_detail_list">
			<aos:docked forceBoder="0 0 1 0">
				<aos:triggerfield emptyText="请输入缓存Key" id="id_key" value="${app_key}" margin="0 0 0 5" 
					trigger1Cls="x-form-search-trigger" onTrigger1Click="g_key_query" onenterkey="g_key_query" width="280" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="操作"  icon="icon146.png">
					<aos:menu>
					    <aos:menuitem text="命令窗口" icon="monitor.png" onclick="#w_cmd.show();" />
						<aos:menuitem text="清空缓存" icon="refresh.png" onclick="fn_flush" />
						<aos:menuitem text="缓存服务器健康检查" icon="freelance.png" onclick="#w_info.show();" />
					</aos:menu>
				</aos:dockeditem>
			</aos:docked>
			<aos:column type="rowno" />
			<aos:column header="Key" dataIndex="key" celltip="true" />
			<aos:column header="Type" dataIndex="type" fixedWidth="60" rendererFn="fn_col_type" />
			<aos:column header="Ttl" dataIndex="ttl" fixedWidth="80" />
			<aos:column header="" type="action" fixedWidth="20">
				<aos:action handler="delByKey" icon="del1.png" tooltip="删除" />
			</aos:column>
		</aos:gridpanel>
		<aos:panel region="center" layout="border" border="false" bodyBorder="0 0 0 1">
			<aos:gridpanel id="g_values" url="cacheManageService.listValues" region="north" height="250" pageSize="1000"
				onitemclick="show_detail">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem xtype="tbtext" text="值列表" />
				</aos:docked>
				<aos:column type="rowno" width="38" />
				<aos:column header="Field" dataIndex="field" width="180" celltip="true" />
				<aos:column header="Value" dataIndex="value" flex="1" />
			</aos:gridpanel>

			<aos:panel layout="fit" header="false" region="center" border="false">
				<aos:docked forceBoder="1 0 1 0">
					<aos:dockeditem xtype="tbtext" text="详细信息" />
				</aos:docked>
				<aos:iframe src="do.jhtml?router=cacheManageService.initCodeEditor&juid=${juid}" />
			</aos:panel>
		</aos:panel>
		
	</aos:viewport>
	
	 <aos:window id="w_info" width="500" height="-20" title="Redis缓存服务器健康状态"  onshow="w_info_onshow">
			<aos:textareafield id="_info" readOnly="true" />
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#w_info.hide();" text="关闭" icon="close.png" />
			</aos:docked>
	</aos:window>
	
	<aos:window id="w_cmd" title="命令窗口" onshow="AOS.reset(f_cmd);" width="800" maximizable="true">
		<aos:formpanel id="f_cmd" width="500" layout="column" labelWidth="70">
			<aos:combobox name="type" fieldLabel="类型" allowBlank="false" dicField="cmd_type" value="1" columnWidth="1" />
			<aos:numberfield name="timeout" fieldLabel="过期时间" allowBlank="false" value="0" minValue="0" columnWidth="0.75" />
			<aos:displayfield value="（0为永久有效，单位：秒。）" columnWidth="0.25"/>
			<aos:textfield name="key" fieldLabel="键" allowBlank="false" columnWidth="1" />
			<aos:textareafield name="content" fieldLabel="值" height="430" allowBlank="false" columnWidth="1" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="f_cmd_save" text="执行" icon="ok.png" />
			<aos:dockeditem onclick="#w_cmd.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	

	<script type="text/javascript">
		//加载表格数据
		function g_key_query() {
			var params = {
				key_ : id_key.getValue()
			}
/* 			if (AOS.empty(params.key)) {
				AOS.tip('缓存Key不能为空，请先输入...');
				return;
			} */
			g_key_store.getProxy().extraParams = params;
			g_key_store.loadPage(1);
		}

		//显示详细列表
		function show_detail_list() {
			window.frames[0].setValue('');
			var params = AOS.selectone(g_key).data;
			g_values_store.getProxy().extraParams = params;
			g_values_store.loadPage(1,
					{
						callback : function() {
							var record = g_values_store.getAt(0);
							if(!AOS.empty(record)){
							g_values.getSelectionModel().select(record,true);
							 window.frames[0].setValue(record.data.value);
							}
						}
					});
		}
		
		//命令窗口
		function f_cmd_save(){
				AOS.ajax({
					forms : f_cmd,
					url : 'cacheManageService.saveCmd',
					ok : function(data) {
						AOS.tip(data.appmsg);
						w_cmd.hide();
						AOS.setValue('id_key', AOS.getValue('f_cmd.key'));
						g_key_query();
					}
			});
		}

		//显示详细
		function show_detail() {
			window.frames[0].setValue(AOS.selectone(g_values).data.value);
		}

		//列渲染
		function fn_col_type(value, metaData, record, rowIndex, colIndex) {
 			var cls = "tip_info";
			if (value == 'list') {
				cls = "tip_danger";
			} else if (value == 'hash') {
				cls = "tip_warn";
			}
			return AOS.merge('<span class="{0}">{1}</span>', cls, value);
		}
		
		//清空缓存
		function fn_flush(){
			AOS.confirm('事关重大，后果很严重，请谨慎操作！确认继续操作吗？', function(btn){
				if(btn === 'cancel'){
					AOS.tip('清空操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'cacheManageService.flushAll',
					ok : function(data) {
						AOS.info(data.appmsg);
						g_values_store.removeAll();
						g_key_store.removeAll();
						window.frames[0].setValue('');
					}
				});
			});
		}
		
		//监听健康状态检查窗口
		function w_info_onshow(){
			AOS.ajax({
				url : 'cacheManageService.info',
				ok : function(data) {
					AOS.setValue('_info',data.appmsg);
				}
			});
		}
		
		//删除Key
		function delByKey(grid, rowIndex, colIndex){
			var record = grid.getStore().getAt(rowIndex);
			AOS.confirm('事关重大，后果很严重，请谨慎操作！确认继续操作吗？', function(btn){
				if(btn === 'cancel'){
					AOS.tip('删除操作被取消。');
					return;
				}
				AOS.ajax({
					params: record.data,
					url : 'cacheManageService.delByKey',
					ok : function(data) {
						AOS.tip(data.appmsg);
						g_key_store.reload();
						g_values_store.removeAll();
						window.frames[0].setValue('');
					}
				});
			});
		}
		
	</script>
</aos:onready>

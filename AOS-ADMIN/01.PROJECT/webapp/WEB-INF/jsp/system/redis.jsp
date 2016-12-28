<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="Redis缓存管理" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:gridpanel id="_g_key" url="cacheManageService.listKeys" onrender="_g_key_query" region="west" width="450"
			onitemclick="show_detail_list">
			<aos:docked forceBoder="0 0 1 0">
				<aos:triggerfield emptyText="请输入缓存Key" id="id_key_" value="${app_key}" margin="0 0 0 5" 
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_key_query" onenterkey="_g_key_query" width="280" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="操作"  icon="icon146.png">
					<aos:menu>
					    <aos:menuitem text="命令窗口" icon="monitor.png" onclick="#_w_cmd.show();" />
						<aos:menuitem text="清空缓存" icon="refresh.png" onclick="fn_flush" />
						<aos:menuitem text="缓存服务器健康检查" icon="freelance.png" onclick="#_w_info.show();" />
					</aos:menu>
				</aos:dockeditem>
			</aos:docked>
			<aos:column type="rowno" />
			<aos:column header="Key" dataIndex="key_" celltip="true" />
			<aos:column header="Type" dataIndex="type_" fixedWidth="60" rendererFn="fn_col_type_" />
			<aos:column header="Ttl" dataIndex="ttl_" fixedWidth="80" />
			<aos:column header="" type="action" fixedWidth="20">
				<aos:action handler="delByKey" icon="del1.png" tooltip="删除" />
			</aos:column>
		</aos:gridpanel>
		<aos:panel region="center" layout="border" border="false" bodyBorder="0 0 0 1">
			<aos:gridpanel id="_g_values" url="cacheManageService.listValues" region="north" height="250" pageSize="1000"
				onitemclick="show_detail">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem xtype="tbtext" text="值列表" />
				</aos:docked>
				<aos:column type="rowno" />
				<aos:column header="Field" dataIndex="field_" width="180" celltip="true" />
				<aos:column header="Value" dataIndex="value_" flex="1" />
			</aos:gridpanel>

			<aos:panel layout="fit" header="false" region="center" border="false">
				<aos:docked forceBoder="1 0 1 0">
					<aos:dockeditem xtype="tbtext" text="详细信息" />
				</aos:docked>
				<aos:iframe src="do.jhtml?router=cacheManageService.initCodeEditor&juid=${juid}" />
			</aos:panel>
		</aos:panel>
		
	</aos:viewport>
	
	 <aos:window id="_w_info" width="500" height="-20" title="Redis缓存服务器健康状态"  onshow="_w_info_onshow">
			<aos:textareafield id="_info" readOnly="true" />
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#_w_info.hide();" text="关闭" icon="close.png" />
			</aos:docked>
	</aos:window>
	
	<aos:window id="_w_cmd" title="命令窗口" onshow="AOS.reset(_f_cmd);" width="800" height="600" maximizable="true">
		<aos:formpanel id="_f_cmd" width="500" layout="anchor" labelWidth="60">
			<aos:combobox name="type_" fieldLabel="类型" allowBlank="false" dicField="cmd_type_" value="1" />
			<aos:numberfield name="timeout_" fieldLabel="时效(秒)" allowBlank="false" value="0" />
			<aos:textfield name="key_" fieldLabel="键" allowBlank="false"  />
			<aos:textareafield name="content_" fieldLabel="值" height="430" allowBlank="false" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_cmd_save" text="执行" icon="ok.png" />
			<aos:dockeditem onclick="#_w_cmd.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	

	<script type="text/javascript">
		//加载表格数据
		function _g_key_query() {
			var params = {
				key_ : id_key_.getValue()
			}
/* 			if (AOS.empty(params.key_)) {
				AOS.tip('缓存Key不能为空，请先输入...');
				return;
			} */
			_g_key_store.getProxy().extraParams = params;
			_g_key_store.loadPage(1);
		}

		//显示详细列表
		function show_detail_list() {
			window.frames[0].setValue('');
			var params = AOS.selectone(_g_key).data;
			_g_values_store.getProxy().extraParams = params;
			_g_values_store.loadPage(1,
					{
						callback : function() {
							var record = _g_values_store.getAt(0);
							if(!AOS.empty(record)){
							_g_values.getSelectionModel().select(record,true);
							 window.frames[0].setValue(record.data.value_);
							}
						}
					});
		}
		
		//命令窗口
		function _f_cmd_save(){
				AOS.ajax({
					forms : _f_cmd,
					url : 'cacheManageService.saveCmd',
					ok : function(data) {
						AOS.tip(data.appmsg);
						_w_cmd.hide();
						AOS.setValue('id_key_', AOS.getValue('_f_cmd.key_'));
						_g_key_query();
					}
			});
		}

		//显示详细
		function show_detail() {
			window.frames[0].setValue(AOS.selectone(_g_values).data.value_);
		}

		//列渲染
		function fn_col_type_(value, metaData, record, rowIndex, colIndex) {
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
						_g_values_store.removeAll();
						_g_key_store.removeAll();
						window.frames[0].setValue('');
					}
				});
			});
		}
		
		//监听健康状态检查窗口
		function _w_info_onshow(){
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
						_g_key_store.reload();
						_g_values_store.removeAll();
						window.frames[0].setValue('');
					}
				});
			});
		}
		
	</script>
</aos:onready>

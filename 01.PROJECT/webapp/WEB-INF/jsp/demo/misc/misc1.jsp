<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="综合实例①">
	<aos:include lib="ext" />
	<aos:base href="demo/misc" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:formpanel id="_f_query" layout="column" labelWidth="70" header="false" region="north" border="false">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="查询条件" />
			</aos:docked>
			<aos:textfield name="name_" fieldLabel="组织名称" columnWidth="0.25" />
			<aos:combobox name="type_" fieldLabel="组织类型" dicField="org_type_" columnWidth="0.25" />
			<aos:combobox name="status_" fieldLabel="当前状态" dicField="enabled_" columnWidth="0.25" />
			<aos:textfield name="biz_code_" fieldLabel="业务对照码" labelWidth="80" columnWidth="0.24" />
			<aos:docked dock="bottom" ui="footer" margin="0 0 8 0">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="查询" onclick="_g_org_query" icon="query.png" />
				<aos:dockeditem xtype="button" text="重置" onclick="AOS.reset(_f_query);" icon="refresh.png" />
				<aos:dockeditem xtype="tbfill" />
			</aos:docked>
		</aos:formpanel>

		<aos:gridpanel id="_g_org" url="listOrgs.jhtml" onrender="_g_org_query" region="center">
			<aos:docked forceBoder="1 0 1 0">
				<aos:dockeditem xtype="tbtext" text="组织机构信息" />
			</aos:docked>
			<aos:column type="rowno" />
			<aos:column header="组织流水号" dataIndex="id_" hidden="true" />
			<aos:column header="上级组织流水号" dataIndex="parent_id_" hidden="true" />
			<aos:column header="节点语义ID" dataIndex="cascade_id_" hidden="true" />
			<aos:column header="组织名称" dataIndex="name_" width="220" />
			<aos:column header="组织类型" dataIndex="type_" rendererField="org_type_" />
			<aos:column header="排序号" dataIndex="sort_no_" width="60" />
			<aos:column header="上级组织" dataIndex="pareant_name_" celltip="true" width="200" />
			<aos:column header="业务对照码" dataIndex="biz_code_" />
			<aos:column header="热键" dataIndex="hotkey_" hidden="true" />
			<aos:column header="当前状态" dataIndex="status_" rendererField="enabled_" />
			<aos:column header="节点图标" dataIndex="icon_name_" />
			<aos:column header="叶子节点" dataIndex="is_leaf_" rendererField="bool_" width="80" hidden="true" />
			<aos:column header="自动展开" dataIndex="is_auto_expand_" rendererField="bool_" width="80" hidden="true" />
			<aos:column header="自定义扩展码" dataIndex="custom_code_" />
			<aos:column header="详情1" rendererFn="fn_button_render" align="center" width="50" minWidth="50" maxWidth="50" />
			<aos:column header="详情2" rendererFn="fn_button_render2" align="center" width="50" minWidth="50" maxWidth="50" />
		</aos:gridpanel>

		<aos:window id="_w_org" title="详情1[实时再查询一次]" onshow="_w_org_onshow">
			<aos:formpanel id="_f_org" width="400" layout="anchor" labelWidth="70" >
				<aos:textfield name="name_" fieldLabel="组织名称" readOnly="true" />
				<aos:textfield name="hotkey_" fieldLabel="热键" readOnly="true" />
				<aos:textfield name="biz_code_" fieldLabel="业务对照码" readOnly="true" />
				<aos:combobox name="type_" fieldLabel="组织类型" dicField="org_type_" readOnly="true" />
				<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" dicField="bool_" readOnly="true" />
				<aos:combobox name="status_" fieldLabel="当前状态" dicField="enabled_" readOnly="true" />
				<aos:textfield name="icon_name_" fieldLabel="节点图标" readOnly="true" />
				<aos:numberfield name="sort_no_" fieldLabel="排序号" readOnly="true" />
				<aos:textareafield name="custom_code_" fieldLabel="扩展码" readOnly="true" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#_w_org.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
		
		<aos:window id="_w_org2" title="详情2[从表格行带出]" onshow="_w_org2_onshow">
			<aos:formpanel id="_f_org2" width="400" layout="anchor" labelWidth="70" >
				<aos:textfield name="name_" fieldLabel="组织名称" readOnly="true" />
				<aos:textfield name="hotkey_" fieldLabel="热键" readOnly="true" />
				<aos:textfield name="biz_code_" fieldLabel="业务对照码" readOnly="true" />
				<aos:combobox name="type_" fieldLabel="组织类型" dicField="org_type_" readOnly="true" />
				<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" dicField="bool_" readOnly="true" />
				<aos:combobox name="status_" fieldLabel="当前状态" dicField="enabled_" readOnly="true" />
				<aos:textfield name="icon_name_" fieldLabel="节点图标" readOnly="true" />
				<aos:numberfield name="sort_no_" fieldLabel="排序号" readOnly="true" />
				<aos:textareafield name="custom_code_" fieldLabel="扩展码" readOnly="true" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#_w_org2.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
		
	</aos:viewport>
	<script type="text/javascript">
		//加载表格数据
		function _g_org_query() {
			var params = AOS.getValue('_f_query');
			_g_org_store.getProxy().extraParams = params;
			_g_org_store.loadPage(1);
		}
		
		//窗口弹出事件监听
		function _w_org_onshow() {
			var record = AOS.selectone(_g_org, true);
            AOS.ajax({
            	params : {
            		id_: record.data.id_
            	},
                url: 'getOrgInfo.jhtml',
                ok: function (data) {
                	_f_org.form.setValues(data);
                }
            });
		}
		
		//窗口弹出事件监听
		function _w_org2_onshow() {
			var record = AOS.selectone(_g_org, true);
			_f_org2.loadRecord(record);
		}
		
		//按钮列转换
		function fn_button_render(value, metaData, record, rowIndex, colIndex,
				store) {
			return '<input type="button" value="详情1" class="cbtn" onclick="_w_org_show();" />';
		}
		
		//按钮列转换
		function fn_button_render2(value, metaData, record, rowIndex, colIndex,
				store) {
			return '<input type="button" value="详情2" class="cbtn_danger" onclick="_w_org2_show();" />';
		}
		
	</script>
</aos:onready>
<script type="text/javascript">
	//显示详情1窗口
	function _w_org_show(){
		Ext.getCmp('_w_org').show();
	}
	//显示详情2窗口
	function _w_org2_show(){
		Ext.getCmp('_w_org2').show();
	}
</script>
</aos:html>
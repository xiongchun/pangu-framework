<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="综合实例④">
	<aos:include lib="ext" />
	<aos:base href="demo/misc" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:panel>
			<aos:layout type="vbox" align="stretch" />
			<aos:panel html="测试" flex="1" layout="fit">

			</aos:panel>

			<aos:formpanel id="_f_query" layout="column" labelWidth="70" header="false" border="false" flex="1">
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

			<aos:tabpanel id="_tabpanel" activeTab="0" bodyBorder="0 0 0 0" tabBarHeight="30" flex="1" plain="false">

				<aos:tab title="组织机构信息" id="_tab_org">
					<aos:gridpanel id="_g_org" url="listOrgs.jhtml" onrender="_g_org_query">
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
						<aos:column header="详情" rendererFn="fn_button_render" align="center" width="50" minWidth="50" maxWidth="50" />
					</aos:gridpanel>
				</aos:tab>

				<aos:tab title="配置参数信息" id="_tab_param">
					<aos:gridpanel id="_g_param" url="listParams.jhtml" onrender="_g_param_query" border="false">
						<aos:docked forceBoder="0 0 1 0">
							<aos:dockeditem text="新增" onclick="#AOS.tip('您点击了新增按钮');" icon="add.png" id="_btn_add_demo" />
							<aos:dockeditem text="修改" onclick="#AOS.tip('您点击了修改按钮');" icon="edit.png" />
							<aos:dockeditem text="删除" onclick="#AOS.tip('您点击了删除按钮');" icon="del.png" />
							<aos:dockeditem xtype="tbseparator" />
							<aos:triggerfield emptyText="参数键或参数值" name="keyorvalue" id="_keyorvalue" onenterkey="_g_param_query"
								trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_param_query" width="200" />
						</aos:docked>
						<aos:selmodel type="checkbox" mode="multi" />
						<aos:column type="rowno" />
						<aos:column header="流水号" dataIndex="id_" hidden="true" />
						<aos:column header="所属分类流水号" dataIndex="catalog_id_" hidden="true" />
						<aos:column header="参数名称" dataIndex="name_" width="200" celltip="true" />
						<aos:column header="参数键" dataIndex="key_" width="180" celltip="true" />
						<aos:column header="参数值" dataIndex="value_" width="220" celltip="true" />
						<aos:column header="覆盖字段" dataIndex="overwrite_field_" rendererField="bool_" width="140" />
						<aos:column header="可覆盖" dataIndex="is_overwrite_" rendererField="bool_" width="60" />
						<aos:column header="所属分类" dataIndex="catalog_name_" width="120" />
						<aos:column header="备注" dataIndex="remark_" celltip="true" minWidth="200" flex="1" />
					</aos:gridpanel>
				</aos:tab>

			</aos:tabpanel>
		</aos:panel>

		<aos:window id="_w_org" title="浏览详情" onshow="_w_org_onshow">
			<aos:formpanel id="_f_org" width="400" layout="anchor" labelWidth="70">
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

	</aos:viewport>
	<script type="text/javascript">
		//加载组织结构表格数据
		function _g_org_query() {
			if(!_tab_org.isVisible()){
				_tabpanel.setActiveTab(_tab_org);
			}
			var params = AOS.getValue('_f_query');
			_g_org_store.getProxy().extraParams = params;
			_g_org_store.load();
		}
		
		//加载组织结构表格②数据
		function _g_org_query2() {
			var params = AOS.getValue('_f_query2');
			_g_org2_store.getProxy().extraParams = params;
			_g_org2_store.load();
		}
		
		//加载参数配置表数据
		function _g_param_query(){
            var params = {
                    keyorvalue: _keyorvalue.getValue()
                };
                _g_param_store.getProxy().extraParams = params;
                _g_param_store.load();			
		}
		
		//加载账户信息表格数据
		function _g_account_query() {
			_g_account_store.load();
		}
		
		//表格单击事件
		function fn_g_account_click(obj, record) {
			_f_info.loadRecord(record);
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
		
		//按钮列转换
		function fn_button_render(value, metaData, record, rowIndex, colIndex,
				store) {
			return '<input type="button" value="详情" class="cbtn" onclick="_w_org_show();" />';
		}
		
		
	</script>
</aos:onready>
<script type="text/javascript">
	//显示详情1窗口
	function _w_org_show(){
		Ext.getCmp('_w_org').show();
	}
	
</script>
</aos:html>
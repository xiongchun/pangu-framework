<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="实例④-常用布局二" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:formpanel id="_f_query" layout="column" labelWidth="70" region="north" border="false">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="查询条件" />
			</aos:docked>
			<aos:textfield name="name_" fieldLabel="部门名称" columnWidth="0.25" />
			<aos:combobox name="type_" fieldLabel="部门类型" dicField="org_type_" columnWidth="0.25" />
			<aos:combobox name="is_leaf_" fieldLabel="叶子节点" dicField="is_" columnWidth="0.25" />
			<aos:textfield name="biz_code_" fieldLabel="业务对照码" labelWidth="80" columnWidth="0.24" />
			<aos:docked dock="bottom" ui="footer" margin="0 0 8 0">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="查询" onclick="_g_org_query" icon="query.png" />
				<aos:dockeditem xtype="button" text="重置" onclick="#AOS.reset(_f_query);" icon="refresh.png" />
				<aos:dockeditem xtype="tbfill" />
			</aos:docked>
		</aos:formpanel>

		<aos:tabpanel id="_tabpanel" region="center" bodyBorder="0 0 0 0">

			<aos:tab title="部门信息" id="_tab_org">
				<aos:gridpanel id="_g_org" url="demoService.listOrgs" onrender="_g_org_query">
					<aos:column type="rowno" />
					<aos:column header="部门流水号" dataIndex="id_" width="150" />
					<aos:column header="上级部门流水号" dataIndex="parent_id_" width="150" />
					<aos:column header="节点语义ID" dataIndex="cascade_id_" width="180" />
					<aos:column header="部门名称" dataIndex="name_" width="220" />
					<aos:column header="部门类型" dataIndex="type_" rendererField="org_type_" />
					<aos:column header="排序号" dataIndex="sort_no_" width="60" />
					<aos:column header="热键" dataIndex="hotkey_" hidden="true" />
					<aos:column header="节点图标" dataIndex="icon_name_" />
					<aos:column header="叶子节点" dataIndex="is_leaf_" rendererField="is_" width="80" />
					<aos:column header="自动展开" dataIndex="is_auto_expand_" rendererField="is_" width="80" />
					<aos:column header="扩展码" dataIndex="biz_code_" />
					<aos:column header="已删除" dataIndex="is_del_" rendererField="is_" width="80" />
					<aos:column header="备注" dataIndex="remark_" />
					<aos:column header="查看" rendererFn="fn_button_render" align="center" fixedWidth="60" />
				</aos:gridpanel>
			</aos:tab>

			<aos:tab title="配置参数信息" id="_tab_param">
				<aos:gridpanel id="_g_param" url="demoService.listParams" onrender="_g_param_query" border="false" pageSize="20"
					forceFit="false">
					<aos:docked forceBoder="0 0 1 0">
						<aos:dockeditem text="新增" onclick="#AOS.tip('您点击了新增按钮');" icon="add.png" />
						<aos:dockeditem text="修改" onclick="#AOS.tip('您点击了修改按钮');" icon="edit.png" />
						<aos:dockeditem text="删除" onclick="#AOS.tip('您点击了删除按钮');" icon="del.png" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:triggerfield emptyText="参数键或参数值" name="keyorvalue" id="_keyorvalue" onenterkey="_g_param_query"
							trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_param_query" width="200" />
					</aos:docked>
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id_" fixedWidth="150" />
					<aos:column header="参数名称" dataIndex="name_" celltip="true" width="200" />
					<aos:column header="参数键" dataIndex="key_" width="200" />
					<aos:column header="参数值" dataIndex="value_" width="300" celltip="true" />
					<aos:column header="所属分组" dataIndex="group_" rendererField="params_group_" fixedWidth="120" />
					<aos:column header="备注" dataIndex="remark_" celltip="true" minWidth="800" />
				</aos:gridpanel>
			</aos:tab>

			<aos:tab title="信用卡账户信息" id="_tab_account" layout="border">
				<aos:gridpanel id="_g_account" region="center" url="demoService.listAccounts" onrender="_g_account_query"
					onitemclick="fn_g_account_click">
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id_" hidden="true" />
					<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
					<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
					<aos:column header="身份证号" dataIndex="id_no_" width="140" />
					<aos:column header="持卡人" dataIndex="name_" width="80" />
					<aos:column header="信用额度" dataIndex="credit_line_" type="number" width="100" />
					<aos:column header="可用余额" dataIndex="balance_" type="number" width="100" />
					<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60" />
					<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" width="100" />
					<aos:column header="年龄" dataIndex="age_" width="60" />
					<aos:column header="创建时间" dataIndex="create_time_" width="160" />
					<aos:column header="持卡人住址" dataIndex="address_" width="180" />
				</aos:gridpanel>
				<aos:formpanel id="_f_info" layout="column" labelWidth="70" region="south">
					<aos:docked forceBoder="1 0 1 0">
						<aos:dockeditem xtype="tbtext" text="信用卡账户信息详情" />
					</aos:docked>
					<aos:textfield name="card_id_" fieldLabel="信用卡号" columnWidth="0.33" readOnly="true" />
					<aos:textfield name="id_no_" fieldLabel="身份证号" columnWidth="0.33" readOnly="true" />
					<aos:datefield name="birthday_" fieldLabel="生日" format="Y-m-d" readOnly="true" columnWidth="0.33" />
					<aos:textfield name="name_" fieldLabel="持卡人" readOnly="true" columnWidth="0.33" />
					<aos:numberfield name="credit_line_" fieldLabel="信用额度" readOnly="true" columnWidth="0.33" />
					<aos:numberfield name="balance_" fieldLabel="可用余额" readOnly="true" columnWidth="0.33" />
					<aos:textfield name="address_" fieldLabel="持卡人住址" readOnly="true" columnWidth="0.99" />
				</aos:formpanel>
			</aos:tab>

			<aos:tab title="部门信息②" id="_tab_org2" layout="border">
				<aos:panel region="north">
					<aos:formpanel id="_f_query2" layout="column" labelWidth="70" border="false">
						<aos:textfield name="name_" fieldLabel="部门名称" columnWidth="0.25" />
						<aos:dockeditem xtype="button" text="查询" margin="0 0 0 10" onclick="_g_org_query2" icon="query.png" width="60" />
					</aos:formpanel>
				</aos:panel>
				<aos:gridpanel id="_g_org2" region="center" url="demoService.listOrgs" onrender="_g_org_query2">
					<aos:docked forceBoder="1 0 1 0">
						<aos:dockeditem xtype="tbtext" text="部门信息" />
					</aos:docked>
					<aos:column type="rowno" />
					<aos:column header="部门流水号" dataIndex="id_" width="150" />
					<aos:column header="上级部门流水号" dataIndex="parent_id_" width="150" />
					<aos:column header="节点语义ID" dataIndex="cascade_id_" width="180" />
					<aos:column header="部门名称" dataIndex="name_" width="220" />
					<aos:column header="部门类型" dataIndex="type_" rendererField="org_type_" />
					<aos:column header="排序号" dataIndex="sort_no_" width="60" />
					<aos:column header="热键" dataIndex="hotkey_" hidden="true" />
					<aos:column header="节点图标" dataIndex="icon_name_" />
					<aos:column header="叶子节点" dataIndex="is_leaf_" rendererField="is_" width="80" />
					<aos:column header="自动展开" dataIndex="is_auto_expand_" rendererField="is_" width="80" />
					<aos:column header="扩展码" dataIndex="biz_code_" />
					<aos:column header="已删除" dataIndex="is_del_" rendererField="is_" width="80" />
					<aos:column header="备注" dataIndex="remark_" />
				</aos:gridpanel>
			</aos:tab>

		</aos:tabpanel>

		<aos:window id="_w_detail" layout="border" title="部门信息" width="800" height="530" onshow="_w_detail_onshow">
			<aos:gridpanel id="_g_org3" region="center" url="demoService.listOrgs" hidePagebar="true" onrender="_g_org_query3"
				onitemclick="fn_g_org3_click">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem xtype="tbtext" text="部门列表信息[测试数据]" />
				</aos:docked>
				<aos:column type="rowno" />
				<aos:column header="部门流水号" dataIndex="id_" width="150" />
				<aos:column header="上级部门流水号" dataIndex="parent_id_" width="150" />
				<aos:column header="节点语义ID" dataIndex="cascade_id_" width="180" />
				<aos:column header="部门名称" dataIndex="name_" width="220" />
				<aos:column header="部门类型" dataIndex="type_" rendererField="org_type_" />
				<aos:column header="排序号" dataIndex="sort_no_" width="60" />
			</aos:gridpanel>
			<aos:panel region="south" layout="fit">
				<aos:formpanel id="_f_dept" layout="column" labelWidth="70" border="false">
					<aos:docked forceBoder="1 0 1 0">
						<aos:dockeditem xtype="tbtext" text="重设部门基础信息" />
					</aos:docked>
					<aos:textfield name="name_" fieldLabel="部门名称" columnWidth="0.33" />
					<aos:combobox name="type_" fieldLabel="部门类型" dicField="org_type_" columnWidth="0.33" />
					<aos:dockeditem xtype="button" text="保存" margin="0 0 0 15" onclick="#AOS.tip('仅演示布局，无保存实现。');" icon="query.png"
						width="60" />
				</aos:formpanel>
			</aos:panel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#_w_detail.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

	</aos:viewport>
	<script type="text/javascript">
	
		//加载部门结构表格数据
		function _g_org_query() {
			if(!_tab_org.isVisible()){
				_tabpanel.setActiveTab(_tab_org);
			}
			var params = AOS.getValue('_f_query');
			_g_org_store.getProxy().extraParams = params;
			_g_org_store.loadPage(1);
		}
		
		//加载部门结构表格②数据
		function _g_org_query2() {
			var params = AOS.getValue('_f_query2');
			_g_org2_store.getProxy().extraParams = params;
			_g_org2_store.loadPage(1);
		}
		
		//加载部门结构表格③数据
		function _g_org_query3() {
			_g_org3_store.loadPage(1);
		}
		
		//加载参数配置表数据
		function _g_param_query(){
            var params = {
                    keyorvalue: _keyorvalue.getValue()
                };
                _g_param_store.getProxy().extraParams = params;
                _g_param_store.loadPage(1);			
		}
		
		//加载账户信息表格数据
		function _g_account_query() {
			_g_account_store.loadPage(1);
		}
		
		//表格单击事件
		function fn_g_account_click(obj, record) {
			_f_info.loadRecord(record);
		}
		
		//表格单击事件
		function fn_g_org3_click(obj, record) {
			_f_dept.loadRecord(record);
		}
		
		//监听窗口弹出事件
		function _w_detail_onshow(){
			var record = AOS.selectone(_g_org, true);
			_w_detail.setTitle('<span class="app-container-title-normal">部门信息：' + record.data.name_ + '</span>');
		}
		
		//按钮列转换
		function fn_button_render(value, metaData, record, rowIndex, colIndex, store) {
			return '<input type="button" value="查看" class="cbtn" onclick="_w_detail_show();" />';
		}
		
	</script>
</aos:onready>

<script type="text/javascript">
	function _w_detail_show(){
		Ext.getCmp('_w_detail').show();
	}
</script>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="常用布局二" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:formpanel id="f_query" layout="column" labelWidth="70" region="north" border="false">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="查询条件" />
			</aos:docked>
			<aos:textfield name="name" fieldLabel="部门名称" columnWidth="0.25" />
			<aos:combobox name="type" fieldLabel="部门类型" dicField="org_type" columnWidth="0.25" />
			<aos:combobox name="is_leaf" fieldLabel="叶子节点" dicField="is" columnWidth="0.25" />
			<aos:textfield name="biz_code" fieldLabel="业务对照码" labelWidth="80" columnWidth="0.24" />
			<aos:docked dock="bottom" ui="footer" margin="0 0 8 0">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="查询" onclick="g_org_query" icon="query.png" />
				<aos:dockeditem xtype="button" text="重置" onclick="#AOS.reset(f_query);" icon="refresh.png" />
				<aos:dockeditem xtype="tbfill" />
			</aos:docked>
		</aos:formpanel>

		<aos:tabpanel id="tabpanel" region="center" bodyBorder="0 0 0 0" >

			<aos:tab title="部门信息" id="_tab_org">
				<aos:gridpanel id="g_org" url="demoService.listOrgs" onrender="g_org_query">
					<aos:column type="rowno" />
					<aos:column header="部门流水号" dataIndex="id" width="150" />
					<aos:column header="上级部门流水号" dataIndex="parent_id" width="150" />
					<aos:column header="节点语义ID" dataIndex="cascade_id" width="180" />
					<aos:column header="部门名称" dataIndex="name" width="220" />
					<aos:column header="部门类型" dataIndex="type" rendererField="org_type" />
					<aos:column header="排序号" dataIndex="sort_no" width="60" />
					<aos:column header="热键" dataIndex="hotkey" hidden="true" />
					<aos:column header="节点图标" dataIndex="icon_name" />
					<aos:column header="叶子节点" dataIndex="is_leaf" rendererField="is" width="80" />
					<aos:column header="自动展开" dataIndex="is_auto_expand" rendererField="is" width="80" />
					<aos:column header="扩展码" dataIndex="biz_code" />
					<aos:column header="已删除" dataIndex="is_del" rendererField="is" width="80" />
					<aos:column header="备注" dataIndex="remark" />
					<aos:column header="查看" rendererFn="fn_button_render" align="center" fixedWidth="60" />
				</aos:gridpanel>
			</aos:tab>

			<aos:tab title="配置参数信息" id="_tab_param">
				<aos:gridpanel id="g_param" url="demoService.listParams" onrender="g_param_query" border="false" pageSize="20"
					forceFit="false">
					<aos:docked forceBoder="0 0 1 0">
						<aos:dockeditem text="新增" onclick="#AOS.tip('您点击了新增按钮');" icon="add.png" />
						<aos:dockeditem text="修改" onclick="#AOS.tip('您点击了修改按钮');" icon="edit.png" />
						<aos:dockeditem text="删除" onclick="#AOS.tip('您点击了删除按钮');" icon="del.png" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:triggerfield emptyText="参数键或参数值" name="keyorvalue" id="keyorvalue" onenterkey="g_param_query"
							trigger1Cls="x-form-search-trigger" onTrigger1Click="g_param_query" width="200" />
					</aos:docked>
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id" fixedWidth="150" />
					<aos:column header="参数名称" dataIndex="name" celltip="true" width="200" />
					<aos:column header="参数键" dataIndex="key" width="200" />
					<aos:column header="参数值" dataIndex="value" width="300" celltip="true" />
					<aos:column header="所属分组" dataIndex="group" rendererField="params_group" fixedWidth="120" />
					<aos:column header="备注" dataIndex="remark" celltip="true" minWidth="800" />
				</aos:gridpanel>
			</aos:tab>

			<aos:tab title="信用卡账户信息" id="_tab_account" layout="border">
				<aos:gridpanel id="g_account" region="center" url="demoService.listAccounts" onrender="g_account_query"
					onitemclick="fng_account_click">
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id" hidden="true" />
					<aos:column header="信用卡号" dataIndex="card_id" width="90" />
					<aos:column header="卡类型" dataIndex="card_type" rendererField="card_type" width="60" />
					<aos:column header="身份证号" dataIndex="id_no" width="140" />
					<aos:column header="持卡人" dataIndex="name" width="80" />
					<aos:column header="信用额度" dataIndex="credit_line" type="number" width="100" />
					<aos:column header="可用余额" dataIndex="balance" type="number" width="100" />
					<aos:column header="性别" dataIndex="sex" rendererField="sex" width="60" />
					<aos:column header="出生日期" dataIndex="birthday" type="date" format="Y-m-d" width="100" />
					<aos:column header="年龄" dataIndex="age" width="60" />
					<aos:column header="创建时间" dataIndex="create_time" width="160" />
					<aos:column header="持卡人住址" dataIndex="address" width="180" />
				</aos:gridpanel>
				<aos:formpanel id="f_info" layout="column" labelWidth="70" region="south">
					<aos:docked forceBoder="1 0 1 0">
						<aos:dockeditem xtype="tbtext" text="信用卡账户信息详情" />
					</aos:docked>
					<aos:textfield name="card_id" fieldLabel="信用卡号" columnWidth="0.33" readOnly="true" />
					<aos:textfield name="id_no" fieldLabel="身份证号" columnWidth="0.33" readOnly="true" />
					<aos:datefield name="birthday" fieldLabel="生日" format="Y-m-d" readOnly="true" columnWidth="0.33" />
					<aos:textfield name="name" fieldLabel="持卡人" readOnly="true" columnWidth="0.33" />
					<aos:numberfield name="credit_line" fieldLabel="信用额度" readOnly="true" columnWidth="0.33" />
					<aos:numberfield name="balance" fieldLabel="可用余额" readOnly="true" columnWidth="0.33" />
					<aos:textfield name="address" fieldLabel="持卡人住址" readOnly="true" columnWidth="0.99" />
				</aos:formpanel>
			</aos:tab>

			<aos:tab title="部门信息②" id="_tab_org2" layout="border">
				<aos:panel region="north">
					<aos:formpanel id="f_query2" layout="column" labelWidth="70" border="false">
						<aos:textfield name="name" fieldLabel="部门名称" columnWidth="0.25" />
						<aos:dockeditem xtype="button" text="查询" margin="0 0 0 10" onclick="g_org_query2" icon="query.png" width="60" />
					</aos:formpanel>
				</aos:panel>
				<aos:gridpanel id="g_org2" region="center" url="demoService.listOrgs" onrender="g_org_query2">
					<aos:docked forceBoder="1 0 1 0">
						<aos:dockeditem xtype="tbtext" text="部门信息" />
					</aos:docked>
					<aos:column type="rowno" />
					<aos:column header="部门流水号" dataIndex="id" width="150" />
					<aos:column header="上级部门流水号" dataIndex="parent_id" width="150" />
					<aos:column header="节点语义ID" dataIndex="cascade_id" width="180" />
					<aos:column header="部门名称" dataIndex="name" width="220" />
					<aos:column header="部门类型" dataIndex="type" rendererField="org_type" />
					<aos:column header="排序号" dataIndex="sort_no" width="60" />
					<aos:column header="热键" dataIndex="hotkey" hidden="true" />
					<aos:column header="节点图标" dataIndex="icon_name" />
					<aos:column header="叶子节点" dataIndex="is_leaf" rendererField="is" width="80" />
					<aos:column header="自动展开" dataIndex="is_auto_expand" rendererField="is" width="80" />
					<aos:column header="扩展码" dataIndex="biz_code" />
					<aos:column header="已删除" dataIndex="is_del" rendererField="is" width="80" />
					<aos:column header="备注" dataIndex="remark" />
				</aos:gridpanel>
			</aos:tab>

		</aos:tabpanel>

		<aos:window id="w_detail" layout="border" title="部门信息" width="800" height="530" onshow="w_detail_onshow">
			<aos:gridpanel id="g_org3" region="center" url="demoService.listOrgs" hidePagebar="true" onrender="g_org_query3"
				onitemclick="fng_org3_click">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem xtype="tbtext" text="部门列表信息[测试数据]" />
				</aos:docked>
				<aos:column type="rowno" />
				<aos:column header="部门流水号" dataIndex="id" width="150" />
				<aos:column header="上级部门流水号" dataIndex="parent_id" width="150" />
				<aos:column header="节点语义ID" dataIndex="cascade_id" width="180" />
				<aos:column header="部门名称" dataIndex="name" width="220" />
				<aos:column header="部门类型" dataIndex="type" rendererField="org_type" />
				<aos:column header="排序号" dataIndex="sort_no" width="60" />
			</aos:gridpanel>
			<aos:panel region="south" layout="fit">
				<aos:formpanel id="f_dept" layout="column" labelWidth="70" border="false">
					<aos:docked forceBoder="1 0 1 0">
						<aos:dockeditem xtype="tbtext" text="重设部门基础信息" />
					</aos:docked>
					<aos:textfield name="name" fieldLabel="部门名称" columnWidth="0.33" />
					<aos:combobox name="type" fieldLabel="部门类型" dicField="org_type" columnWidth="0.33" />
					<aos:dockeditem xtype="button" text="保存" margin="0 0 0 15" onclick="#AOS.tip('仅演示布局，无保存实现。');" icon="query.png"
						width="60" />
				</aos:formpanel>
			</aos:panel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#w_detail.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

	</aos:viewport>
	<script type="text/javascript">
	
		//加载部门结构表格数据
		function g_org_query() {
			if(!_tab_org.isVisible()){
				tabpanel.setActiveTab(_tab_org);
			}
			var params = AOS.getValue('f_query');
			g_org_store.getProxy().extraParams = params;
			g_org_store.loadPage(1);
		}
		
		//加载部门结构表格②数据
		function g_org_query2() {
			var params = AOS.getValue('f_query2');
			g_org2_store.getProxy().extraParams = params;
			g_org2_store.loadPage(1);
		}
		
		//加载部门结构表格③数据
		function g_org_query3() {
			g_org3_store.loadPage(1);
		}
		
		//加载参数配置表数据
		function g_param_query(){
            var params = {
                    keyorvalue: keyorvalue.getValue()
                };
                g_param_store.getProxy().extraParams = params;
                g_param_store.loadPage(1);			
		}
		
		//加载账户信息表格数据
		function g_account_query() {
			g_account_store.loadPage(1);
		}
		
		//表格单击事件
		function fng_account_click(obj, record) {
			f_info.loadRecord(record);
		}
		
		//表格单击事件
		function fng_org3_click(obj, record) {
			f_dept.loadRecord(record);
		}
		
		//监听窗口弹出事件
		function w_detail_onshow(){
			var record = AOS.selectone(g_org, true);
			w_detail.setTitle('<span class="app-container-title-normal">部门信息：' + record.data.name_ + '</span>');
		}
		
		//按钮列转换
		function fn_button_render(value, metaData, record, rowIndex, colIndex, store) {
			return '<input type="button" value="查看" class="cbtn" onclick="w_detail_show();" />';
		}
		
	</script>
</aos:onready>

<script type="text/javascript">
	function w_detail_show(){
		Ext.getCmp('w_detail').show();
	}
</script>
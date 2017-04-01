<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="常用布局四" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="fit">
		<aos:panel layout="auto" autoScroll="true" border="false">
			<aos:panel layout="anchor" width="auto" border="false">

				<aos:formpanel id="f_query" layout="column" labelWidth="70" header="false" border="false" anchor="100%">
					<aos:docked forceBoder="0 0 1 0">
						<aos:dockeditem xtype="tbtext" text="查询条件" />
					</aos:docked>
					<aos:textfield name="name" fieldLabel="持卡人姓名" columnWidth="0.25" />
					<aos:combobox name="card_type" fieldLabel="卡类型" dicField="card_type" columnWidth="0.25" />
					<aos:textfield name="card_id" fieldLabel="信用卡号" columnWidth="0.25" />
					<aos:textfield name="id_no" fieldLabel="身份证号" columnWidth="0.24" />
					<aos:docked dock="bottom" ui="footer" margin="0 0 8 0">
						<aos:dockeditem xtype="tbfill" />
						<aos:dockeditem xtype="button" text="查询" onclick="g_account_query" icon="query.png" />
						<aos:dockeditem xtype="button" text="重置" onclick="AOS.reset(f_query);" icon="refresh.png" />
						<aos:dockeditem xtype="tbfill" />
					</aos:docked>
				</aos:formpanel>

				<aos:gridpanel id="g_account" url="demoService.listAccounts" onrender="g_account_query" pageSize="20" height="650" anchor="100%">
					<aos:docked forceBoder="1 0 1 0">
						<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
					</aos:docked>
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

				<aos:formpanel id="f_info" layout="column" labelWidth="70" anchor="100%">
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
				
				<aos:gridpanel id="g_account2" url="demoService.listAccounts" autoLoad="true" anchor="100%">
					<aos:docked forceBoder="1 0 1 0">
						<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
					</aos:docked>
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

			</aos:panel>
		</aos:panel>

	</aos:viewport>

	<script type="text/javascript">
		//加载表格数据
		function g_account_query() {
			var params = AOS.getValue('f_query');
			g_account_store.getProxy().extraParams = params;
			g_account_store.loadPage(1);
		}
	</script>
</aos:onready>

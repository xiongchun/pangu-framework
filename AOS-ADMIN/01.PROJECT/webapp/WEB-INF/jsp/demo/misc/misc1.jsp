<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="综合实例①" base="http" lib="ext">
	<aos:body>
	</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:formpanel id="_f_query" layout="column" labelWidth="70" header="false" region="north" border="false">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="查询条件" />
			</aos:docked>
			<aos:textfield name="name_" fieldLabel="持卡人姓名" columnWidth="0.25" />
			<aos:combobox name="card_type_" fieldLabel="卡类型" dicField="card_type_" columnWidth="0.25" />
			<aos:textfield name="card_id_" fieldLabel="信用卡号" columnWidth="0.25" />
			<aos:textfield name="id_no_" fieldLabel="身份证号"  columnWidth="0.24" />
			<aos:docked dock="bottom" ui="footer" margin="0 0 8 0">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="查询" onclick="_g_account_query" icon="query.png" />
				<aos:dockeditem xtype="button" text="重置" onclick="AOS.reset(_f_query);" icon="refresh.png" />
				<aos:dockeditem xtype="tbfill" />
			</aos:docked>
		</aos:formpanel>

		<aos:gridpanel id="_g_account" url="demoService.listAccounts" onrender="_g_account_query" region="center">
			<aos:docked forceBoder="1 0 1 0">
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
			</aos:docked>
			<aos:column type="rowno" />
				<aos:column header="流水号" dataIndex="id_" hidden="true" />
				<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
				<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
				<aos:column header="身份证号" dataIndex="id_no_" width="140" />
				<aos:column header="持卡人" dataIndex="name_" width="80" />
				<aos:column header="信用额度" dataIndex="credit_line_" type="number" width="100"  />
				<aos:column header="可用余额" dataIndex="balance_" type="number" width="100"  />
				<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60" />
				<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" width="100" />
				<aos:column header="年龄" dataIndex="age_" width="60" />
				<aos:column header="创建时间" dataIndex="create_time_" width="160" />
				<aos:column header="持卡人住址" dataIndex="address_" width="180" />
				<aos:column header="预览1" rendererFn="fn_button_render" align="center" fixedWidth="60" />
			    <aos:column header="预览2" rendererFn="fn_button_render2" align="center" fixedWidth="60" />
		</aos:gridpanel>
        
        <%-- 通过这个弹窗表单演示再查询一次DB加载数据的方法 --%>
		<aos:window id="_w_account" title="账户预览1[演示实时查询]" onshow="_w_account_onshow">
			<aos:formpanel id="_f_org" width="400" layout="anchor" labelWidth="70" >
				<aos:textfield name="name_" fieldLabel="持卡人" readOnly="true" />
				<aos:textfield name="card_id_" fieldLabel="信用卡号" readOnly="true" />
				<aos:textfield name="id_no_" fieldLabel="身份证号" readOnly="true" />
				<aos:combobox name="card_type_" fieldLabel="卡类型" dicField="card_type_" readOnly="true" />
				<aos:textfield name="credit_line_" fieldLabel="信用额度" readOnly="true" />
				<aos:textfield name="balance_" fieldLabel="可用余额" readOnly="true" />
				<aos:textareafield name="address_" fieldLabel="持卡人住址" readOnly="true" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#_w_account.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
		
		<%-- 通过这个弹窗表单演示直接 --%>
		<aos:window id="_w_account2" title="账户预览2[演示客户端取值]" onshow="_w_account2_onshow">
			<aos:formpanel id="_f_org2" width="400" layout="anchor" labelWidth="70" >
				<aos:textfield name="name_" fieldLabel="持卡人" readOnly="true" />
				<aos:textfield name="card_id_" fieldLabel="信用卡号" readOnly="true" />
				<aos:textfield name="id_no_" fieldLabel="身份证号" readOnly="true" />
				<aos:combobox name="card_type_" fieldLabel="卡类型" dicField="card_type_" readOnly="true" />
				<aos:textfield name="credit_line_" fieldLabel="信用额度" readOnly="true" />
				<aos:textfield name="balance_" fieldLabel="可用余额" readOnly="true" />
				<aos:textareafield name="address_" fieldLabel="持卡人住址" readOnly="true" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#_w_account2.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
		
	</aos:viewport>
	
	<script type="text/javascript">
		//加载表格数据
		function _g_account_query() {
			var params = AOS.getValue('_f_query');
			_g_account_store.getProxy().extraParams = params;
			_g_account_store.loadPage(1);
		}
		
		//窗口弹出事件监听
		function _w_account_onshow() {
			var record = AOS.selectone(_g_account);
            AOS.ajax({
            	params : {
            		id_: record.data.id_
            	},
                url: 'demoService.getOrgInfo',
                ok: function (data) {
                	_f_org.form.setValues(data);
                }
            });
		}
		
		//窗口弹出事件监听
		function _w_account2_onshow() {
			var record = AOS.selectone(_g_account, true);
			_f_org2.loadRecord(record);
		}
		
		//按钮列转换
		function fn_button_render(value, metaData, record, rowIndex, colIndex,
				store) {
			return '<input type="button" value="预览" class="cbtn" onclick="_w_account_show();" />';
		}
		
		//按钮列转换
		function fn_button_render2(value, metaData, record, rowIndex, colIndex,
				store) {
			return '<input type="button" value="预览" class="cbtn_danger" onclick="_w_account2_show();" />';
		}
		
	</script>
</aos:onready>

<script type="text/javascript">

	//显示预览1窗口
	function _w_account_show(){
		Ext.getCmp('_w_account').show();
	}
	//显示预览2窗口
	function _w_account2_show(){
		Ext.getCmp('_w_account2').show();
	}
	
</script>
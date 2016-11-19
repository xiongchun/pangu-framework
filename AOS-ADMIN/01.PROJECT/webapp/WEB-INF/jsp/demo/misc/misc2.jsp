<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="综合实例②" base="http" lib="ext">
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
			<aos:textfield name="id_no_" fieldLabel="身份证号" columnWidth="0.24" />
			<aos:docked dock="bottom" ui="footer" margin="0 0 8 0">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="查询" onclick="_g_account_query" icon="query.png" />
				<aos:dockeditem xtype="button" text="重置" onclick="AOS.reset(_f_query);" icon="refresh.png" />
				<aos:dockeditem xtype="tbfill" />
			</aos:docked>
		</aos:formpanel>

		<aos:gridpanel id="_g_account" url="demoService.listAccounts" onrender="_g_account_query"
			onitemdblclick="#_w_account2.show();" region="center">
			<aos:docked forceBoder="1 0 1 0">
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="新增" icon="add.png" onclick="#_w_account.show();AOS.reset(_f_account);" />
				<aos:dockeditem text="修改" icon="edit.png" onclick="#_w_account2.show();" />
				<aos:dockeditem text="批量删除" icon="del.png" onclick="_g_acount_del" />
			</aos:docked>
			<aos:selmodel type="checkbox" mode="multi" />
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
			<aos:column header="银行机构ID" dataIndex="org_id_" width="100" />
			<aos:column header="创建时间" dataIndex="create_time_" width="160" />
			<aos:column header="持卡人住址" dataIndex="address_" width="180" />
			<aos:column header="修改" rendererFn="fn_button_render" align="center" fixedWidth="50" />
			<aos:column header="删除" rendererFn="fn_button_del" align="center" fixedWidth="50" />
		</aos:gridpanel>

		<%-- 新增窗口 --%>
		<aos:window id="_w_account" title="新增账户">
			<aos:formpanel id="_f_account" width="450" layout="anchor" labelWidth="70">
				<aos:textfield name="id_no_" fieldLabel="身份证号" allowBlank="false" />
				<aos:textfield name="name_" fieldLabel="持卡人" allowBlank="false" />
				<aos:combobox name="sex_" fieldLabel="性别" dicField="sex_" value="1" allowBlank="false" />
				<aos:datefield name="birthday_" fieldLabel="出生日期" editable="false" allowBlank="false" />
				<aos:textfield name="card_id_" fieldLabel="信用卡号" allowBlank="false" />
				<aos:combobox name="card_type_" fieldLabel="卡类型" dicField="card_type_" allowBlank="false" />
				<aos:numberfield name="credit_line_" minValue="500" maxValue="999999" fieldLabel="信用额度" allowBlank="false" />
				<aos:numberfield name="balance_" minValue="0" maxValue="999999" fieldLabel="可用余额" />
				<aos:textareafield name="address_" fieldLabel="持卡人住址" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="_f_account_save" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#_w_account.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

		<%-- 修改窗口 --%>
		<aos:window id="_w_account2" title="修改账户" onshow="_w_account2_onshow">
			<aos:formpanel id="_f_account2" width="450" layout="anchor" labelWidth="70">
				<%-- 更新时的隐藏变量(主键) --%>
				<aos:hiddenfield name="id_" fieldLabel="流水号" />
				<aos:textfield name="id_no_" fieldLabel="身份证号" allowBlank="false" />
				<aos:textfield name="name_" fieldLabel="持卡人" allowBlank="false" />
				<aos:combobox name="sex_" fieldLabel="性别" dicField="sex_" value="1" allowBlank="false" />
				<aos:datefield name="birthday_" fieldLabel="出生日期" editable="false" allowBlank="false" />
				<aos:textfield name="card_id_" fieldLabel="信用卡号" allowBlank="false" />
				<aos:combobox name="card_type_" fieldLabel="卡类型" dicField="card_type_" allowBlank="false" />
				<aos:numberfield name="credit_line_" minValue="500" maxValue="999999" fieldLabel="信用额度" allowBlank="false" />
				<aos:numberfield name="balance_" minValue="0" maxValue="999999" fieldLabel="可用余额" />
				<aos:textareafield name="address_" fieldLabel="持卡人住址" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="_f_account2_update" text="保存" icon="ok.png" />
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
		
		//新增账户保存
		function _f_account_save(){
				AOS.ajax({
					forms : _f_account,
					url : 'demoService.saveAccountInfo',
					ok : function(data) {
						 AOS.tip(data.appmsg);
						_g_account_store.reload();
						_w_account.hide();
					}
			});
		}
		
		//监听修改窗口弹出
		function _w_account2_onshow(){
			//这里演示的是直接从表格行中加载数据，也可以发一个ajax请求查询数据(见misc1.jsp有相关用法)
			var record = AOS.selectone(_g_account, true);
			_f_account2.loadRecord(record);
		}
		
		//修改账户保存
		function _f_account2_update(){
				AOS.ajax({
					forms : _f_account2,
					url : 'demoService.updateAccountInfo',
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_account_store.reload();
						_w_account2.hide();
					}
			});
		}
		
        //删除账户信息
	 	function _g_acount_del(){
				var selection = AOS.selection(_g_account, 'id_');
				if(AOS.empty(selection)){
					AOS.tip('删除前请先选中数据。');
					return;
				}
				var rows = AOS.rows(_g_account);
				var msg =  AOS.merge('确认要删除选中的{0}个账户吗？', rows);
				AOS.confirm(msg, function(btn){
					if(btn === 'cancel'){
						AOS.tip('删除操作被取消。');
						return;
					}
					AOS.ajax({
						url : 'demoService.delAccountInfos',
						params:{
							aos_rows_: selection
						},
						ok : function(data) {
							AOS.tip(data.appmsg);
							_g_account_store.reload();
						}
					});
				});
			}
		
		//按钮列转换
		function fn_button_render(value, metaData, record) {
			return '<input type="button" value="修改" class="cbtn" onclick="_w_account2_show();" />';
		}
		
		//按钮列转换
		function fn_button_del(value, metaData, record) {
			return '<input type="button" value="删除" class="cbtn" onclick="fn_del();" />';
		}
		
	</script>
</aos:onready>

<script type="text/javascript">

function _w_account2_show(){
	AOS.get('_w_account2').show();
}

function fn_del(){
	//由于是列按钮对应的函数，下面获取对象的的写法和onready代码段里的js有些不同
	var record = AOS.selectone(AOS.get('_g_account'));
	var msg =  AOS.merge('确认要删除账户【{0}】吗？', record.data.name_);
	AOS.confirm(msg, function(btn){
		if(btn === 'cancel'){
			AOS.tip('删除操作被取消。');
			return;
		}
		AOS.ajax({
			url : 'demoService.delAccountInfo',
			params:{
				id_: record.data.id_
			},
			ok : function(data) {
				AOS.tip(data.appmsg);
				AOS.get('_g_account').getStore().reload();
			}
		});
	});
}

</script>
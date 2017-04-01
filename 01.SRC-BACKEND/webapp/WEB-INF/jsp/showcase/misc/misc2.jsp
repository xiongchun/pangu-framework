<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="增删改查" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:formpanel id="f_query" layout="column" labelWidth="70" header="false" region="north" border="false">
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

		<aos:gridpanel id="g_account" url="demoService.listAccounts" onrender="g_account_query" onitemdblclick="#w_account2.show();" region="center">
			<aos:docked forceBoder="1 0 1 0">
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="新增" icon="add.png" onclick="#w_account.show();AOS.reset(f_account);" />
				<aos:dockeditem text="修改" icon="edit.png" onclick="#w_account2.show();" />
				<aos:dockeditem text="批量删除" icon="del.png" onclick="g_acount_del" />
			</aos:docked>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id" hidden="true" />
			<aos:column header="个人基本信息" type="group">
				<aos:column header="身份证号" dataIndex="id_no" width="140" />
				<aos:column header="持卡人" dataIndex="name" width="80" />
				<aos:column header="性别" dataIndex="sex" rendererField="sex" width="60" />
				<aos:column header="出生日期" dataIndex="birthday" type="date" format="Y-m-d" width="100" />
				<aos:column header="年龄" dataIndex="age" width="60" />
			</aos:column>
			<aos:column header="信用卡信息" type="group">
				<aos:column header="信用卡号" dataIndex="card_id" width="90" />
				<aos:column header="卡类型" dataIndex="card_type" rendererField="card_type" width="60" />
				<aos:column header="信用额度" dataIndex="credit_line" type="number" width="100" />
				<aos:column header="可用余额" dataIndex="balance" type="number" width="100" />
			</aos:column>
			<aos:column header="银行机构ID" dataIndex="org_id" width="100" />
			<aos:column header="创建时间" dataIndex="create_time" width="160" />
			<aos:column header="持卡人住址" dataIndex="address" width="180" />
			<aos:column header="修改" rendererFn="fn_button_render" align="center" fixedWidth="50" />
			<aos:column header="删除" rendererFn="fn_button_del" align="center" fixedWidth="50" />
		</aos:gridpanel>

		<%-- 新增窗口 --%>
		<aos:window id="w_account" title="新增账户">
			<aos:formpanel id="f_account" width="450" layout="anchor" labelWidth="70">
				<aos:textfield name="id_no" fieldLabel="身份证号" allowBlank="false" />
				<aos:textfield name="name" fieldLabel="持卡人" allowBlank="false" />
				<aos:combobox name="sex" fieldLabel="性别" dicField="sex" value="1" allowBlank="false" />
				<aos:datefield name="birthday" fieldLabel="出生日期" editable="false" allowBlank="false" />
				<aos:textfield name="card_id" fieldLabel="信用卡号" allowBlank="false" />
				<aos:combobox name="card_type" fieldLabel="卡类型" dicField="card_type" allowBlank="false" />
				<aos:numberfield name="credit_line" minValue="500" maxValue="999999" fieldLabel="信用额度" allowBlank="false" />
				<aos:numberfield name="balance" minValue="0" maxValue="999999" fieldLabel="可用余额" />
				<aos:textareafield name="address" fieldLabel="持卡人住址" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="f_account_save" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#w_account.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

		<%-- 修改窗口 --%>
		<aos:window id="w_account2" title="修改账户" onshow="w_account2_onshow">
			<aos:formpanel id="f_account2" width="450" layout="anchor" labelWidth="70">
				<%-- 更新时的隐藏变量(主键) --%>
				<aos:hiddenfield name="id" fieldLabel="流水号" />
				<aos:textfield name="id_no" fieldLabel="身份证号" allowBlank="false" />
				<aos:textfield name="name" fieldLabel="持卡人" allowBlank="false" />
				<aos:combobox name="sex" fieldLabel="性别" dicField="sex" value="1" allowBlank="false" />
				<aos:datefield name="birthday" fieldLabel="出生日期" editable="false" allowBlank="false" />
				<aos:textfield name="card_id" fieldLabel="信用卡号" allowBlank="false" />
				<aos:combobox name="card_type" fieldLabel="卡类型" dicField="card_type" allowBlank="false" />
				<aos:numberfield name="credit_line" minValue="500" maxValue="999999" fieldLabel="信用额度" allowBlank="false" />
				<aos:numberfield name="balance" minValue="0" maxValue="999999" fieldLabel="可用余额" />
				<aos:textareafield name="address" fieldLabel="持卡人住址" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="f_account2_update" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#w_account2.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

	</aos:viewport>

	<script type="text/javascript">
	
		//加载表格数据
		function g_account_query() {
			var params = AOS.getValue('f_query');
			g_account_store.getProxy().extraParams = params;
			g_account_store.loadPage(1);
		}
		
		//新增账户保存
		function f_account_save(){
				AOS.ajax({
					forms : f_account,
					url : 'demoService.saveAccountInfo',
					ok : function(data) {
						 AOS.tip(data.appmsg);
						g_account_store.reload();
						w_account.hide();
					}
			});
		}
		
		//监听修改窗口弹出
		function w_account2_onshow(){
			//这里演示的是直接从表格行中加载数据，也可以发一个ajax请求查询数据(见misc1.jsp有相关用法)
			var record = AOS.selectone(g_account, true);
			f_account2.loadRecord(record);
		}
		
		//修改账户保存
		function f_account2_update(){
				AOS.ajax({
					forms : f_account2,
					url : 'demoService.updateAccountInfo',
					ok : function(data) {
						AOS.tip(data.appmsg);
						g_account_store.reload();
						w_account2.hide();
					}
			});
		}
		
        //删除账户信息
	 	function g_acount_del(){
				var selection = AOS.selection(g_account, 'id');
				if(AOS.empty(selection)){
					AOS.tip('删除前请先选中数据。');
					return;
				}
				var rows = AOS.rows(g_account);
				var msg =  AOS.merge('确认要删除选中的{0}个账户吗？', rows);
				AOS.confirm(msg, function(btn){
					if(btn === 'cancel'){
						AOS.tip('删除操作被取消。');
						return;
					}
					AOS.ajax({
						url : 'demoService.delAccountInfos',
						params:{
							aos_rows: selection
						},
						ok : function(data) {
							AOS.tip(data.appmsg);
							g_account_store.reload();
						}
					});
				});
			}
		
		//按钮列转换
		function fn_button_render(value, metaData, record) {
			return '<input type="button" value="修改" class="cbtn" onclick="w_account2_show();" />';
		}
		
		//按钮列转换
		function fn_button_del(value, metaData, record) {
			return '<input type="button" value="删除" class="cbtn" onclick="fn_del();" />';
		}
		
	</script>
</aos:onready>

<script type="text/javascript">

function w_account2_show(){
	AOS.get('w_account2').show();
}

function fn_del(){
	//由于是列按钮对应的函数，下面获取对象的的写法和onready代码段里的js有些不同
	var record = AOS.selectone(AOS.get('g_account'));
	var msg =  AOS.merge('确认要删除账户【{0}】吗？', record.data.name);
	AOS.confirm(msg, function(btn){
		if(btn === 'cancel'){
			AOS.tip('删除操作被取消。');
			return;
		}
		AOS.ajax({
			url : 'demoService.delAccountInfo',
			params:{
				id: record.data.id
			},
			ok : function(data) {
				AOS.tip(data.appmsg);
				AOS.get('g_account').getStore().reload();
			}
		});
	});
}

</script>
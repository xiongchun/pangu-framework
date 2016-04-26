<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="可编辑表格">
	<aos:include lib="ext" />
	<aos:base href="demo/grid" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">

		<aos:gridpanel id="_g_account" region="north" url="listAccounts.jhtml" split="true" splitterBorder="1 0 1 0"
			onrender="_g_account_query" pageSize="20" height="315" >
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息① [行编辑模式]" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="新增" icon="add2.png" onclick="fn_add_row" />
				<aos:dockeditem text="删除" icon="del.png" onclick="fn_remove_rows" />
				<aos:dockeditem xtype="tbfill" />
				<aos:triggerfield emptyText="姓名" id="_name_" onenterkey="_g_account_query" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="_g_account_query" width="200" />
			</aos:docked>
			<aos:plugins>
				<aos:editing id="id_plugin" clicksToEdit="1" onedit="fn_edit" autoCancel="false" onbeforeedit="fn_beforeedit" />
			</aos:plugins>
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
			<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60">
			   <%-- 字典数据源 --%>
				<aos:combobox dicField="card_type_" />
			</aos:column>
			<aos:column header="身份证号" dataIndex="id_no_" width="140" />
			<aos:column header="持卡人" dataIndex="name_" width="80">
				<aos:textfield allowBlank="false" />
			</aos:column>
			<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
			<aos:column header="可用余额" dataIndex="balance_" type="number">
				<aos:numberfield allowBlank="false" maxValue="80000" minValue="0" />
			</aos:column>
			<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60">
				<aos:combobox>
					<%-- 客户端数据源 --%>
					<aos:option value="1" display="男" />
					<aos:option value="2" display="女" />
					<aos:option value="3" display="人妖" />
				</aos:combobox>
			</aos:column>
			<%-- 自定义服务器数据源
			<aos:column header="性别2" dataIndex="sex_" rendererField="sex_" width="60">				
			   <aos:combobox id="cb_sex" url="listComboBoxData.jhtml"  />
			</aos:column>
			--%>
			<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y年m月d日" width="120">
				<aos:datefield format="Y年m月d日" />
			</aos:column>
			<aos:column header="年龄" dataIndex="age_" width="60">
				<aos:numberfield allowBlank="false" maxValue="100" minValue="1" />
			</aos:column>
			<aos:column header="创建时间" dataIndex="create_time_" type="date" format="Y-m-d H:i:s"   width="160" />
			<aos:column header="持卡人住址" dataIndex="address_" width="180">
				<aos:textfield allowBlank="false" />
			</aos:column>
		</aos:gridpanel>

		<aos:gridpanel id="_g_account2" region="east" url="listAccounts.jhtml" onrender="_g_account2_query" split="true"
			splitterBorder="0 1 0 1" width="500">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息② [单元格编辑模式]" />
			</aos:docked>
			<aos:plugins>
				<aos:editing ptype="cellediting" clicksToEdit="1" onedit="fn_edit" />
			</aos:plugins>
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
			<aos:column header="持卡人" dataIndex="name_" width="80">
				<aos:textfield allowBlank="false" />
			</aos:column>
			<aos:column header="可用余额" dataIndex="balance_" type="number">
				<aos:numberfield allowBlank="false" maxValue="80000" minValue="0" />
			</aos:column>
			<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y年m月d日" width="120">
				<aos:datefield format="Y年m月d日" />
			</aos:column>
		</aos:gridpanel>

		<aos:gridpanel id="_g_account3" region="center" url="listAccounts.jhtml" onrender="_g_account3_query">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息③ [单元格编辑模式] [双击进入编辑模式]" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="新增" icon="add2.png" onclick="fn_add_row3" />
				<aos:dockeditem text="删除" icon="del.png" onclick="fn_remove_rows3" />
				<aos:dockeditem text="保存" icon="ok.png" onclick="fn_edit3" />
			</aos:docked>
			<aos:plugins>
				<aos:editing id="id_plugin" ptype="cellediting" clicksToEdit="2" />
			</aos:plugins>
			<aos:column type="rowno" />
			<aos:selmodel type="row" mode="multi" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
			<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60">
				<aos:combobox dicField="card_type_" />
			</aos:column>
			<aos:column header="持卡人" dataIndex="name_" width="80">
				<aos:textfield allowBlank="false" />
			</aos:column>
			<aos:column header="可用余额" dataIndex="balance_" type="number">
				<aos:numberfield allowBlank="false" maxValue="80000" minValue="0" />
			</aos:column>
			<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y年m月d日" width="120">
				<aos:datefield format="Y年m月d日" />
			</aos:column>
			<aos:column header="持卡人住址" dataIndex="address_" width="180">
				<aos:textareafield height="150" allowBlank="false" />
			</aos:column>
		</aos:gridpanel>

	</aos:viewport>
	<script type="text/javascript">
	
		//加载表格数据
		function _g_account_query() {
			var params = {
				name_ : _name_.getValue()
			};
			_g_account_store.getProxy().extraParams = params;
			_g_account_store.loadPage(1);
			//cb_sex_store.load();
		}

		function _g_account2_query() {
			_g_account2_store.loadPage(1);
		}

		function _g_account3_query() {
			_g_account3_store.loadPage(1);
		}

		//监听编辑事件
		function fn_edit(editor, e) {
			if (!e.record.dirty) {
				AOS.tip('数据没变化，提交操作取消。');
				return;
			}
			AOS.ajax({
				params : e.record.data,
				url : 'editGrid.jhtml',
				ok : function(data) {
					AOS.tip(data.appmsg);
					//客户端数据状态提交
					e.record.commit();
				}
			});
		}

		//客户端删除行记录
		function fn_remove_rows() {
			var records = AOS.select(_g_account);
			Ext.Array.each(records, function(record) {
				_g_account_store.remove(record);
			});
			AOS.tip(AOS.merge('客户端删除了{0}条记录。', records.length));
		}
		
		//客户端删除行记录
		function fn_remove_rows3() {
			var records = AOS.select(_g_account3);
			Ext.Array.each(records, function(record) {
				_g_account3_store.remove(record);
			});
			AOS.tip(AOS.merge('客户端删除了{0}条记录。', records.length));
		}
		
		//触发编辑前事件
		function fn_beforeedit(obj, e){
			var card_type_ = e.record.data.card_type_;
			editing = _g_account.getPlugin('id_plugin');
			form = editing.editor.form;
			//form.findField('sex_').setValue('1');
			//根据当前行的数据控制行编辑器
			if(card_type_ == '2'){
				 AOS.read(form.findField('name_'));
				 AOS.read(form.findField('balance_'));
			}else{
				 AOS.edit(form.findField('name_'));
				 AOS.edit(form.findField('balance_'));
			}
		}
		
		//客户端新增记录
		function fn_add_row(editor, e) {
			Ext.form.Field.prototype.msgTarget = 'qtip';
			editing = _g_account.getPlugin('id_plugin');
			editing.cancelEdit();
			_g_account_store.insert(0, {
				card_type_ : '1',
				name_ : '小芳',
				create_time_ : new Date(),
				id_no_:'2925193510134870'
			});
			editing.startEdit(0, 2);
		}

		//客户端新增记录
		function fn_add_row3() {
			editing = _g_account3.getPlugin('id_plugin');
			editing.cancelEdit();
			_g_account3_store.insert(0, {
				card_type_ : '1',
				name_ : '小芳',
				birthday_ : new Date()
			});
			editing.startEdit(0, 2);
		}

		//监听编辑事件
		function fn_edit3() {
			if (AOS.mrows(_g_account3) === 0) {
				AOS.tip('数据没变化，提交操作取消。');
				return;
			}
			AOS.ajax({
				params : {
					aos_rows_ : AOS.mrs(_g_account3)
				},
				url : 'editGrid3.jhtml',
				ok : function(data) {
					AOS.tip(data.appmsg);
					_g_account3_store.reload();
				}
			});
		}
	</script>
</aos:onready>
</aos:html>
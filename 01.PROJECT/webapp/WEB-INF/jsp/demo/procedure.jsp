<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
	<aos:base href="demo/procedure" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:formpanel id="_f_proc" region="north" layout="column" labelWidth="100" onrender="fn_callProc1" collapsible="true"
			header="false" bodyBorder="0 0 1 0">
			<aos:docked border="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="调用存储过程范例1 [常规]" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="调用1" icon="go.png" onclick="fn_callProc1" />
			</aos:docked>
			<aos:textfield fieldLabel="持卡人" name="name_" allowBlank="false" columnWidth="0.33" value="小芳" />
			<aos:numberfield fieldLabel="信用卡额度" name="number1_" maxValue="100000" value="100000" allowBlank="false"
				columnWidth="0.33" />
			<aos:numberfield fieldLabel="已用金额" name="number2_" maxValue="100000" value="25000" allowBlank="false"
				columnWidth="0.33" />
			<aos:textfield fieldLabel="存储过程返回值" name="outstring" readOnly="true" columnWidth="0.99" />
		</aos:formpanel>
		<aos:gridpanel id="_g_module" region="center" url="callProc2.jhtml" onrender="fn_callProc2" pageSize="1000">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="调用存储过程范例2 [通过游标返回结果集合]" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:textfield emptyText="模块名称" id="_name_" onenterkey="fn_callProc2" width="200" />
				<aos:dockeditem text="调用2" icon="go.png" onclick="fn_callProc2" />
			</aos:docked>
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" width="150" />
			<aos:column header="模块节点语义ID" dataIndex="cascade_id_" width="250" />
			<aos:column header="模块名称" dataIndex="name_" width="250" />
			<aos:column header="请求URL地址" dataIndex="url_" flex="1" />
		</aos:gridpanel>
	</aos:viewport>
	<script type="text/javascript">
		//调用存储过程2
		function fn_callProc2() {
			var params = {
				name_ : _name_.getValue()
			};
			//这个Store的命名规则为：表格ID+"_store"。
			_g_module_store.getProxy().extraParams = params;
			_g_module_store.loadPage(1);
		}

		//调用存储过程1
		function fn_callProc1() {
			AOS.ajax({
				forms : _f_proc,
				url : 'callProc1.jhtml',
				ok : function(data) {
					_f_proc.form.setValues(data);
				}
			});
		}
	</script>
</aos:onready>
</aos:html>
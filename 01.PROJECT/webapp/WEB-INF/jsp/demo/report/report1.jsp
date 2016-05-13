<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="报表①">
	<aos:include lib="ext" />
	<aos:base href="demo/report" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:formpanel id="_f_query" layout="column" labelWidth="70" header="false"  region="north" border="false">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="查询条件" />
			</aos:docked>
			<aos:textfield name="card_id_" fieldLabel="信用卡号" columnWidth="0.33" />
			<aos:textfield name="id_no_" fieldLabel="身份证号" columnWidth="0.33"  />
			<aos:datefield name="birthday_" fieldLabel="出生日期" format="Y-m-d" editable="false" columnWidth="0.33" />
			<aos:textfield name="name_" fieldLabel="持卡人" columnWidth="0.33" />
			<aos:numberfield name="credit_line_" fieldLabel="信用额度" columnWidth="0.33" />
			<aos:numberfield name="balance_" fieldLabel="可用余额" columnWidth="0.33" />
			<aos:docked dock="bottom" ui="footer" margin="0 0 8 0">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="查询" icon="query.png" />
				<aos:dockeditem xtype="button" text="重置" icon="refresh.png" />
				<aos:dockeditem xtype="tbfill" />
			</aos:docked>
		</aos:formpanel>
		
		<aos:gridpanel id="_g_account" url="listAccounts.jhtml" onrender="_g_account_query" region="center">
			<aos:docked forceBoder="1 0 1 0">
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="预览HTML报表" icon="icon78.png" onclick="fn_html" />
				<aos:dockeditem text="预览PDF报表" icon="icon63.png" onclick="fn_pdf" />
				<aos:dockeditem text="导出XLS报表" icon="icon70.png" onclick="fn_xls" />
				<aos:dockeditem text="导出XLSX报表" icon="icon7.png" onclick="fn_xlsx" />
				<aos:dockeditem text="导出DOCX报表" icon="icon77.png" onclick="fn_docx" />
				<aos:dockeditem text="导出PPTX报表" icon="icon88.png" onclick="fn_pptx" />
			</aos:docked>
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="信用卡号" dataIndex="card_id_" width="80" />
			<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
			<aos:column header="身份证号" dataIndex="id_no_" width="120" />
			<aos:column header="持卡人" dataIndex="name_" width="80" />
			<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
			<aos:column header="可用余额" dataIndex="balance_" type="number" />
			<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60" />
			<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" />
			<aos:column header="年龄" dataIndex="age_" width="60" />
			<aos:column header="创建时间" dataIndex="create_time_" width="160" />
			<aos:column header="持卡人住址" dataIndex="address_" width="180" />
		</aos:gridpanel>
	</aos:viewport>
	<script type="text/javascript">
		//加载表格数据
		function _g_account_query() {
			_g_account_store.loadPage(1);
		}

		//生成HTML报表
		function fn_html() {
			AOS.ajax({
				url : 'fillReport.jhtml',
				ok : function(data) {
					parent.fnaddtab('${param.aos_module_id_ }_1', '预览HTML报表',
							'report/html.jhtml');
				}
			});
		}

		//生成PDF报表
		function fn_pdf() {
			AOS.ajax({
				url : 'fillReport.jhtml',
				ok : function(data) {
					parent.fnaddtab('${param.aos_module_id_ }_2', '预览PDF报表',
							'report/pdf.jhtml');
				}
			});
		}

		//生成XLS报表
		function fn_xls() {
			AOS.ajax({
				url : 'fillReport.jhtml',
				ok : function(data) {
					AOS.file('${cxt}/report/xls.jhtml');
				}
			});
		}

		//生成XLSX报表
		function fn_xlsx() {
			AOS.ajax({
				url : 'fillReport.jhtml',
				ok : function(data) {
					AOS.file('${cxt}/report/xlsx.jhtml');
				}
			});
		}

		//生成DOCX报表
		function fn_docx() {
			AOS.ajax({
				url : 'fillReport.jhtml',
				ok : function(data) {
					AOS.file('${cxt}/report/docx.jhtml');
				}
			});
		}

		//生成PPTX报表
		function fn_pptx() {
			AOS.ajax({
				url : 'fillReport.jhtml',
				ok : function(data) {
					AOS.file('${cxt}/report/pptx.jhtml');
				}
			});
		}
	</script>
</aos:onready>
</aos:html>
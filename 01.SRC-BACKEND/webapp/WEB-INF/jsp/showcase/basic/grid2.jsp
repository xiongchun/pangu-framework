<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="表格组件二" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:tabpanel id="_id_tabs" region="center" tabPosition="bottom" bodyBorder="0 0 0 0" margin="0 0 2 0">

			<%-- 
		    <aos:tab title="表头分组表格" layout="anchor" border="false" autoScroll="true">
			</aos:tab>
			--%>

			<aos:tab title="统计汇总表格" layout="anchor" border="false" autoScroll="true">
				<!-- 演示客户端对当前页进行统计 -->
				<aos:gridpanel id="_grid1" url="demoService.listAccounts" autoLoad="true" title="当前页统计汇总表格" features="summary" anchor="100% 40%" border="true" margin="5">
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id_" hidden="true" />
					<!-- 可以对统计值进行格式化显示 -->
					<aos:column header="信用卡号" dataIndex="card_id_" summaryType="count" summaryRenderer="function(v){return '共 ' + v + ' 人'}" fixedWidth="120" />
					<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
					<aos:column header="身份证号" dataIndex="id_no_" width="140" />
					<aos:column header="持卡人" dataIndex="name_" width="80" />
					<aos:column header="信用额度" dataIndex="credit_line_" type="number" summaryType="sum" width="100" />
					<aos:column header="可用余额" dataIndex="balance_" type="number" summaryType="average" width="100" />
					<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60" />
					<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" width="100" />
					<aos:column header="年龄" dataIndex="age_" width="60" />
					<aos:column header="创建时间" dataIndex="create_time_" width="160" />
				</aos:gridpanel>

				<aos:panel layout="border" title="所有页全局统计汇总表格" anchor="100% 60%" border="true" margin="5 5 0 5">
					<aos:panel region="north" bodyBorder="0 0 1 0">
						<aos:formpanel id="_f_query" layout="column" labelWidth="70" header="false" border="false">
							<aos:textfield name="name_" fieldLabel="持卡人姓名" columnWidth="0.25" />
							<aos:combobox name="card_type_" fieldLabel="卡类型" dicField="card_type_" columnWidth="0.25" />
							<aos:textfield name="card_id_" fieldLabel="信用卡号" columnWidth="0.25" />
							<aos:button text="查询" onclick="_grid2_query" icon="query.png" margin="0 10 0 10" />
							<aos:button text="重置" onclick="AOS.reset(_f_query);" icon="refresh.png" />
						</aos:formpanel>
					</aos:panel>
					<aos:gridpanel id="_grid2" url="demoService.listAccounts" onrender="_grid2_query" features="summary" region="center" bodyBorder="1 0 1 0">
						<aos:column type="rowno" />
						<aos:column header="流水号" dataIndex="id_" hidden="true" />
						<aos:column header="信用卡号" dataIndex="card_id_" summaryRenderer="function(){return '共 ' + summary.count_ + ' 人'}"  width="90" />
						<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
						<aos:column header="身份证号" dataIndex="id_no_" />
						<aos:column header="持卡人" dataIndex="name_" width="80" />
						<aos:column header="信用额度" dataIndex="credit_line_" type="number" summaryRenderer="function(){return '合计:' + summary.sum_credit_line_}" width="100" />
						<aos:column header="可用余额" dataIndex="balance_" type="number" summaryRenderer="function(){return '合计:' + summary.sum_balance_}" width="100" />
						<aos:column header="性别" dataIndex="sex_" fixedWidth="60" />
						<aos:column header="年龄" dataIndex="age_" summaryRenderer="function(){return '最大:' + summary.max_age_} "  width=" 100"  />
						<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" width="100" />
					</aos:gridpanel>
				</aos:panel>
			</aos:tab>
		</aos:tabpanel>
	</aos:viewport>

	<script type="text/javascript">
		//全量统计+表格查询
		var summary = {
				sum_credit_line_:0
		}
		function _grid2_query() {
			var params = AOS.getValue('_f_query');
			AOS.ajax({
				wait : false, //防止出现2个遮罩层。(ajax和表格load)
				params : params,
				url : 'demoService.querySummary',
				ok : function(data) {
					summary = data;
					_grid2_store.getProxy().extraParams = params;
					_grid2_store.loadPage(1);
				}
			});
		}
	</script>
</aos:onready>
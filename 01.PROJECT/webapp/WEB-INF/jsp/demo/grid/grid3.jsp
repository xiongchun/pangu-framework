<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="客户端分页表格">
	<aos:include lib="ext" />
	<aos:base href="demo/grid" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
	    <%-- !pageType属性是重点 --%>
		<aos:gridpanel id="_g_account" pageType="client" onrender="_g_account_query">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="客户端过滤：姓名" id="_name_" onenterkey="fn_filter" trigger1Cls="trigger-filter" 
					onTrigger1Click="fn_filter" width="200" />
			</aos:docked>
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
			<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
			<aos:column header="身份证号" dataIndex="id_no_" width="140" />
			<aos:column header="持卡人" dataIndex="name_" width="80" />
			<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
			<aos:column header="可用余额" dataIndex="balance_" type="number" />
			<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60" />
			<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y年m月d日" />
			<aos:column header="年龄" dataIndex="age_" width="60" />
			<aos:column header="创建时间" dataIndex="create_time_" width="160" />
			<aos:column header="持卡人住址" dataIndex="address_" width="180" />
		</aos:gridpanel>
	</aos:viewport>
	<script type="text/javascript">
		//客户端分页 加载表格数据的方法和数据库物理分页的方法也不一样
		function _g_account_query() {
			AOS.mask('正在读取数据, 请稍候...', _g_account);
			AOS.ajax({
				wait : false,
				url : 'listAccounts4ClientPage.jhtml',
				ok : function(data) {
					_g_account_store.proxy.data = data;
					_g_account_store.loadPage(1,{
						callback : function() {
							AOS.unmask();
						}
					});
				}
			});
		}
		
		//客户端自定义过滤
		function fn_filter() {
			_g_account_store.clearFilter(true);
			_g_account_store.filterBy(function(record) {
			var name_ = record.get('name_');
				if (name_.indexOf(_name_.getValue()) != -1) {
					return true;
				}
			});
			_g_account_store.sort('name_', 'DESC');
		}
	</script>
</aos:onready>
</aos:html>
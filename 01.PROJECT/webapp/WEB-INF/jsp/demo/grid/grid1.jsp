<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="表格①">
	<aos:include lib="ext" />
	<aos:base href="demo/grid" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_account" url="listAccounts.jhtml" onrender="_g_account_query">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
				<aos:dockeditem xtype="tbfill" />
				<aos:triggerfield emptyText="姓名" id="_name_" onenterkey="_g_account_query" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="_g_account_query" width="200" />
			</aos:docked>
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="信用卡号" dataIndex="card_id_" rendererFn="fn_link_render" width="80" minWidth="80" maxWidth="80" align="center" />
			<%-- 演示数据字典代码转换功能 --%>
			<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
			<aos:column header="身份证号" dataIndex="id_no_" width="140" />
			<aos:column header="持卡人" dataIndex="name_" width="80" />
			<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
			<aos:column header="可用余额" dataIndex="balance_" type="number" />
			<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60" />
			<%-- 演示日期时间字段的前端格式化功能 --%>
			<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y年m月d日" />
			<aos:column header="年龄" dataIndex="age_" width="60" />
			<aos:column header="创建时间" dataIndex="create_time_" width="160" />
			<aos:column header="持卡人住址" dataIndex="address_" width="180" />
		</aos:gridpanel>
	</aos:viewport>
	<script type="text/javascript">
		//加载表格数据
		function _g_account_query() {
			var params = {
				name_ : _name_.getValue()
			};
			//这个Store的命名规则为：表格ID+"_store"。
			_g_account_store.getProxy().extraParams = params;
			_g_account_store.loadPage(1);
		}

		//加载表格数据2  可以动态变更表格加载数据的url（很少用到）
		function _g_account_query2() {
			var params = {
				name_ : _name_.getValue()
			};
			//这个可以动态指定加载数据的url
			_g_account_store.getProxy().url = 'listAccounts.jhtml';
			//这个Store的命名规则为：表格ID+"_store"。
			_g_account_store.getProxy().extraParams = params;
			_g_account_store.loadPage(1);
		}
        
		//获取表格当前行数的API
		function getCount() {
			var count = _g_account_store.getCount();
			console.log(count);
		}
		
		_g_account.on("cellclick", function(pGrid, rowIndex, columnIndex, e) {
			var record = AOS.selectone(_g_account);
			if(columnIndex === 1){
				AOS.info("信用卡号：" + record.data.card_id_);
			}
		});
		
		//超链接列转换
		function fn_link_render(value, metaData, record, rowIndex, colIndex,
				store) {
			
			return '<a href="javascript:void(0);">' +  record.data.card_id_ + '</a>';
		}
	</script>
</aos:onready>
</aos:html>
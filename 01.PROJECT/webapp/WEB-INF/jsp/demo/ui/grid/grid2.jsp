<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="表格②">
	<aos:include lib="ext" />
	<aos:base href="demo/ui/grid" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:gridpanel id="_g_north" region="north" url="listAccounts.jhtml" onrender="_g_north_query" pageSize="20" 
			height="300">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息①" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="行数据" tooltip="获取数据表选择行的指定字段集合[逗号分隔]" icon="icon75.png" onclick="fnaos_rows_s" />
				<aos:dockeditem text="行数据2" tooltip="获取数据表选择行的所有字段集合[JSON]" icon="icon75.png" onclick="fnaos_rows_s2" />
				<aos:dockeditem text="行数" icon="icon75.png" onclick="fn_rows" />
				<aos:dockeditem xtype="tbfill" />
				<aos:triggerfield emptyText="姓名" id="_name_" onenterkey="_g_north_query" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="_g_north_query" width="200" />
			</aos:docked>
			<aos:column type="rowno" />
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
			<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
			<aos:column header="身份证号" dataIndex="id_no_" width="140" />
			<aos:column header="持卡人" dataIndex="name_" width="80" />
			<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
			<aos:column header="可用余额" dataIndex="balance_" rendererFn="fn_balance_render2" type="number" />
			<%-- 演示字段的renderer函数功能 --%>
			<aos:column header="性别" dataIndex="sex_" rendererFn="fn_sex_render" align="center" width="60" />
			<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" />
			<aos:column header="年龄" dataIndex="age_" width="60" />
			<aos:column header="创建时间" dataIndex="create_time_" width="160" />
			<aos:column header="持卡人住址" dataIndex="address_" width="180" />
			<aos:column header="操作" type="action" width="60">
				<aos:action handler="fn_do" icon="edit.png" tooltip="审批" />
				<aos:action handler="fn_do" icon="del.png" tooltip="删除" />
			</aos:column>
		</aos:gridpanel>
		<aos:gridpanel id="_g_west" region="west" split="true" splitterBorder="0 1 0 1" header="false"
			url="listAccounts.jhtml" onrender="_g_west_query" hidePagebar="true" pageSize="200" width="300"
			onitemclick="fn_click" >
			<aos:docked forceBoder="1 0 1 0">
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息②" />
				<aos:dockeditem xtype="tbfill" />
				<aos:triggerfield emptyText="客户端过滤：姓名" id="_name_2" onenterkey="fn_filter" trigger1Cls="trigger-filter" 
					onTrigger1Click="fn_filter" width="150" />
			</aos:docked>
			<aos:column header="持卡人" dataIndex="name_" width="80" />
			<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
			<aos:column header="可用余额" dataIndex="balance_" rendererFn="fn_balance_render2" type="number" />
		</aos:gridpanel>
		<aos:gridpanel id="_g_center" region="center" url="listAccounts.jhtml" onrender="_g_center_query" onitemdblclick="fn_dbclick" >
			<aos:docked forceBoder="1 0 1 0">
				<aos:dockeditem xtype="tbtext" text="信用卡账户信息③" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="刷新表格" onclick="_g_center_reload" icon="send_receive.png" />
			</aos:docked>
			<aos:column type="rowno" />
			<aos:selmodel type="checkbox" mode="simple" />
			<%-- 演示锁定咧 --%>
			<aos:column header="流水号" locked="true" dataIndex="id_" />
			<aos:column header="持卡人" locked="true" dataIndex="name_" width="80" />
			<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
			<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
			<aos:column header="身份证号" dataIndex="id_no_" width="140" />
			<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
			<aos:column header="可用余额" dataIndex="balance_" rendererFn="fn_balance_render" type="number" />
			<%-- 演示模版列的使用 --%>
			<aos:column header="模版列" type="template" tpl="{name_}<span style=color:red>{age_}</span>岁了 " width="120" />
			<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60" />
			<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y年m月d日" width="120" />
			<aos:column header="年龄" dataIndex="age_" width="60" />
			<aos:column header="创建时间" dataIndex="create_time_" width="160" />
			<%-- 这个Flex属性会让表格在溢出时出现横向滚动条，而不是自动压缩列。 --%>
			<aos:column header="持卡人住址" dataIndex="address_" minWidth="180" flex="1" />
		</aos:gridpanel>
	</aos:viewport>
	<script type="text/javascript">
		//加载center表格数据
		function _g_center_query() {
			_g_center_store.load();
		}

		//加载west表格数据
		function _g_west_query() {
			_g_west_store.load();
		}

		//刷新west表格数据
		function _g_center_reload() {
			_g_center_store.reload();
		}

		//加载north表格数据
		function _g_north_query() {
			var params = {
				name_ : _name_.getValue()
			};
			_g_center_store.getProxy().extraParams = params;
			_g_north_store.load();
		}

		//表格单击事件
		function fn_click(obj, record) {
			AOS.tip('你单击了行：姓名[' + record.data.name_ + ']');
		}

		//表格双击事件
		function fn_dbclick(obj, record) {
			AOS.tip('你双击了行：姓名[' + record.data.name_ + ']');
		}

		//获取表格选择行的指定字段集合[逗号分隔]
		function fnaos_rows_s() {
			var selection = AOS.selection(_g_north, 'card_id_');
			if (AOS.empty(selection)) {
				AOS.tip('请先选择表格行。');
				return;
			} else {
				AOS.tip(selection);
			}
			AOS.ajax({
				params : {
					aos_rows_ : selection
				},
				url : 'saveSelect.jhtml',
				ok : function(data) {
					AOS.info(data.appmsg);
				}
			});
		}

		//获取数据表选择行的所有字段集合[JSON]
		function fnaos_rows_s2() {
			var selection = AOS.selection2(_g_north);
			if (AOS.empty(selection)) {
				AOS.tip('请先选择表格行。');
				return;
			} else {
				AOS.tip(selection);
			}
			AOS.ajax({
				params : {
					aos_rows_ : selection
				},
				url : 'saveSelect2.jhtml',
				ok : function(data) {
					AOS.info(data.appmsg);
				}
			});
		}

		//已选行数
		function fn_rows() {
			AOS.tip('已选行数：' + AOS.rows(_g_north));
		}

		//处理图标列
		function fn_do(grid, rowIndex, colIndex) {
			var rec = grid.getStore().getAt(rowIndex);
			AOS.tip("可以获取当前行的任意数据传给后台: " + "[卡号：" + rec.get('card_id_') + "]");
		}

		//sex_列转换
		function fn_sex_render(value, metaData, record, rowIndex, colIndex,
				store) {
			if (value === '1') {
				return value = '<img src="${cxt}/static/icon/user8.png" />';
			} else if (value === '2') {
				return value = '<img src="${cxt}/static/icon/user1.png" />';
			} else {
				return value = '<img src="${cxt}/static/icon/user6.png" />';
			}
		}

		//balance_列转换
		function fn_balance_render(value, metaData, record, rowIndex, colIndex,
				store) {
			//metaData.tdAttr = 'data-qtip="'+value+'"';
			if (value >= 50000) {
				metaData.style = 'background-color:#99FF99';
				return value;
			} else {
				return value;
			}
		}

		//balance_列转换
		function fn_balance_render2(value, metaData, record, rowIndex,
				colIndex, store) {
			if (value >= 50000) {
				return AOS.merge('<span style="color:green">{0}</span>', value);
			} else {
				return AOS.merge('<span style="color:#CC0000">{0}</span>',
						value);
			}
		}
		
		//客户端自定义过滤
		function fn_filter() {
			_g_west_store.clearFilter(true);
			_g_west_store.filterBy(function(record) {
			var name_ = record.get('name_');
				if (name_.indexOf(_name_2.getValue()) != -1) {
					return true;
				}
			});
			//_g_west_store.sort('name_', 'DESC');
		}
	</script>
</aos:onready>
</aos:html>
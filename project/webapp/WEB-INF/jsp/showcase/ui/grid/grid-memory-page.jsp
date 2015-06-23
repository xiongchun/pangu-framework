<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
	<aos:base href="/showcase/tag/" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:window title="个人账户列表" autoShow="true" maximized="true" layout="fit" maximizable="true">
		<aos:gridpanel id="_mygrid" pageType="client" pageSize="20" onrender="_mygrid_query">
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="az01a0" width="280" hidden="true" />
			<aos:column header="卡号" dataIndex="az01a1" align="center" />
			<aos:column header="姓名" dataIndex="az01a2" sortable="false" celltip="true" />
			<aos:column header="出生日期" dataIndex="az01a4" type="date" width="150" format="Y-m-d" />
			<aos:column header="电子邮件" dataIndex="az01a5" width="180" />
			<aos:column header="身份证号" dataIndex="az01a6" width="150" />
			<aos:column header="籍贯" dataIndex="az01a7" flex="1" />
		</aos:gridpanel>
	</aos:window>
	<script type="text/javascript">
		function _mygrid_query() {
			App.mask(_mygrid, '正在读取数据, 请稍候..');
			App.ajax({
				wait : false,
				url : 'listCards4Memory.jhtml',
				ok : function(data) {
					_mygrid_store.proxy.data = data;
					_mygrid_store.load({
						callback : function() {
							App.unmask();
						}
					});
				}
			});
		}
	</script>
</aos:onready>
</aos:html>
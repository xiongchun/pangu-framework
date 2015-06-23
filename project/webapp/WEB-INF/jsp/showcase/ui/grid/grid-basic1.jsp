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
		<aos:gridpanel url="listCards.jhtml" autoLoad="true" pageSize="100">
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="az01a0" width="280" />
			<aos:column header="卡号" dataIndex="az01a1" width="100" align="center" />
			<aos:column header="姓名" dataIndex="az01a2" sortable="false" width="100" celltip="true" />
			<aos:column header="性别" dataIndex="az01a3" width="60" defaultValue="未知" rendererFn="fntest1" celltip="true" />
			<aos:column header="出生日期" dataIndex="az01a4" type="date" width="150" format="Y-m-d" />
			<aos:column header="电子邮件" dataIndex="az01a5" width="180" />
			<aos:column header="身份证号" dataIndex="az01a6" width="150" />
			<aos:column header="籍贯" dataIndex="az01a7" flex="1" />
		</aos:gridpanel>
	</aos:window>
	<script type="text/javascript">
		function fntest1(value, metaData, record, rowIndex, colIndex, store) {
			//metaData.tdAttr = 'data-qtip="'+value+'"';
			if (value === '1') {
				return value = '<b>男</b>';
			} else if (value === '2') {
				metaData.style = 'background-color:red';
				return value = '女';
			} else {
				return value = '人妖';
			}
		}

		//客户端删除行记录
		function fnRemoveRows() {
			var records = _g_table1.getSelectionModel().getSelection();
			Ext.Array.each(records, function(record) {
				_g_table1_store.remove(record);
				_g_table1_store.sort(); //重新排序号
			});
		}

		//非空Render
		function fnNotnullRenderer(value) {
			if (value) {
				var src = '${cxt}/static/icon/ok1.png';
				return App.merge('<img src={0} />', src);
			} else {
				return '';
			}
		}

		//需要设置idProperty="id_"属性，但设置后获取到的数据似乎不是最新的数据
		//var g_record = _g_org_store.getById(record.data.id);
		//_g_org.getSelectionModel().select(g_record);

		//var g_record = _g_org_store.find('id_', record.data.id);
	</script>
</aos:onready>
</aos:html>
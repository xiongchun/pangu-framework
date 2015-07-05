<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
	<aos:base href="/showcase/tag/" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:window title="个人账户列表" autoShow="true" maximized="true" layout="fit" width="1024" height="600" maximizable="true">
		<aos:gridpanel id="_mygrid" url="listCards.jhtml" autoLoad="true" forceFit="false" pageSize="1000">
			<aos:docked>
				<aos:dockeditem xtype="button" onclick="fnGetSelections" text="获取选中行" icon="ok.png" />
			</aos:docked>
			<aos:selmodel type="checkbox" mode="multi" id="_id_mygrid_selmodel" />
			<aos:column type="rowno" />
			<aos:column header="操作" type="action" width="45" locked="true">
				<aos:action handler="fnEdit" icon="edit.png" tooltip="修改" />
			</aos:column>
			<aos:column header="流水号" dataIndex="az01a0" width="280" hidden="true" />
			<aos:column header="卡号" dataIndex="az01a1" width="100" align="center" locked="true" />
			<aos:column header="姓名" dataIndex="az01a2" sortable="false" width="100" locked="true" />
			<aos:column header="性别" dataIndex="az01a3" width="60" rendererFn="fnAz01a3Renderer" />
			<aos:column header="卡状态" dataIndex="az01b2" rendererField="az01b2" />
			<aos:column header="卡余额" dataIndex="az01b3" type="number" format="0,000.00" />
			<aos:column header="可用透支余额" dataIndex="az01b4" type="number" format="0,000.00" />
			<aos:column header="出生日期" dataIndex="az01a4" type="date" width="150" format="Y-m-d" />
			<aos:column header="电子邮件" dataIndex="az01a5" width="180" lockable="false" />
			<aos:column header="身份证号" dataIndex="az01a6" width="150" />
			<aos:column header="固定联系电话" dataIndex="az01a8" width="150" />
			<aos:column header="手机" dataIndex="az01a9" />
			<aos:column header="模版列" type="template" tpl="<b>({az01a2})</b> {az01a9}" width="180" />
			<aos:column header="帐单日" dataIndex="az01b1" type="date" format="Y-m-d" />
			<aos:column header="所属银行名称" dataIndex="az01b5" width="200" />
			<aos:column header="所属银行流水号" dataIndex="az01b6" hidden="true" />
			<aos:column header="籍贯" dataIndex="az01a7" width="250" />
			<aos:column header="头像照片存储路径" dataIndex="az01b9" width="150" hidden="true" />
			<aos:column header="办卡时间" dataIndex="az01b7" width="150" type="date" format="Y-m-d H:i:s" />
			<aos:column header="经办人" dataIndex="az01b8" />
			<aos:column header="已删除" type="check" dataIndex="az01z9" width="60" />
			<aos:column header="操作" type="action" width="60">
				<aos:action handler="fnEdit" icon="edit.png" tooltip="修改" />
				<aos:action handler="fnEdit" icon="del.png" tooltip="删除" />
			</aos:column>
		</aos:gridpanel>
	</aos:window>
	<script type="text/javascript">
		function fnEdit(grid, rowIndex, colIndex) {
			var rec = grid.getStore().getAt(rowIndex);
			alert("修改: " + rec.get('az01a2'));
		}

		function fnAz01a3Renderer(value) {
			if (value === '1') {
				return '男';
			} else if (value === '2') {
				return '女';
			} else {
				return '未知';
			}
		}

		function fnGetSelections() {
			var selected = App.selection(_mygrid, 'az01a0');
			if (Ext.isEmpty(selected)) {
				alert('请先选择');
				return;
			}
			alert(selected);
		}
	</script>
</aos:onready>
</aos:html>
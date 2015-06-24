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
		<aos:gridpanel url="listCards.jhtml" autoLoad="true" forceFit="true" pageSize="100" id="mygrid">
			<aos:plugins>
				<aos:editing ptype="cellediting" clicksToEdit="2" onedit="fnedit" />
			</aos:plugins>
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="az01a0" width="280" hidden="true" />
			<aos:column header="卡号" dataIndex="az01a1" width="100" />
			<aos:column header="姓名" dataIndex="az01a2" sortable="false" width="100">
				<aos:textfield allowBlank="false" />
			</aos:column>
			<aos:column header="性别" dataIndex="az01a3" width="60" rendererFn="fnAz01a3Renderer">
				<aos:combobox>
					<%-- 也可以使用远程数据源和字典数据源 --%>
					<aos:option value="1" display="男" />
					<aos:option value="2" display="女" />
				</aos:combobox>
			</aos:column>
			<aos:column header="卡状态" dataIndex="az01b2" editor="textfield">
				<aos:numberfield allowBlank="false" maxValue="3" minValue="1" />
			</aos:column>
			<aos:column header="卡余额" dataIndex="az01b3" type="number" format="0,000.00" editor="numberfield" />
			<aos:column header="可用透支余额" dataIndex="az01b4" type="number" format="0,000.00" />
			<aos:column header="出生日期" dataIndex="az01a4" type="date" width="150" format="Y-m-d" editor="datefield" />
			<aos:column header="电子邮件" dataIndex="az01a5" flex="1" editor="textfield" />
		</aos:gridpanel>
	</aos:window>
	<script type="text/javascript">
		function fnAz01a3Renderer(value) {
			if (value === '1') {
				return '男';
			} else if (value === '2') {
				return '女';
			} else {
				return '未知';
			}
		}

		//监听编辑事件
		function fnedit(editor, e) {
			//App.tip('监听编辑事件。' + e.record.data.az01a2);
			//e.record.commit();
		}
	</script>
</aos:onready>
</aos:html>
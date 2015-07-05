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
	<aos:window title="下拉选择框" autoShow="true" width="600" layout="fit">
		<aos:formpanel layout="column" labelWidth="140" center="true">
			<aos:combobox fieldLabel="性别(客户端数据源)" multiSelect="true" name="name1" editable="false" id="_id_combo1"  columnWidth="0.5">
				<aos:option value="1" display="男" />
				<aos:option value="2" display="女" />
				<aos:option value="0" display="未知" />
			</aos:combobox>
			<aos:combobox fieldLabel="卡状态(数据字典数据源)" name="az01b2" dicField="az01b2" editable="false" columnWidth="0.5" />
			<aos:combobox fieldLabel="国籍(远程数据源)" name="name2" editable="false" columnWidth="0.5" url="listComboBoxData.jhtml" />

		</aos:formpanel>
		<aos:docked dock="bottom">
			<aos:dockeditem text="获取选中值" onclick="fntest" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">
		function fntest() {
			alert(_id_combo1.getValue());
		}
	</script>
</aos:onready>
</aos:html>
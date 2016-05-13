<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="组合选择框">
	<aos:include lib="ext" />
	<aos:base href="demo/ui" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:formpanel id="_f_info" autoShow="true" width="650" layout="column" title="组合选择框" icon="icon152.png"
			msgTarget="qtip" center="true">
			<aos:fieldset title="多级联动下拉选择框" labelWidth="90" columnWidth="1">
				<aos:combobox id="_bank_1" onselect="fn_bank1_onselect" fieldLabel="一级节点" name="bank_1_" emptyText="请选择分行..."
					columnWidth="0.5" url="listComboBoxData.jhtml" />
				<aos:combobox id="_bank_2" fieldLabel="二级节点" name="bank_2_"  queryMode="local" emptyText="请选择支行..." columnWidth="0.49"
					url="listComboBoxData2.jhtml" />
			</aos:fieldset>
		</aos:formpanel>
	</aos:viewport>
	<script type="text/javascript">
		function fn_bank1_onselect(me, records, eOpts) {
			var parent_id_ = me.getValue();
			_bank_2_store.getProxy().extraParams = {
				parent_id_ : parent_id_
			};
			_bank_2_store.load();
		}
	</script>
</aos:onready>
</aos:html>
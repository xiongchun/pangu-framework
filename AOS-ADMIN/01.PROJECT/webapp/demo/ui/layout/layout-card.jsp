<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:panel id="id_panels" region="center" layout="card" height="300" margin="50" split="true" title="card布局" width="200"
			collapsible="true">
			<aos:panel title="第一步" html="第一步" bodyPadding="5" border="false">
			</aos:panel>
			<aos:panel title="第二步" html="第二步" bodyPadding="5" border="false">
			</aos:panel>
			<aos:panel title="第三步" html="第三步" bodyPadding="5" border="false">
			</aos:panel>
			<aos:docked dock="bottom">
				<aos:dockeditem id="move_prev" xtype="button" onclick="fnnav('prev')" text="上一步" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem id="move_next" xtype="button" onclick="fnnav('next')" text="下一步" />
			</aos:docked>
		</aos:panel>
	</aos:viewport>
	<script type="text/javascript">
		Ext.getCmp('move_prev').setDisabled(true);
		function fnnav(nav) {
			var layout = id_panels.getLayout();
			layout[nav]();
			Ext.getCmp('move_prev').setDisabled(!layout.getPrev());
			Ext.getCmp('move_next').setDisabled(!layout.getNext());
		};
	</script>
</aos:onready>
</aos:html>
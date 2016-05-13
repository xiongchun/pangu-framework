<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:tabpanel id="_id_tabs" region="center" activeTab="1" width="500" plain="true" tabBarHeight="30">
		    <aos:plugins>
			    <aos:tabCloseMenu extraItemsTail1="刷新:test:refresh.png" />
			</aos:plugins>
			<aos:tab title="选项卡一">
				<aos:panel html="上海" border="false">
				</aos:panel>
			</aos:tab>
			<aos:tab title="选项卡二" closable="true">
				<aos:panel html="昆明" border="false">
				</aos:panel>
			</aos:tab>
			<aos:tab title="选项卡三" id="_id_tab3">
				<aos:panel html="苏州" border="false">
				</aos:panel>
			</aos:tab>
		</aos:tabpanel>
	</aos:viewport>
	<script type="text/javascript">
		_id_tabs.setActiveTab('_id_tab3');
	</script>
</aos:onready>
</aos:html>
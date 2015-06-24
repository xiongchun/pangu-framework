<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="按钮标签">
	<aos:include lib="a,ext" />
</aos:head>
<aos:body>
</aos:body>
<div id="_id_01"></div>
<aos:onready>
	<aos:button text="弹出窗口" renderTo="_id_01" margin="5" onclick="fnShowWindow">
	</aos:button>

	<aos:window id="_id_window" maximizable="true" layout="fit" title="详细信息" width="600" height="-20">
		<aos:panel html="测试">

		</aos:panel>
	</aos:window>

	<script type="text/javascript">
		function fnShowWindow() {
			_id_window.show();
		}
	</script>
</aos:onready>
</aos:html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="表单组件" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:formpanel id="form3" layout="column" region="center" labelWidth="110" title="表单3：事件绑定" border="true" anchor="100%" margin="5">
			<aos:textfield fieldLabel="绑定KeyDown事件" onkeydown="fn_onkeydown" emptyText="KeyDown事件" name="event5" columnWidth="0.25" />
			<aos:textfield fieldLabel="绑定KeyUP事件" onkeyup="fn_onkeyup" emptyText="KeyUP事件" name="event6" columnWidth="0.25" />
		</aos:formpanel>

	</aos:viewport>
	<script type="text/javascript">
		function fn_onkeydown(){
			alert(1);
		}
		
		function fn_onkeyup(){
			alert(1);
		}
	</script>
</aos:onready>
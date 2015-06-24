<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="Component标签">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:container width="500" height="200" margin="10" renderTo="!document.body" html="hi,mowen!"
		style="color:'#FFFFFF',backgroundColor:'blue'">
		<aos:on fn="fntest" event="render" />
	</aos:container>

	<script type="text/javascript">
		function fntest(obj) {
			//alert(obj.height);
		}
	</script>
</aos:onready>
</aos:html>
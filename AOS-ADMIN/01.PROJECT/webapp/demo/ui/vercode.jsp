<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="验证码">
	<aos:base href="/showcase/tag/" />
	<aos:include lib="ext" />
	<style type="text/css">
body {
	padding: 20px;
}
</style>
</aos:head>
<aos:body>
	<div id="_div" class="x-hidden" align="center">
		<aos:vercode id="_vercode" fontSize="28" length="5" width="120" />
	</div>
</aos:body>
<aos:onready>
	<aos:panel title="验证码" contentEl="_div" renderTo="!document.body" width="150" height="70" bodyPadding="5">
	</aos:panel>
	<script type="text/javascript">
		//定时自动切换
		AOS.task(function() {
			_vercode_refresh();
		}, 200);
	</script>
</aos:onready>

</aos:html>
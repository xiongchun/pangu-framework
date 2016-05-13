<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="欢迎">
	<aos:include lib="ext" />
	<aos:base href="system/portal"/>
	<style>
	body {
	 	background-color: #FFFFFF !important;
		background-attachment:fixed !important;
		background-position:bottom center !important;
		background-repeat: repeat-x !important;
	}
	</style>
</aos:head>
<aos:body>

</aos:body>
<aos:onready elAuth="false">
	<script type="text/javascript">
		//这个页面的背景图片需要延时设置，不能使用body标签的backGround属性
		Ext.util.CSS.createStyleSheet(
						'body {background-image:url("${cxt}/static/image/background/main/${curSkin}.png") !important; ',
						'_id_css_01');
	</script>
</aos:onready>
</aos:html>
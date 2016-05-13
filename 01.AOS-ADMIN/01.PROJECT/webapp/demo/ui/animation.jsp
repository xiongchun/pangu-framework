<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="动画">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:panel id="_id_panel1" icon="user1.png" collapsible="true" titleCollapse="true" margin="2" bodyPadding="5"
		autoShow="true" layout="fit" title="测试1" html="测试">
	</aos:panel>

	<script type="text/javascript">
		Ext.create('Ext.fx.Anim', {
			target : _id_panel1,
			duration : 600,
			from : {
				width : 0,
				height : 0
			},
			to : {
				width : 550,
				height : 350
			}
		});
	</script>
</aos:onready>
</aos:html>
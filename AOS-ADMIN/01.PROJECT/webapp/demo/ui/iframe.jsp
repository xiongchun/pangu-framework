<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="Iframe扩展组件">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
	<div id="_id_01"></div>
	<div id="_id_02"></div>
</aos:body>
<aos:onready ux="iframe">
	<aos:button text="加载页面" renderTo="_id_01" margin="5">
		<aos:menu>
			<aos:menuitem  text="加载页面1" icon="vcard.png" onclick="fntest1" />
			<aos:menuitem xtype="menuseparator" />
			<aos:menuitem  text="加载页面1" icon="vcard.png" onclick="fntest2" />
		</aos:menu>
	</aos:button>

	<script type="text/javascript">
		//也可使用修改后的，提供更多参数设置 AOS.ux.IFrame
		var iframe = new AOS.ux.IFrame({
			loadMask : '正在初始化页面, 请稍候...',
			width : 1024,
			height : 500,
			renderTo : '_id_02',
			src : 'http://git.oschina.net/osworks/AOS'
		});

		iframe.on('beforeload', function() {
			//alert('ok1');
		});

		function fntest1() {
			//只有用这种后加载模式才会出现遮罩层，
			iframe.load('http://git.oschina.net/osworks/AOS');
		}

		function fntest2() {
			iframe.load('http://git.oschina.net/osworks/AOS');
		}
	</script>
</aos:onready>
</aos:html>
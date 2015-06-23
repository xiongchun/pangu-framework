<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head title="按钮标签">
	<aos:include lib="a,ext" />
</aos:head>
<aos:body>
	<div id="_id_01"></div>
</aos:body>
<aos:onready>
	<aos:button text="按钮1" renderTo="_id_01" margin="5" scale="medium">
		<aos:menu>
			<aos:menuitem  text="菜单1" icon="vcard.png" onclick="fntest1" />
			<aos:menuitem xtype="menuseparator" />
			<aos:menuitem  text="菜单2" icon="vcard.png" onclick="fntest1" />
		</aos:menu>
	</aos:button>

	<script type="text/javascript">
		function fntest(btn) {
			alert(btn.text);
		}

		function fntest1() {
			alert('mw');
		}
	</script>
</aos:onready>
</aos:html>
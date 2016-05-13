<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="菜单">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:menu renderTo="!document.body" width="200" margin="10" floating="false">
		<aos:menuitem  text="菜单1">
			<aos:menuitem  text="菜单4" onclick="!fntest1" />
		</aos:menuitem>
		<aos:menuitem xtype="menuseparator" />
		<aos:menuitem  text="菜单2">
			<aos:menuitem  text="菜单3" onclick="fntest">
				<aos:menuitem  text="菜单5" onclick="fntest" />
				<aos:menuitem  text="菜单4" onclick="fntest">
					<aos:menuitem  text="菜单6" onclick="fntest" />
					<aos:menuitem  text="菜单7" onclick="fntest" />
				</aos:menuitem>
			</aos:menuitem>
		</aos:menuitem>
	</aos:menu>
	<script type="text/javascript">
		function fntest() {
			alert('mw');
		}

		function fntest1(btn) {
			alert(btn.text);
		}
	</script>
</aos:onready>
</aos:html>
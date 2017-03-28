<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html title="开关按钮" base="http" lib="ext">
<aos:body>
	<table>
		<tr>
			<td><div id="my02"></div></td>
			<td><div id="my03"></div></td>
			<td><div id="my04"></div></td>
			<td><div id="my05"></div></td>
			<td><div id="my06"></div></td>
		</tr>
	</table>
</aos:body>
<aos:onready>
	<aos:toggle offText="否" onText="是" state="true" renderTo="my02" onchange="fn_onchange" />
	<aos:toggle offText="注销" onText="正常" state="false" renderTo="my03" />
	<%-- 自定义显示样式 --%>
	<aos:toggle id="id_toggle1" offText="国民党" onText="共产党" state="true" renderTo="my04" />
	<aos:toggle id="id_toggle2" offText="共产党万岁" onText="国民党万岁" resizeHandle="false" renderTo="my05" />
	<aos:toggle xtype="togglefield" offText="否" onText="是" state="true" renderTo="my06" />
	<script type="text/javascript">
		//切换
		function fn_onchange(toggle, state) {
			AOS.tip(state.toString());
		}

		//定时自动切换
		AOS.task(function() {
			id_toggle1.toggle();
			id_toggle2.toggle();
		}, 1000);
	</script>
</aos:onready>

</aos:html>
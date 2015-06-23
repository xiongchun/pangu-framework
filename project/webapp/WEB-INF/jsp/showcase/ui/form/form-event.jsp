<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:window title="表单元素事件绑定" autoShow="true" width="500" layout="fit" maximizable="true" center="true">
		<aos:formpanel labelWidth="60" center="true" layout="anchor">
			<aos:textfield fieldLabel="姓名1" name="name" onchang="fnonchange" />
			<aos:textfield fieldLabel="姓名2" name="name" onenterkey="fnonenterkey" />
			<aos:textfield fieldLabel="姓名3" name="name" onspecialkey="fnonspecialkey" />
			<aos:textfield fieldLabel="姓名4" name="name">
				<%-- 这种方式可以对其父标签绑定任何Ext支持的事件 --%>
				<aos:on fn="fnonfocus" event="focus" />
			</aos:textfield>
			<aos:combobox multiSelect="true" fieldLabel="性别" name="name1" editable="false" onselect="fnonselect">
				<aos:option value="1" display="男" />
				<aos:option value="2" display="女" />
			</aos:combobox>
		</aos:formpanel>
	</aos:window>
	<script type="text/javascript">
		function fnonchange(obj) {
			alert(obj.getValue());
		}

		function fnonenterkey(obj) {
			alert(obj.getValue());
		}

		function fnonspecialkey(obj, e) {
			//根据这个按键key，可以监听任意功能键的按下事件
			alert(e.getKey());
		}

		function fnonfocus(obj) {
			alert(obj.fieldLabel);
		}

		function fnonselect(obj) {
			alert(obj.getValue());
		}

		function fntest() {
		}
	</script>
</aos:onready>
</aos:html>
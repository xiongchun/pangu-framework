<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
	<aos:base href="/showcase/tag/" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:window title="表单提交" autoShow="true" center="true" closable="false">
		<aos:formpanel id="orgForm" width="400" layout="anchor" labelWidth="60" border="false" padding="10 0 0 0" margin="0">
			<aos:textfield fieldLabel="部门" name="orgname" anchor="97%" allowBlank="false" />
		</aos:formpanel>
		<aos:formpanel id="loginForm" width="400" layout="anchor" labelWidth="60" border="false" padding="0 0 0 0" rowSpace="10">
			<aos:textfield fieldLabel="用户名" name="username" anchor="97%" allowBlank="false" />
			<aos:textfield fieldLabel="密  码" name="password" inputType="password" allowBlank="false" anchor="97%" />
			<aos:checkboxgroup fieldLabel="" padding="0 0 0 60" columns="1">
				<aos:checkbox name="remberme" boxLabel="系统记住我" />
			</aos:checkboxgroup>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" onclick="fnlogin" text="登 录" padding="5 10 5 10" />
				<aos:dockeditem xtype="button" onclick="fnlogin1" text="登 录(自定义Ajax)" padding="5 10 5 10" />
				<aos:dockeditem xtype="button" onclick="fnreset" text="重 置" padding="5 10 5 10" />
				<aos:dockeditem xtype="tbfill" />
			</aos:docked>
		</aos:formpanel>
	</aos:window>
	<script type="text/javascript">
		function fnlogin() {
			AOS.ajax({
				//只提交一个表单
				forms : loginForm,
				url : 'doLogin.jhtml',
				ok : function(data) {
					AOS.info(data.appmsg);
				}
			});
		}

		function fnlogin1() {
			AOS.ajax({
				//wait:false, 也可以禁用自带的等待对话框，自己写AOS.wait()和AOS.hide()来控制
				//params: params, 也可以传参数进去，后台会自动合并
				wmsg : '也可以自定义等待提示信息',
				//可以同时传多个表单
				forms : [ loginForm, orgForm ],
				url : 'doLogin.jhtml',
				ok : function(data) {
					//data参数为服务器返回的json参数，AOS.ajax已经将其转换为Json JS对象传出
					AOS.info(data.appmsg);
				}
			});
		}

		function fnreset() {
			//复合参数，可以是一个表单对象，也可以是一个表单对象数组
			AOS.reset([ loginForm, orgForm ]);
		}
	</script>
</aos:onready>
</aos:html>
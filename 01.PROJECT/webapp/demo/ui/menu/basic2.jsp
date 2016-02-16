<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:window title="菜单演示" autoShow="true" layout="border" width="800" height="600" center="true" frame="true">
			<aos:panel region="north" frame="false" html="OSWorks" height="60">
			</aos:panel>
			<aos:panel region="west" title="系统导航"  width="180" split="true">
				<aos:menu floating="false" plain="true" border="false">
					<aos:menuitem text="我的个人资料" icon="user8.png" />
					<aos:menuitem text="我的偏好设置" icon="share.png" />
					<aos:menuitem text="系统安全选项" icon="security.png" />
					<aos:menuitem text="自定义菜单" icon="icon146.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="我的操作日志" icon="icon75.png" />
				</aos:menu>
			</aos:panel>
			<aos:panel region="center" title="测试1">
			</aos:panel>
		</aos:window>
	</aos:viewport>
</aos:onready>
</aos:html>
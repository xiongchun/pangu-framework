<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="Vector图标">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:panel id="_id_panel1" collapsible="true" titleCollapse="true" margin="20" bodyPadding="5" autoShow="true"
		layout="fit" title="演示矢量图标" iconVec="fa-coffee" width="800" html="测试">
		<aos:docked dock="top">
			<aos:dockeditem xtype="button" text="设置" iconVec="fa-bars">
				<aos:menu>
					<aos:menuitem  text="菜单1" iconVec="fa-wrench" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem  text="菜单2" iconVec="fa-pagelines" />
				</aos:menu>
			</aos:dockeditem>
			<aos:dockeditem xtype="button" text="新增" iconVec="fa-plus" />
		</aos:docked>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem text="保存" iconVec="fa-check" />
			<aos:dockeditem text="关闭" iconVec="fa-times" />
			<aos:dockeditem xtype="tbfill" />
		</aos:docked>
	</aos:panel>
</aos:onready>
</aos:html>
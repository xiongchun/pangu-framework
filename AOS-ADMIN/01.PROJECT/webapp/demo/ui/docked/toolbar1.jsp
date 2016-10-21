<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="Toolbar标签">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
	<div id="_id_01"></div>
</aos:body>
<aos:onready>
	<aos:panel id="_id_panel1" icon="config.png" collapsible="true" margin="5" width="500" titleCollapse="true"
		html="AOS应用基础平台" bodyPadding="5" renderTo="_id_01" layout="fit" title="测试1">
		<aos:docked dock="top">
			<aos:dockeditem xtype="tbtext" text="文本1" />

			<aos:dockeditem xtype="button" text="按钮" icon="vcard.png">
				<aos:menu>
					<aos:menuitem  text="菜单1">
						<aos:menuitem  text="菜单4" onclick="fntest" />
					</aos:menuitem>
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
			</aos:dockeditem>
			<aos:button text="发射">
				<aos:menu>
					<aos:menuitem  text="菜单1">
						<aos:menuitem  text="菜单4" onclick="fntest" />
					</aos:menuitem>
					<aos:menuitem  text="菜单2">
						<aos:menuitem  text="菜单3" onclick="fntest">
							<aos:menuitem  text="菜单4" onclick="fntest">
								<aos:menuitem  text="菜单6" onclick="fntest" />
								<aos:menuitem  text="菜单7" onclick="fntest" />
							</aos:menuitem>
						</aos:menuitem>
					</aos:menuitem>
				</aos:menu>
			</aos:button>
			<aos:dockeditem xtype="tbfill" />
			<aos:textfield labelAlign="right" labelWidth="50" name="name1" emptyText="姓名" />
		</aos:docked>

		<aos:docked dock="bottom">
			<aos:dockeditem xtype="button" onclick="fntest" text="测试1" icon="vcard.png" />
		</aos:docked>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem xtype="button" onclick="fntest" text="测试1" icon="ok1.png" scale="medium" />
			<aos:dockeditem xtype="button" onclick="fntest" text="测试" />
			<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
			<aos:dockeditem xtype="tbfill" />
		</aos:docked>
	</aos:panel>
	<script type="text/javascript">
		function fntest() {
			alert('hy');
		}

		function fntest1() {
			alert('mw');
		}
	</script>
</aos:onready>
</aos:html>
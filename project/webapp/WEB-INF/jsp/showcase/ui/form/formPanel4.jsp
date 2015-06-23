<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport margin="10">
		<aos:formpanel width="1024" layout="column" titleCollapse="true" labelWidth="60" collapsible="true" title="个人基本信息"
			center="true">
			<aos:fieldset columnWidth="1" title="银行卡" checkboxToggle="true" layout="column">
				<aos:textfield fieldLabel="姓名1" name="name" columnWidth="0.4" disabled="true" />
				<aos:textfield fieldLabel="姓名2" name="name" columnWidth="0.2" />
			</aos:fieldset>
			<aos:rowset columnWidth="1">
				<aos:textfield fieldLabel="年龄3" name="age" columnWidth="0.5" />
				<aos:displayfield fieldLabel="显示标签" name="" labelWidth="80" columnWidth="0.2" />
				<aos:textfield fieldLabel="年龄4" name="age" columnWidth="0.3" />
			</aos:rowset>
			<aos:textfield fieldLabel="年龄5" name="age" columnWidth="0.25" />
			<aos:fillfield columnWidth="0.6" />
			<aos:textfield fieldLabel="年龄6" name="age" columnWidth="0.6" />
			<aos:textfield fieldLabel="年龄7" name="age" columnWidth="0.4" />
		</aos:formpanel>
	</aos:viewport>
</aos:onready>
</aos:html>
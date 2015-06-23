<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body id="my01" class2="test">
</aos:body>
<aos:onready>
	<aos:formpanel renderTo="my01" width="600" layout="anchor" labelWidth="60" collapsible="true" title="个人基本信息"
		center="true">
		<aos:on event="collapse" fn="fntest" delay="1000" />
		<aos:tool type="search" tooltip="设置" onclick="fntest" />
		<aos:tool type="plus" tooltip="搜索" onclick="fntest" />
		<aos:docked>
			<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
			<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
		</aos:docked>
		<aos:textfield fieldLabel="姓名" name="name" any="labelAlign : 'right'" />
		<aos:textfield fieldLabel="年龄" name="age" anchor="50%" />
		<aos:datefield fieldLabel="出生日期" name="name" />
		<aos:checkboxgroup fieldLabel="选择框" columns="[100,150,100]">
			<aos:checkbox name="c1" boxLabel="阿富汗" />
			<aos:checkbox name="c1" boxLabel="中华人民共和国" />
			<aos:checkbox name="c1" boxLabel="美国" />
		</aos:checkboxgroup>
		<aos:textareafield fieldLabel="大文本" name="name1" grow="true" />
		<aos:radioboxgroup fieldLabel="单选择框" columns="6">
			<aos:radiobox name="c1" boxLabel="阿富汗" />
			<aos:radiobox name="c1" boxLabel="英国" />
			<aos:radiobox name="c1" boxLabel="美国" />
		</aos:radioboxgroup>
		<aos:hiddenfield name="ab001" />
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
			<aos:dockeditem xtype="button" onclick="fntest" text="测试" icon="vcard.png" />
			<aos:dockeditem xtype="tbfill" />
		</aos:docked>
	</aos:formpanel>
	<script type="text/javascript">
		function fntest() {
			alert('ok');
		}
	</script>
</aos:onready>
</aos:html>
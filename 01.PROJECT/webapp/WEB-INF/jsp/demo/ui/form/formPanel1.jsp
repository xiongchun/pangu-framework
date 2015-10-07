<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="基本表单1">
	<aos:include lib="ext" />
	<aos:base href="demo/ui" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:formpanel autoShow="true" width="600" layout="anchor" labelWidth="60" collapsible="true" title="个人基本信息"
			center="true">
			<aos:textfield fieldLabel="姓名" name="name_" anchor="50%" allowBlank="false" />
			<aos:datefield fieldLabel="出生日期" name="birthday_" anchor="50%" />
			<aos:checkboxgroup fieldLabel="性格特点" columns="[120,80,120,150]">
				<aos:checkbox name="c1" boxLabel="活波开朗" />
				<aos:checkbox name="c1" boxLabel="闷骚" checked="true" />
				<aos:checkbox name="c1" boxLabel="抑郁寡欢" />
				<aos:checkbox name="c1" boxLabel="傻逼250一个" checked="true" />
			</aos:checkboxgroup>
			<aos:textfield fieldLabel="籍贯" name="home_" />
			<aos:radioboxgroup fieldLabel="婚姻状态" columns="6">
				<aos:radiobox name="r1" boxLabel="单身狗" />
				<aos:radiobox name="r1" boxLabel="已离" />
				<aos:radiobox name="r1" boxLabel="脑残" checked="true" />
				<aos:radiobox name="r1" boxLabel="热恋中" />
			</aos:radioboxgroup>
			<aos:textareafield fieldLabel="个人描述" name="desc_" grow="true" />
			<aos:hiddenfield name="hidden_field_" />
			<aos:docked dock="bottom">
				<aos:dockeditem xtype="tbtext" iconVec="fa-bullhorn" iconVecSize="14" text="可以写文本信息..." />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="保存数据" icon="ok.png" />
				<aos:dockeditem xtype="button" text="删除" icon="del.png" />
			</aos:docked>
		</aos:formpanel>
	</aos:viewport>
</aos:onready>
</aos:html>
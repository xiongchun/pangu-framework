<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="常用表单元素">
	<aos:include lib="ext" />
	<aos:base href="demo" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:formpanel id="_f_info" autoShow="true" width="650" layout="column" labelWidth="70" title="表单元素"
			icon="icon152.png" msgTarget="qtip" center="true">
			<aos:fieldset title="文本输入" labelWidth="70" columnWidth="1" border="true">
				<aos:textfield name="card_id_" fieldLabel="卡号" maxLength="10" allowBlank="false" columnWidth="0.5" />
				<aos:textfield name="name_" fieldLabel="姓名" maxLength="20" columnWidth="0.49" />
			</aos:fieldset>
			<aos:fieldset title="数字输入" labelWidth="70" columnWidth="1" border="true">
				<aos:numberfield name="credit_line_" fieldLabel="信用额度" minValue="0" maxValue="100000" value="100000"
					allowBlank="false" columnWidth="0.5" />
				<aos:numberfield name="balance_" fieldLabel="可用余额" minValue="0" maxValue="100000" value="50000" columnWidth="0.49" />
			</aos:fieldset>
			<aos:fieldset title="日期时间输入" labelWidth="70" columnWidth="1" border="true">
				<aos:datefield name="birthday_" fieldLabel="出生日期" format="Y年m月d日" value="2015-03-10" editable="true"
					columnWidth="0.5" />
				<aos:datefield name="start_time_" fieldLabel="起始日期" value="2015-03-10" format="Y-m-d 00:00:00" editable="false"
					columnWidth="0.49" />
				<aos:datefield name="end_time_" fieldLabel="截止日期" format="Y-m-d 23:59:59" editable="false" maxValue="${maxValue}"
					minValue="${minValue}" columnWidth="0.5" />
				<aos:datefield name="disable_date_" fieldLabel="审批日期" disabledDays="0,6" disabledDaysText="不能选择周末做为审批日期"
					editable="false" columnWidth="0.49" />
				<aos:timefield name="reg_time_" fieldLabel="签到时间" editable="false" value="09点00分" increment="15" maxValue="18点00分"
					columnWidth="0.5" />
				<aos:datetimefield name="datetime_" fieldLabel="经办时间" editable="false" columnWidth="0.49" />
			</aos:fieldset>
			<aos:fieldset title="单选、复选输入" labelWidth="70" columnWidth="1" border="true">
				<aos:checkboxgroup fieldLabel="性格特点" columns="[120,80,100,120]">
					<aos:checkbox name="c1" boxLabel="活波开朗" />
					<aos:checkbox name="c1" boxLabel="闷骚" checked="true" />
					<aos:checkbox name="c1" boxLabel="抑郁寡欢" />
					<aos:checkbox name="c1" boxLabel="傻逼250一个" checked="true" />
				</aos:checkboxgroup>
				<aos:radioboxgroup fieldLabel="婚姻状态" columns="[120,80,100,100,100]">
					<aos:radiobox name="r1" boxLabel="单身狗" />
					<aos:radiobox name="r1" boxLabel="已离" />
					<aos:radiobox name="r1" boxLabel="脑残" checked="true" />
					<aos:radiobox name="r1" boxLabel="热恋中" />
					<aos:radiobox name="r1" boxLabel="基情中" />
				</aos:radioboxgroup>
			</aos:fieldset>
			<aos:fieldset title="文本块输入" labelWidth="70" columnWidth="1" border="true">
				<aos:textareafield fieldLabel="摘要信息" name="desc_" grow="true" columnWidth="0.99" />
			</aos:fieldset>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="保存数据" icon="ok.png" />
				<aos:dockeditem xtype="button" text="删除" icon="del.png" />
			</aos:docked>
		</aos:formpanel>
	</aos:viewport>
</aos:onready>
</aos:html>
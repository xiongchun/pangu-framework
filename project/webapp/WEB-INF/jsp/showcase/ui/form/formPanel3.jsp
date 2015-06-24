<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body id="my01">
</aos:body>
<aos:onready>
	<aos:formpanel renderTo="my01" width="800" layout="column" margin="5" titleCollapse="true" labelWidth="80"
		collapsible="true" title="银行个人账户信息" center="true">
		<aos:fieldset title="请查询" columnWidth="1" labelWidth="60">
			<aos:textfield fieldLabel="卡号" name="card" columnWidth="0.4" />
			<aos:button text="查询" margin="0 0 0 10" onclick="fntest" />
		</aos:fieldset>
		<aos:fieldset title="持卡人信息" columnWidth="1" labelWidth="60" checkboxToggle="true" collapsed="true">
			<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.25" />
			<aos:textfield fieldLabel="性别" name="name" columnWidth="0.25" />
			<aos:textfield fieldLabel="身份证号" name="name" columnWidth="0.5" labelWidth="80" />
			<aos:textfield fieldLabel="现住址" name="name" columnWidth="0.4" />
			<aos:textfield fieldLabel="户口所在地" name="name" columnWidth="0.6" labelWidth="100" />
		</aos:fieldset>
		<aos:fieldset title="发卡行信息(复杂表单布局)" columnWidth="1">
			<aos:textfield fieldLabel="支行名称" name="bankName" columnWidth="1" />
			<aos:rowset2>
				<aos:displayfield fieldLabel="联系电话" columnWidth="0.1" />
				<aos:displayfield value="(" columnWidth="0.01" />
				<aos:textfield name="phone1" columnWidth="0.1" />
				<aos:displayfield value=")" columnWidth="0.01" />
				<aos:textfield name="phone2" columnWidth="0.2" />
				<aos:displayfield value="-" columnWidth="0.01" />
				<aos:textfield name="phone3" columnWidth="0.2" />
			</aos:rowset2>
			<aos:rowset2>
				<aos:numberfield fieldLabel="上班时间" name="satrt1" value="8" columnWidth="0.2" />
				<aos:displayfield value="点" columnWidth="0.02" />
				<aos:numberfield name="name1" value="30" columnWidth="0.1" />
				<aos:displayfield value="分" columnWidth="0.01" />
			</aos:rowset2>
			<aos:textfield fieldLabel="邮编" name="bankName" columnWidth="0.2" />
			<aos:textfield fieldLabel="地址" name="bankName" columnWidth="0.8" labelWidth="50" />
		</aos:fieldset>
	</aos:formpanel>
	<script type="text/javascript">
		function fntest() {
			alert('忆江南');
		}
	</script>
</aos:onready>
</aos:html>
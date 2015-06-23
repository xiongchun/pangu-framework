<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<div id="_id_photo_div" class="x-hidden" align="center">
	<img src="${cxt}/static/image/demo/gosling.jpg" width="250" height="280">
</div>
<aos:onready>
	<aos:window title="银行个人账户信息" autoShow="true" width="1024" layout="fit" center="true" maximizable="true">
		<aos:formpanel layout="column" labelWidth="80" center="true">
			<aos:fieldset title="请查询" labelWidth="60">
				<aos:textfield fieldLabel="卡号" name="card" columnWidth="0.4" allowBlank="false" />
				<aos:button text="查询" margin="0 0 0 10" onclick="fntest" />
			</aos:fieldset>
			<aos:fieldset title="持卡人基本信息" labelWidth="80" checkboxToggle="true" columnWidth="0.7">
				<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.5" />
				<aos:textfield fieldLabel="性别" name="name" columnWidth="0.5" />
				<aos:textfield fieldLabel="身份证号" name="name" columnWidth="0.5" />
				<aos:textfield fieldLabel="现住址" name="name" columnWidth="0.5" />
				<aos:datefield fieldLabel="出生日期" name="day" columnWidth="0.5" />
				<aos:textfield fieldLabel="户口所在地" name="name" columnWidth="0.5" />
				<aos:textfield fieldLabel="姓名" name="name" columnWidth="1" />
				<aos:textfield fieldLabel="性别" name="name" columnWidth="1" />
				<aos:textfield fieldLabel="身份证号" name="name" columnWidth="1" />
				<aos:textfield fieldLabel="现住址" name="name" columnWidth="1" />
				<aos:textfield fieldLabel="户口所在地" name="name" columnWidth="1" />
			</aos:fieldset>
			<aos:fieldset title="持卡人大头照" labelWidth="60" checkboxToggle="true" columnWidth="0.3" height="260"
				contentEl="_id_photo_div" border="false" />
			<aos:fieldset title="发卡行信息(复杂表单布局)" columnWidth="1">
				<aos:textfield fieldLabel="支行名称" name="bankName" columnWidth="1" />
				<aos:rowset>
					<aos:displayfield fieldLabel="联系电话" columnWidth="0.01" />
					<aos:displayfield value="(" width="10" />
					<aos:textfield fieldLabel="" name="phone1" columnWidth="0.1" />
					<aos:displayfield value=")" width="10" padding="0 0 0 3" />
					<aos:textfield fieldLabel="" name="phone2" columnWidth="0.2" />
					<aos:displayfield value="-" width="10" padding="0 0 0 3" />
					<aos:textfield fieldLabel="" name="phone3" columnWidth="0.2" />
				</aos:rowset>
				<aos:rowset>
					<aos:numberfield fieldLabel="上班时间" name="satrt1" value="8" columnWidth="0.2" />
					<aos:displayfield value="点" width="20" padding="0 0 0 5" />
					<aos:numberfield fieldLabel="" name="name1" value="30" columnWidth="0.1" />
					<aos:displayfield value="分" width="20" padding="0 0 0 5" />
				</aos:rowset>
				<aos:textfield fieldLabel="邮编" name="bankName" columnWidth="0.2" />
				<aos:textfield fieldLabel="地址" name="bankName" columnWidth="0.8" labelWidth="50" />
			</aos:fieldset>
		</aos:formpanel>
	</aos:window>
	<script type="text/javascript">
		function fntest() {
			alert('忆江南');
		}
	</script>
</aos:onready>
</aos:html>
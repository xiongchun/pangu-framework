<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:window title="银行个人账户信息" autoShow="true" width="800" layout="fit" maximizable="true" center="true">
		<aos:formpanel layout="column" labelWidth="80">
			<aos:fieldset title="请查询" labelWidth="60">
				<aos:textfield fieldLabel="卡号" name="card" columnWidth="0.4" />
				<aos:button text="查询" margin="0 0 0 10" onclick="fntest" />
			</aos:fieldset>
			<aos:fieldset title="持卡人信息" labelWidth="60" checkboxToggle="true">
				<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.25" />
				<aos:textfield fieldLabel="性别" name="name" columnWidth="0.25" />
				<aos:textfield fieldLabel="身份证号" name="name" columnWidth="0.5" labelWidth="80" />
				<aos:textfield fieldLabel="现住址" name="name" columnWidth="0.4" />
				<aos:textfield fieldLabel="户口所在地" name="name" columnWidth="0.6" labelWidth="100" />
			</aos:fieldset>
			<aos:fieldset title="直系亲属信息" layout="anchor" labelWidth="85" collapsed="false">
				<aos:textfield fieldLabel="姓名" name="name" />
				<aos:textfield fieldLabel="性别" name="name" />
				<aos:textfield fieldLabel="身份证号" name="name" />
				<aos:textfield fieldLabel="现住址" name="name" />
				<aos:textfield fieldLabel="户口所在地" name="name" />
			</aos:fieldset>
			<aos:fieldset title="发卡行信息(复杂表单布局)" columnWidth="1">
				<aos:textfield fieldLabel="支行名称" name="bankName" columnWidth="1" />
				<aos:rowset>
					<aos:displayfield fieldLabel="联系电话" columnWidth="0.01" />
					<aos:displayfield value="(" width="10" />
					<aos:textfield name="phone1" columnWidth="0.1" />
					<aos:displayfield value=")" width="10" padding="0 0 0 3" />
					<aos:textfield name="phone2" columnWidth="0.2" />
					<aos:displayfield value="-" width="10" padding="0 0 0 3" />
					<aos:textfield name="phone3" columnWidth="0.2" />
				</aos:rowset>
				<aos:rowset>
					<aos:numberfield fieldLabel="上班时间" name="satrt1" value="8" columnWidth="0.2" />
					<aos:displayfield value="点" width="20" padding="0 0 0 5" />
					<aos:numberfield name="name1" value="30" columnWidth="0.1" />
					<aos:displayfield value="分" width="20" padding="0 0 0 5" />
				</aos:rowset>
				<aos:textfield fieldLabel="邮编" name="bankName" columnWidth="0.2" />
				<aos:textfield fieldLabel="地址" name="bankName" columnWidth="0.8" labelWidth="50" />
			</aos:fieldset>
		</aos:formpanel>
	</aos:window>
	<script type="text/javascript">
		function fntest() {
			AOS.tip('执行查询,呵呵！');
		}
	</script>
</aos:onready>
</aos:html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="基本表单3">
	<aos:include lib="ext" />
	<aos:base href="demo/ui" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:formpanel id="_f_info" autoShow="true" width="800" layout="column" labelWidth="70" title="个人账户信息"
			icon="user8.png" msgTarget="side" center="true">
			<aos:fieldset title="请查询" columnWidth="1" labelWidth="50">
				<aos:textfield fieldLabel="卡号" name="card" allowBlank="false" columnWidth="0.4" />
				<aos:button text="查询" margin="0 0 0 10" icon="query.png" />
			</aos:fieldset>
			<aos:fieldset title="持卡人信息" columnWidth="1" labelWidth="50" checkboxToggle="true" collapsed="false">
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
			<aos:docked dock="bottom" ui="footer" >
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="保存数据" icon="ok.png" />
				<aos:dockeditem xtype="button" text="删除" icon="del.png" />
				<aos:dockeditem xtype="tbfill" />
			</aos:docked>
		</aos:formpanel>
	</aos:viewport>
</aos:onready>
</aos:html>
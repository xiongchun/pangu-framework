<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="基本表单4">
	<aos:include lib="ext" />
	<aos:base href="demo" />
</aos:head>
<aos:body backGround="true">
	<div id="_div_photo" class="x-hidden" align="center">
		<img id="_img_photo" class="app_cursor_pointer" src="${cxt}/static/image/empty_head_photo.png" width="200"
			height="200">
	</div>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:window title="个人账户信息" width="850" layout="fit" autoShow="true" modal="false" center="true" maximizable="true"
			closable="false">
			<aos:formpanel id="_f_info" layout="column" autoScroll="true" labelWidth="70">
				<aos:fieldset title="请查询" columnWidth="1" labelWidth="70">
					<aos:textfield fieldLabel="卡号" allowBlank="false" name="card" columnWidth="0.5" />
					<aos:button text="查询" margin="0 0 0 10" icon="query.png" />
				</aos:fieldset>
				<aos:fieldset title="基本信息" labelWidth="70" columnWidth="0.65" margin="0 10 0 0" height="${height}">
					<aos:textfield name="name_" fieldLabel="姓名" maxLength="50" columnWidth="0.99" />
					<aos:combobox name="sex_" fieldLabel="性别" dicField="sex_" emptyText="请选择..." columnWidth="0.99" />
					<aos:textfield name="account_" fieldLabel="登录帐号" readOnly="true" maxLength="50" columnWidth="0.99" />
					<aos:textfield name="biz_code_" fieldLabel="业务对照码" readOnly="true" maxLength="50" columnWidth="0.99" />
					<aos:combobox name="type_" fieldLabel="用户类型" readOnly="true" dicField="user_type_" columnWidth="0.99" />
					<aos:combobox name="status_" fieldLabel="用户状态" readOnly="true" dicField="user_status_" columnWidth="0.99" />
					<aos:textfield name="org_name_" fieldLabel="所属组织" readOnly="true" columnWidth="0.99" />
				</aos:fieldset>
				<aos:fieldset title="用户头像" labelWidth="70" columnWidth="0.35" contentEl="_div_photo" height="${height}" />
				<aos:fieldset title="辅助信息" labelWidth="70" columnWidth="1" border="true">
					<aos:textfield name="idno_" fieldLabel="身份证号" maxLength="50" columnWidth="0.5" />
					<aos:datefield name="birthday_" fieldLabel="生日" format="Y-m-d" editable="false" columnWidth="0.49" />
					<aos:textfield name="fixed_phone_" fieldLabel="固定电话" maxLength="50" columnWidth="0.5" />
					<aos:textfield name="mobile_phone_" fieldLabel="移动电话" maxLength="50" columnWidth="0.49" />
					<aos:textfield name="email_" fieldLabel="电子邮件" vtype="email" columnWidth="0.5" />
					<aos:textfield name="qq_" fieldLabel="QQ" maxLength="50" columnWidth="0.49" />
					<aos:textfield name="zip_" fieldLabel="邮编" maxLength="20" columnWidth="0.5" />
					<aos:textfield name="address_" fieldLabel="联系地址" maxLength="200" columnWidth="0.49" />
					<aos:textareafield name="remark_" fieldLabel="备注" maxLength="4000" columnWidth="0.99" />
				</aos:fieldset>
				<aos:fieldset title="扩展信息" labelWidth="70" border="true">
					<aos:textfield name="filed1_" fieldLabel="扩展属性1" readOnly="true" maxLength="200" columnWidth="0.5" />
					<aos:textfield name="filed2_" fieldLabel="扩展属性2" readOnly="true" maxLength="200" columnWidth="0.49" />
					<aos:textfield name="dynamic_field_" fieldLabel="动态属性" readOnly="true" maxLength="4000" columnWidth="0.99" />
				</aos:fieldset>
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="保存数据" icon="ok.png" />
			</aos:docked>
		</aos:window>
	</aos:viewport>
</aos:onready>
</aos:html>
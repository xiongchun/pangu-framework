<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="我的个人资料">
	<aos:include lib="ext" />
	<aos:base href="system/preference" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:panel layout="column" autoScroll="true" border="false">
			<aos:formpanel id="_f_user" onrender="_f_user_onrender" layout="column" labelWidth="70" columnWidth="1">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem xtype="tbtext" text="设置个人选项" />
				</aos:docked>
				<aos:hiddenfield fieldLabel="用户流水号" name="id_" />
				<aos:textfield name="account_" fieldLabel="登录帐号" readOnly="true" maxLength="50" columnWidth="0.33" />
				<aos:textfield name="org_name_" fieldLabel="所属组织" readOnly="true" columnWidth="0.33" />
				<aos:textfield name="name_" fieldLabel="姓名" allowBlank="false" maxLength="50" columnWidth="0.33" />
				<aos:combobox name="sex_" fieldLabel="性别" dicField="sex_" emptyText="请选择..." columnWidth="0.33" />
				<aos:textfield name="idno_" fieldLabel="身份证号" maxLength="50" columnWidth="0.33" />
				<aos:datefield name="birthday_" fieldLabel="生日" format="Y-m-d" editable="false" columnWidth="0.33" />
				<aos:textfield name="fixed_phone_" fieldLabel="固定电话" maxLength="50" columnWidth="0.33" />
				<aos:textfield name="mobile_phone_" fieldLabel="移动电话" maxLength="50" columnWidth="0.33" />
				<aos:textfield name="email_" fieldLabel="电子邮件" vtype="email" columnWidth="0.33" />
				<aos:textfield name="qq_" fieldLabel="QQ" maxLength="50" columnWidth="0.33" />
				<aos:textfield name="zip_" fieldLabel="邮编" maxLength="20" columnWidth="0.33" />
				<aos:textfield name="address_" fieldLabel="联系地址" maxLength="200" columnWidth="0.33" />
				<aos:combobox name="theme_" fieldLabel="系统主题" dicField="theme_" columnWidth="0.33" />
				<aos:combobox name="skin_" fieldLabel="界面皮肤" dicField="skin_" columnWidth="0.33" />
				<aos:combobox name="is_show_top_nav_" fieldLabel="顶部导航" dicField="is_show_top_nav_" columnWidth="0.33" />
				<aos:combobox name="nav_tab_index_" fieldLabel="缺省导航页" dicField="nav_tab_index_" columnWidth="0.33" />
				<aos:textareafield name="remark_" fieldLabel="备注" maxLength="4000" height="60" columnWidth="0.99" />
				<aos:docked dock="bottom" ui="footer">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem text="保存" onclick="_f_user_save" icon="ok1.png" />
					<aos:dockeditem text="重置" onclick="_f_reset" icon="refresh.png" />
					<aos:dockeditem xtype="tbfill" />
				</aos:docked>
			</aos:formpanel>
			<aos:formpanel id="_f_pwd" onrender="_f_user_onrender" layout="column" padding="20 0 0 0" labelWidth="80"
				columnWidth="1">
				<aos:docked forceBoder="1 0 1 0">
					<aos:dockeditem xtype="tbtext" text="修改密码" />
				</aos:docked>
				<aos:hiddenfield fieldLabel="用户流水号" name="id_" />
				<aos:textfield name="password_" fieldLabel="原密码" inputType="password" allowBlank="false" maxLength="20"
					columnWidth="0.99" />
				<aos:textfield name="new_password_" fieldLabel="新密码" inputType="password" allowBlank="false" maxLength="20"
					columnWidth="0.99" />
				<aos:textfield name="confirm_new_password_" fieldLabel="确认新密码" inputType="password" allowBlank="false"
					maxLength="20" columnWidth="0.99" />
				<aos:docked dock="bottom" ui="footer">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem text="保存" onclick="_f_pwd_save" icon="ok1.png" />
					<aos:dockeditem text="重置" onclick="_f_reset" icon="refresh.png" />
					<aos:dockeditem xtype="tbfill" />
				</aos:docked>
			</aos:formpanel>
		</aos:panel>
	</aos:viewport>
	<script type="text/javascript">
		//监听用户基本信息
		function _f_user_onrender() {
			AOS.ajax({
				url : 'getUser.jhtml',
				ok : function(data) {
					_f_user.form.setValues(data);
					_f_pwd.form.setValues(data);
				}
			});
		}

		//保存我的个人用户信息
		function _f_user_save() {
			AOS.ajax({
				forms : _f_user,
				url : 'updateMyInfo.jhtml',
				ok : function(data) {
					AOS.tip(data.appmsg);
				}
			});
		}

		//重置表单
		function _f_reset() {
			AOS.reset(_f_pwd);
			_f_user_onrender();
		}

		//保存密码修改
		function _f_pwd_save() {
			AOS.ajax({
				forms : _f_pwd,
				url : 'updateMyPwd.jhtml',
				ok : function(data) {
					if (data.appcode === -1) {
						AOS.err(data.appmsg);
					} else {
						AOS.tip(data.appmsg);
					}
				}
			});
		}
	</script>
</aos:onready>
</aos:html>
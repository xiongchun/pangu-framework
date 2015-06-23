<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head title="系统安全选项">
	<aos:include lib="ext" />
	<aos:base href="system/preference/" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:panel id="_p_cfg" region="center" layout="anchor" width="500" border="false" header="false">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="系统安全选项" />
			</aos:docked>
			<aos:formpanel id="_f_pwd" onrender="_f_pwd_onrender" border="true" layout="column" anchor="100%">
				<aos:fieldset title="修改密码" labelWidth="80" border="true">
					<aos:hiddenfield fieldLabel="用户流水号" name="id_" />
					<aos:textfield name="name_" fieldLabel="姓名" readOnly="true" maxLength="50" columnWidth="0.99" />
					<aos:textfield name="account_" fieldLabel="登录帐号" readOnly="true" maxLength="50" columnWidth="0.99" />
					<aos:textfield name="password_" fieldLabel="密码" inputType="password" allowBlank="false" maxLength="50"
						columnWidth="0.99" />
					<aos:textfield name="new_password_" fieldLabel="新密码" inputType="password" allowBlank="false" maxLength="50"
						columnWidth="0.99" />
					<aos:textfield name="confirm_new_password_" fieldLabel="确认新密码" inputType="password" allowBlank="false"
						maxLength="50" columnWidth="0.99" />
				</aos:fieldset>
				<aos:docked dock="bottom">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem text="保存" onclick="_f_pwd_save" icon="ok.png" />
					<aos:dockeditem text="重置" onclick="_f_pwd_onrender" icon="refresh.png" />
				</aos:docked>
			</aos:formpanel>
			<aos:formpanel id="_f_dog" layout="column" labelWidth="80" bodyBorder="0 1 1 1" anchor="100%" >
				<aos:fieldset title="加密狗设置[功能预留]" labelWidth="80" border="true">
					<aos:hiddenfield fieldLabel="用户流水号" name="id_" />
				</aos:fieldset>
				<aos:docked dock="bottom">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem text="保存" icon="ok.png" disabled="true" />
				</aos:docked>
			</aos:formpanel>
		</aos:panel>
	</aos:viewport>
	<script type="text/javascript">
		_p_cfg.center();
		//响应窗口变化事件
		Ext.EventManager
				.onWindowResize(function() {
					var left = (Ext.getBody().getViewSize().width - _p_cfg
							.getWidth()) / 2;
					var top = (Ext.getBody().getViewSize().height - _p_cfg
							.getHeight()) / 2;
					_p_cfg.setPosition(left, top, true)
				});

		//监听密码表单onshow事件
		function _f_pwd_onrender() {
			App.ajax({
				url : 'getUser.jhtml',
				ok : function(data) {
					App.reset(_f_pwd);
					_f_pwd.form.setValues(data);
				}
			});
		}

		//保存密码修改
		function _f_pwd_save() {
			App.ajax({
				forms : _f_pwd,
				url : 'updateMyPwd.jhtml',
				ok : function(data) {
					if(data.appcode === -1){
						App.err(data.appmsg);
					}else{
						App.tip(data.appmsg);
					}
				}
			});
		}
	</script>
</aos:onready>
</aos:html>
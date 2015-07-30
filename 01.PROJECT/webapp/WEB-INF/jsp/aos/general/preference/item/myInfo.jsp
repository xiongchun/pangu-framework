<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="我的个人资料">
	<aos:include lib="ext" />
	<aos:base href="system/preference" />
</aos:head>
<aos:body backGround="true">
	<div id="_div_photo" class="x-hidden" align="center">
		<a onclick="Ext.getCmp('_w_upload').show();"> <img id="_img_photo" class="app_cursor_pointer"
			src="${cxt}/static/image/empty_head_photo.png" width="200" height="200">
		</a>
	</div>
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:formpanel id="_f_user" onrender="_f_user_onrender" width="700" layout="column" labelWidth="70">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="我的个人资料" />
			</aos:docked>
			<aos:hiddenfield fieldLabel="用户流水号" name="id_" />
			<aos:hiddenfield name="bytearray_id_" />
			<aos:fieldset title="基本信息" labelWidth="70" columnWidth="0.65" margin="0 10 0 0" height="${height}">
				<aos:textfield name="name_" fieldLabel="姓名" allowBlank="false" maxLength="50" columnWidth="0.99" />
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
			<aos:docked dock="bottom">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="保存" onclick="_f_user_save" icon="ok.png" id="_btn_save_demo" />
			</aos:docked>
		</aos:formpanel>
		<aos:window id="_w_upload" title="上传用户头像" onshow="_w_upload_onshow">
			<aos:formpanel id="_f_upload" width="450" layout="anchor" labelWidth="65">
				<aos:filefield name="myfile_" fieldLabel="用户头像" buttonText="浏览" allowBlank="false" emptyText="请选择用户头像文件..."
					margin="10 0 10 0" />
				<aos:displayfield value="提示：文件不能大于${max_size}KB。" padding="0 0 0 68" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="_f_upload_submit" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="_fn_del_user_photo" text="删除" icon="del2.png" />
				<aos:dockeditem onclick="#_w_upload.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
	</aos:viewport>
	<script type="text/javascript">
		_f_user.center();
		//响应窗口变化事件
		Ext.EventManager.onWindowResize(function() {
			var left = (Ext.getBody().getViewSize().width - _f_user
					.getWidth()) / 2;
			var top = (Ext.getBody().getViewSize().height - _f_user
					.getHeight()) / 2;
			_f_user.setPosition(left, top, true)
		});
		
        //监听用户表单onshow事件
        function _f_user_onrender() {
            AOS.ajax({
                url: 'getUser.jhtml',
                ok: function (data) {
                    _f_user.form.setValues(data);
                    if(data.has_head_photo) {
                    	Ext.get('_img_photo').dom.src = '${cxt}/system/byteObj/viewByteObj.jhtml?id_=' + data.bytearray_id_;
                    }else {
                    	Ext.get('_img_photo').dom.src = '${cxt}/static/image/empty_head_photo.png';
                    }
                }
            });
        }
        
        //保存我的个人用户信息
        function _f_user_save() {
            AOS.ajax({
                forms: _f_user,
                url: 'updateMyInfo.jhtml',
                ok: function (data) {
                    AOS.tip(data.appmsg);
                }
            });
        }
        
        //上传头像文件(注：文件上传操作不能使用AOS.Ajax()方法，只能使用Form自带的submit()函数)。
        function _f_upload_submit() {
            var form = _f_upload.getForm();
            if (!form.isValid()) {
                return;
            }
            AOS.wait();
            form.submit({
                timeout: 60000, // 60s
                url: 'saveUserPhoto.jhtml',
                success: function (form, action) {
                    if (action.result.appcode !== -1) {
                        //成功
                        _w_upload.hide();
                        Ext.get('_img_photo').dom.src = '${cxt}/system/byteObj/viewByteObj.jhtml?id_=' + action.result.bytearray_id_ + '&number=' + Math.random();
                    }
                    AOS.hide();
                    AOS.tip(action.result.appmsg);
                }
            });
        }

        //监听上传用户窗口弹出事件
        function _w_upload_onshow(){
            AOS.reset(_f_upload);
        }
        
        //删除用户头像
        function _fn_del_user_photo(){
        	AOS.reset(_f_upload);
            AOS.confirm('提示：确认删除当前用户头像吗？', function (btn) {
                if (btn === 'cancel') {
                    AOS.tip('用户操作被取消。');
                } else {
                	AOS.ajax({
                        forms: _f_user,
                        url: '${cxt}/system/user/delUserPhoto.jhtml',
                        ok: function (data) {
                        	_w_upload.hide();
                        	Ext.get('_img_photo').dom.src = '${cxt}/static/image/empty_head_photo.png';
                            AOS.tip(data.appmsg);
                        }
                    });
                }
            });
        }
	</script>
</aos:onready>
</aos:html>
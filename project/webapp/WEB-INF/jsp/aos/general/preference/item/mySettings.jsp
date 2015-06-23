<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head title="我的偏好设置">
	<aos:include lib="ext" />
	<aos:base href="system/preference/" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:formpanel id="_f_settings" onrender="_f_settings_onrender" width="800" layout="column" labelWidth="80">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="我的偏好设置" />
			</aos:docked>
			<aos:hiddenfield fieldLabel="用户流水号" name="id_" />
			<aos:fieldset title="界面设置" labelWidth="70" border="true">
				<aos:combobox name="theme_" fieldLabel="系统主题" dicField="theme_" columnWidth="0.33" />
				<aos:combobox name="skin_" fieldLabel="界面皮肤" dicField="skin_" columnWidth="0.33" />
				<aos:combobox name="layout_" fieldLabel="主布局" dicField="layout_" columnWidth="0.33" />
				<aos:combobox name="nav_mode_" fieldLabel="导航模式" dicField="nav_mode_" columnWidth="0.33" />
				<aos:combobox name="is_show_top_nav_" fieldLabel="顶部导航" dicField="is_show_top_nav_" columnWidth="0.33" />
				<aos:combobox name="navbar_btn_style_" fieldLabel="导航条风格" dicField="navbar_btn_style_" columnWidth="0.33" />
				<aos:textfield name="tab_focus_color_" fieldLabel="Tab高亮色" allowBlank="false" star="false" columnWidth="0.33" />
				<aos:combobox name="is_show_mac_nav_" fieldLabel="浮动导航" dicField="is_show_mac_nav_" columnWidth="0.33" />
				<aos:combobox name="nav_quick_layout_" fieldLabel="快捷菜单布局" dicField="nav_quick_layout_" labelWidth="100"
					columnWidth="0.33" />
				<aos:combobox name="nav_tab_index_" fieldLabel="导航缺省活动页" dicField="nav_tab_index_" labelWidth="100"
					columnWidth="0.33" />
			</aos:fieldset>
			<aos:fieldset title="系统设置" labelWidth="80" border="true">
			</aos:fieldset>
			<aos:docked dock="bottom">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="保存" onclick="_f_settings_save" icon="ok.png" />
				<aos:dockeditem text="重置" onclick="_f_settings_onrender" icon="refresh.png" />
			</aos:docked>
		</aos:formpanel>
	</aos:viewport>
	<script type="text/javascript">
		_f_settings.center();
		//响应窗口变化事件
		Ext.EventManager.onWindowResize(function() {
			var left = (Ext.getBody().getViewSize().width - _f_settings
					.getWidth()) / 2;
			var top = (Ext.getBody().getViewSize().height - _f_settings
					.getHeight()) / 2;
			_f_settings.setPosition(left, top, true)
		});

		//监听表单onshow事件
		function _f_settings_onrender() {
			App.ajax({
				url : 'getUser.jhtml',
				ok : function(data) {
					_f_settings.form.setValues(data);
				}
			});
		}

		//保存我的偏好设置
		function _f_settings_save() {
			App.ajax({
				forms : _f_settings,
				url : 'updateMySettings.jhtml',
				ok : function(data) {
					App.tip(data.appmsg);
				}
			});
		}
	</script>
</aos:onready>
</aos:html>
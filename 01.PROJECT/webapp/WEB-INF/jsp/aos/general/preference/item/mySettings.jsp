<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="我的偏好设置">
	<aos:include lib="ext" />
	<aos:base href="system/preference" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:formpanel id="_f_settings" onrender="_f_settings_onrender" width="800" layout="column" center="true" labelWidth="80">
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
			<aos:fieldset title="其它设置" labelWidth="80" border="true" collapsed="true">
			</aos:fieldset>
			<aos:docked dock="bottom">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="保存" onclick="_f_settings_save" icon="ok.png" />
			</aos:docked>
		</aos:formpanel>
	</aos:viewport>
	<script type="text/javascript">

		//监听表单onshow事件
		function _f_settings_onrender() {
			AOS.ajax({
				url : 'getUser.jhtml',
				ok : function(data) {
					_f_settings.form.setValues(data);
				}
			});
		}

		//保存我的偏好设置
		function _f_settings_save() {
			AOS.ajax({
				forms : _f_settings,
				url : 'updateMySettings.jhtml',
				ok : function(data) {
					AOS.tip(data.appmsg);
				}
			});
		}
	</script>
</aos:onready>
</aos:html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="用户与授权">
	<aos:include lib="ext" />
	<aos:base href="system/user" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_org" region="west" bodyBorder="0 1 0 0" width="260" singleClick="false"
			onitemclick="_g_user_query" url="${cxt}/system/listOrgTree.jhtml" nodeParam="parent_id_" rootId="${dept_.id_}"
			rootText="${dept_.name_}" rootVisible="true" rootIcon="${dept_.icon_name_}">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="组织架构树" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="级联显示人员" id="_cascade" name="cascade" onchang="_g_user_query" checked="true" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增用户" onclick="_w_user_show" icon="add.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新树" onclick="_t_org_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_user" region="center" onrender="_g_user_query" bodyBorder="1 0 1 0" url="listUsers.jhtml"
			onitemdblclick="_w_user_u_show">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="授权" tooltip="授权" icon="config1.png">
					<aos:menu>
						<aos:menuitem text="用户菜单授权" onclick="_w_user_module_show" icon="icon75.png" />
						<aos:menuitem text="用户岗位授权" onclick="_w_user_post_show" icon="icon137.png" />
						<aos:menuitem text="用户角色授权" onclick="_w_user_role_show" icon="icon134.png" />
						<aos:menuitem text="用户页面元素授权" onclick="_w_user_cmp_show" icon="page_paint.png" />
						<aos:menuitem xtype="menuseparator" />
						<aos:menuitem text="权限预览" onclick="_w_preview_show" icon="query.png" />
					</aos:menu>
				</aos:dockeditem>
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="新增" tooltip="新增用户" onclick="_w_user_show" icon="add.png" />
				<aos:dockeditem text="修改" tooltip="修改用户" onclick="_w_user_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" tooltip="删除用户" onclick="_g_user_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="姓名或登录帐号" name="hotkey" id="_hotkey" onenterkey="_g_user_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_user_query" width="180" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="重置密码" tooltip="重置选中用户密码" onclick="_w_pwd_show" icon="key.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="更多操作" tooltip="更多业务操作" icon="icon140.png">
					<aos:menu>
						<aos:menuitem text="用户封锁" onclick="_fn_updateStatus(3)" icon="lock.png" />
						<aos:menuitem text="用户停用" onclick="_fn_updateStatus(2)" icon="stop.gif" />
						<aos:menuitem text="用户解封/启用" onclick="_fn_updateStatus(1)" icon="go.gif" />
						<aos:menuitem xtype="menuseparator" />
						<aos:menuitem text="批量修改所属组织" onclick="_w_userorg_show" icon="edit.png" />
					</aos:menu>
				</aos:dockeditem>
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="权限预览" onclick="_w_preview_show" icon="query.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="新增用户" onclick="_w_user_show" icon="add.png" />
				<aos:menuitem text="修改用户" onclick="_w_user_u_show" icon="edit.png" />
				<aos:menuitem text="删除用户" onclick="_g_user_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="用户菜单授权" onclick="_w_user_module_show" icon="icon75.png" />
				<aos:menuitem text="用户岗位授权" onclick="_w_user_post_show" icon="icon137.png" />
				<aos:menuitem text="用户角色授权" onclick="_w_user_role_show" icon="icon134.png" />
				<aos:menuitem text="用户页面元素授权" onclick="_w_user_cmp_show" icon="page_paint.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="重置密码" onclick="_w_pwd_show" icon="key.png" />
				<aos:menuitem text="用户封锁" onclick="_fn_updateStatus(3)" icon="lock.png" />
				<aos:menuitem text="用户停用" onclick="_fn_updateStatus(2)" icon="stop.gif" />
				<aos:menuitem text="用户解封/启用" onclick="_fn_updateStatus(1)" icon="go.gif" />
				<aos:menuitem text="批量修改所属组织" onclick="_w_userorg_show" icon="edit.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_user_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="用户流水号" dataIndex="id_" hidden="true" />
			<aos:column header="所属组织流水号" dataIndex="org_id_" hidden="true" />
			<aos:column header="登录帐号" dataIndex="account_" width="150" />
			<aos:column header="姓名" dataIndex="name_" />
			<aos:column header="性别" dataIndex="sex_" width="60" rendererField="sex_" />
			<aos:column header="所属组织" dataIndex="org_name_" width="150" />
			<aos:column header="用户状态" dataIndex="status_" rendererField="user_status_" />
			<aos:column header="用户类型" dataIndex="type_" rendererField="user_type_" />
			<aos:column header="业务对照码" dataIndex="biz_code_" />
			<aos:column header="创建人" dataIndex="creater_name_" />
		</aos:gridpanel>
	</aos:viewport>

	<aos:window id="_w_org_find" title="所属组织[双击选择]" height="-10" layout="fit" autoScroll="true" onshow="_w_org_find_onshow">
		<aos:treepanel id="_t_org_find" singleClick="false" width="320" bodyBorder="0 0 0 0"
			url="${cxt}/system/listOrgTree.jhtml" nodeParam="parent_id_" rootId="${dept_.id_}" rootText="${dept_.name_}"
			rootVisible="true" rootIcon="${dept_.icon_name_}" rootExpanded="false" onitemdblclick="_t_org_find_select">
			<aos:menu>
				<aos:menuitem text="选择" icon="ok1.png" onclick="_t_org_find_select" />
				<aos:menuitem text="刷新" onclick="_t_org_find_refresh" icon="refresh1.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="关闭" onclick="#_w_org_find.hide();" icon="del.png" />
			</aos:menu>
		</aos:treepanel>
	</aos:window>
	<aos:window id="_w_user" title="新增用户" maxHeight="-10" width="720" autoScroll="true">
		<aos:formpanel id="_f_user" width="700" layout="column">
			<aos:hiddenfield name="org_id_" value="${dept_.id_}" />
			<aos:fieldset title="基本信息" labelWidth="75">
				<aos:triggerfield fieldLabel="所属组织" name="org_name_" value="${dept_.name_}" allowBlank="false" editable="false"
					onfocus="_w_org_find_show" trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_org_find_show" columnWidth="0.5" />
				<aos:textfield name="name_" fieldLabel="姓名" allowBlank="false" maxLength="50" columnWidth="0.49" />
				<aos:textfield name="account_" fieldLabel="登录帐号" allowBlank="false" maxLength="50" columnWidth="0.5" />
				<aos:textfield name="password_" fieldLabel="初始密码" allowBlank="false" inputType="password" maxLength="20"
					columnWidth="0.49" />
				<aos:combobox name="sex_" fieldLabel="性别" dicField="sex_" emptyText="请选择..." value="3" columnWidth="0.5" />
				<aos:textfield name="biz_code_" fieldLabel="业务对照码" maxLength="50" columnWidth="0.49" />
			</aos:fieldset>
			<aos:fieldset title="辅助信息" labelWidth="70" border="true">
				<aos:textfield name="idno_" fieldLabel="身份证号" maxLength="50" columnWidth="0.5" />
				<aos:datefield name="birthday_" fieldLabel="生日" format="Y-m-d" editable="false" columnWidth="0.49" />
				<aos:textfield name="fixed_phone_" fieldLabel="固定电话" maxLength="50" columnWidth="0.5" />
				<aos:textfield name="mobile_phone_" fieldLabel="移动电话" maxLength="50" columnWidth="0.49" />
				<aos:textfield name="email_" fieldLabel="电子邮件" vtype="email" columnWidth="0.5" />
				<aos:textfield name="qq_" fieldLabel="QQ" maxLength="50" columnWidth="0.49" />
				<aos:textfield name="zip_" fieldLabel="邮编" maxLength="20" columnWidth="0.5" />
				<aos:textfield name="address_" fieldLabel="联系地址" maxLength="200" columnWidth="0.49" />
				<aos:textfield name="remark_" fieldLabel="备注" maxLength="4000" columnWidth="0.99" />
			</aos:fieldset>
			<aos:fieldset title="配置信息" labelWidth="80" border="true">
				<aos:combobox name="theme_" fieldLabel="系统主题" value="${user_cfg_.theme_}" dicField="theme_" columnWidth="0.33" />
				<aos:combobox name="skin_" fieldLabel="界面皮肤" value="${user_cfg_.skin_}" dicField="skin_" columnWidth="0.33" />
				<aos:combobox name="is_show_top_nav_" fieldLabel="顶部导航" value="${user_cfg_.is_show_top_nav_}"
					dicField="is_show_top_nav_" columnWidth="0.33" />
				<aos:combobox name="navbar_btn_style_" fieldLabel="导航条风格" value="${user_cfg_.navbar_btn_style_}"
					dicField="navbar_btn_style_" columnWidth="0.33" />
				<aos:textfield name="tab_focus_color_" fieldLabel="Tab高亮色" allowBlank="false" star="false"
					value="${user_cfg_.tab_focus_color_}" columnWidth="0.33" />
				<aos:combobox name="nav_tab_index_" fieldLabel="导航缺省活动页" dicField="nav_tab_index_" labelWidth="100"
					value="${user_cfg_.nav_tab_index_}" columnWidth="0.33" />
			</aos:fieldset>
			<aos:fieldset title="扩展信息" labelWidth="70" border="true">
				<aos:textfield name="filed1_" fieldLabel="扩展属性1" maxLength="200" columnWidth="0.5" />
				<aos:textfield name="filed2_" fieldLabel="扩展属性2" maxLength="200" columnWidth="0.49" />
				<aos:textfield name="dynamic_field_" fieldLabel="动态属性" maxLength="4000" columnWidth="0.99" />
			</aos:fieldset>
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_user_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_user.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_user_u" title="修改用户" onshow="_w_user_u_onshow" width="720" maxHeight="-10" autoScroll="true">
		<aos:formpanel id="_f_user_u" width="700" layout="column" labelWidth="70">
			<aos:hiddenfield fieldLabel="用户流水号" name="id_" />
			<aos:hiddenfield name="old_org_id_" />
			<aos:hiddenfield name="org_id_" />
			<aos:fieldset title="基本信息" labelWidth="70" columnWidth="1" margin="0 10 0 0" >
				<aos:triggerfield fieldLabel="所属组织" name="org_name_" allowBlank="false" editable="false" onfocus="_w_org_find_show"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_org_find_show" columnWidth="0.5" />
				<aos:textfield name="name_" fieldLabel="姓名" allowBlank="false" maxLength="50" columnWidth="0.49" />
				<aos:textfield name="account_" fieldLabel="登录帐号" allowBlank="false" maxLength="50" columnWidth="0.5" />
				<aos:combobox name="sex_" fieldLabel="性别" dicField="sex_" emptyText="请选择..." columnWidth="0.49" />
				<aos:textfield name="biz_code_" fieldLabel="业务对照码" maxLength="50" columnWidth="0.5" />
				<aos:combobox name="status_" fieldLabel="用户状态" readOnly="true" dicField="user_status_" columnWidth="0.49" />
			</aos:fieldset>
			<aos:fieldset title="辅助信息" labelWidth="70" columnWidth="1" border="true">
				<aos:textfield name="idno_" fieldLabel="身份证号" maxLength="50" columnWidth="0.5" />
				<aos:datefield name="birthday_" fieldLabel="生日" format="Y-m-d" editable="false" columnWidth="0.49" />
				<aos:textfield name="fixed_phone_" fieldLabel="固定电话" maxLength="50" columnWidth="0.5" />
				<aos:textfield name="mobile_phone_" fieldLabel="移动电话" maxLength="50" columnWidth="0.49" />
				<aos:textfield name="email_" fieldLabel="电子邮件" vtype="email" columnWidth="0.5" />
				<aos:textfield name="qq_" fieldLabel="QQ" maxLength="50" columnWidth="0.49" />
				<aos:textfield name="zip_" fieldLabel="邮编" maxLength="20" columnWidth="0.5" />
				<aos:textfield name="address_" fieldLabel="联系地址" maxLength="200" columnWidth="0.49" />
				<aos:textfield name="remark_" fieldLabel="备注" maxLength="4000" columnWidth="0.99" />
			</aos:fieldset>
			<aos:fieldset title="配置信息" labelWidth="80" border="true">
				<aos:combobox name="theme_" fieldLabel="系统主题" dicField="theme_" columnWidth="0.33" />
				<aos:combobox name="skin_" fieldLabel="界面皮肤" dicField="skin_" columnWidth="0.33" />
				<aos:combobox name="nav_mode_" fieldLabel="导航模式" dicField="nav_mode_" columnWidth="0.33" />
				<aos:combobox name="is_show_top_nav_" fieldLabel="顶部导航" dicField="is_show_top_nav_" columnWidth="0.33" />
				<aos:combobox name="navbar_btn_style_" fieldLabel="导航条风格" dicField="navbar_btn_style_" columnWidth="0.33" />
				<aos:textfield name="tab_focus_color_" fieldLabel="Tab高亮色" allowBlank="false" star="false" columnWidth="0.33" />
				<aos:combobox name="nav_tab_index_" fieldLabel="导航缺省活动页" dicField="nav_tab_index_" labelWidth="100"
					columnWidth="0.33" />
			</aos:fieldset>
			<aos:fieldset title="扩展信息" labelWidth="70" border="true">
				<aos:textfield name="filed1_" fieldLabel="扩展属性1" maxLength="200" columnWidth="0.5" />
				<aos:textfield name="filed2_" fieldLabel="扩展属性2" maxLength="200" columnWidth="0.49" />
				<aos:textfield name="dynamic_field_" fieldLabel="动态属性" maxLength="4000" columnWidth="0.99" />
			</aos:fieldset>
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_user_u_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_user_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_pwd" title="重置密码">
		<aos:formpanel id="_f_pwd" width="350" layout="anchor" labelWidth="75">
			<aos:hiddenfield name="aos_rows_" fieldLabel="已选中的用户ID集合" />
			<aos:textfield name="password_" fieldLabel="新密码" allowBlank="false" inputType="password" maxLength="20" />
			<aos:textfield name="password_b" fieldLabel="确认新密码" allowBlank="false" inputType="password" maxLength="20" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_pwd_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_pwd.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_userorg" title="批量修改用户所属组织">
		<aos:formpanel id="_f_userorg" width="400" layout="anchor" labelWidth="70">
			<aos:hiddenfield name="aos_rows_" fieldLabel="已选中的用户ID集合" />
			<aos:hiddenfield name="org_id_" />
			<aos:triggerfield fieldLabel="所属组织" name="org_name_" allowBlank="false" editable="false" onfocus="_w_org_find_show"
				trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_org_find_show" />
			<aos:displayfield margin="0 0 0 10" value="(提示：修改用户所属组织将清除当前用户和岗位的授权关系。)" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_userorg_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_userorg.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_user_module" title="用户菜单授权" width="620" height="-10" layout="fit" onshow="_w_user_module_onshow">
		<aos:tabpanel id="_tabs" plain="false">
			<aos:tab title="经办权限" border="false" layout="border" onactivate="_tabs_onactivate1">
				<aos:treepanel id="_t_module" bodyBorder="0 1 0 0" url="getModuleTree4Select.jhtml" singleClick="false"
					cascade="true" rootId="p" rootExpanded="false" rootText="请授权[经办权限]" region="center">
					<aos:menu>
						<aos:menuitem text="刷新/收起" onclick="_t_module_load" icon="refresh.png" />
					</aos:menu>
				</aos:treepanel>
				<aos:treepanel id="_t_module_1" bodyBorder="0 0 0 0" url="getModuleTree4Selected.jhtml" singleClick="false"
					rootId="p" rootExpanded="false" rootText="已授权限[经办权限]" width="300" region="east">
					<aos:menu>
						<aos:menuitem text="刷新" onclick="_t_module_1_load" icon="refresh.png" />
					</aos:menu>
				</aos:treepanel>
			</aos:tab>
			<aos:tab title="管理权限" border="false" autoScroll="true" layout="border" onactivate="_tabs_onactivate2">
				<aos:treepanel id="_t_module_2" bodyBorder="0 1 0 0" url="getModuleTree4Select.jhtml" singleClick="false"
					cascade="true" rootId="p" rootExpanded="false" rootText="请授权[管理权限]" region="center">
					<aos:menu>
						<aos:menuitem text="刷新" onclick="_t_module_2_load" icon="refresh.png" />
					</aos:menu>
				</aos:treepanel>
				<aos:treepanel id="_t_module_3" bodyBorder="0 0 0 0" url="getModuleTree4Selected.jhtml" singleClick="false"
					rootId="p" rootExpanded="false" rootText="已授权限[管理权限]" width="300" region="east">
					<aos:menu>
						<aos:menuitem text="刷新" onclick="_t_module_3_load" icon="refresh.png" />
					</aos:menu>
				</aos:treepanel>
			</aos:tab>
		</aos:tabpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_user_module_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_user_module.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_user_post" title="用户岗位授权" width="960" height="-10" layout="border" onshow="_w_user_post_onshow">
		<aos:treepanel id="_t_org_post" region="west" bodyBorder="0 1 0 0" width="230" singleClick="false"
			onitemclick="_g_post_query" url="${cxt}/system/listOrgTree.jhtml" nodeParam="parent_id_" rootId="${dept_.id_}"
			rootText="${dept_.name_}" rootVisible="true" rootIcon="${dept_.icon_name_}" rootExpanded="false">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="组织架构树" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="级联显示岗位" id="_cascade_post" name="cascade" onchang="_g_post_query" checked="true" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="_t_org_post_load" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_post" region="center" bodyBorder="1 0 0 0" forceFit="false" url="listPosts.jhtml"
			hidePagebar="true">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="请授权" />
				<aos:dockeditem xtype="tbfill" />
				<aos:triggerfield emptyText="岗位名称" name="hotkey" id="_hotkey_post" onenterkey="_g_post_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_post_query" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem onclick="_user_post_save" text="选中授权" icon="ok1.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_post_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="simple" />
			<aos:column type="rowno" />
			<aos:column header="岗位流水号" dataIndex="id_" hidden="true" />
			<aos:column header="岗位名称" dataIndex="name_" width="120" />
			<aos:column header="所属组织" dataIndex="org_name_" width="120" flex="1" />
		</aos:gridpanel>
		<aos:panel region="east" width="320">
			<aos:layout type="hbox" align="stretch" />
			<aos:panel bodyBorder="0 1 0 1" bodyPadding="3" width="65">
				<aos:layout type="vbox" align="center" pack="center" />
				<aos:button onclick="_user_post_save" text="选中" tooltip="选中授权" iconVec="fa-angle-double-right" iconVecAlign="right"
					iconVecSize="16" />
				<aos:button onclick="_user_post_cancel" margin="20 0 0 0" text="撤消" tooltip="撤消授权" iconVec="fa-angle-double-left"
					iconVecSize="16" />
			</aos:panel>
			<aos:gridpanel id="_g_post2" forceFit="false" url="listPosts2.jhtml" width="255" bodyBorder="1 0 0 0"
				hidePagebar="true">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem xtype="tbtext" text="已授权岗位" />
					<aos:dockeditem xtype="tbfill" />
					<aos:triggerfield emptyText="岗位名称" name="hotkey" id="_hotkey_post2" onenterkey="_g_post2_query"
						trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_post2_query" width="130" />
				</aos:docked>
				<aos:menu>
					<aos:menuitem onclick="_user_post_cancel" text="撤消授权" icon="del.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="刷新" onclick="#_g_post2_store.reload();" icon="refresh.png" />
				</aos:menu>
				<aos:selmodel type="checkbox" mode="simple" />
				<aos:column type="rowno" />
				<aos:column header="授权流水号" dataIndex="user_post_id_" hidden="true" />
				<aos:column header="岗位名称" dataIndex="name_" flex="1" />
				<aos:column header="所属组织" dataIndex="org_name_" hidden="true" />
			</aos:gridpanel>
		</aos:panel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="#_w_user_post.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_user_role" title="用户角色授权" width="800" height="-10" layout="border" onshow="_w_user_role_onshow">
		<aos:gridpanel id="_g_role" bodyBorder="1 0 0 0" url="listRoles.jhtml" hidePagebar="true" region="center">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="请授权" />
				<aos:dockeditem xtype="tbfill" />
				<aos:triggerfield emptyText="角色名称" name="hotkey" id="_hotkey_role" onenterkey="_g_role_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_role_query" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem onclick="_user_role_save" text="选中授权" icon="ok1.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_role_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="simple" />
			<aos:column type="rowno" />
			<aos:column header="角色流水号" dataIndex="id_" hidden="true" />
			<aos:column header="角色名称" dataIndex="name_" flex="1" />
			<aos:column header="角色类型" dataIndex="type_" rendererField="role_type_" hidden="true" />
			<aos:column header="创建人" dataIndex="creater_name_" width="80" />
		</aos:gridpanel>
		<aos:panel region="east" width="320">
			<aos:layout type="hbox" align="stretch" />
			<aos:panel bodyBorder="0 1 0 1" bodyPadding="3" width="65">
				<aos:layout type="vbox" align="center" pack="center" />
				<aos:button onclick="_user_role_save" text="选中" tooltip="选中授权" iconVec="fa-angle-double-right" iconVecAlign="right"
					iconVecSize="16" />
				<aos:button onclick="_user_role_cancel" margin="20 0 0 0" text="撤消" tooltip="撤消授权" iconVec="fa-angle-double-left"
					iconVecSize="16" />
			</aos:panel>
			<aos:gridpanel id="_g_role2" forceFit="false" url="listRoles2.jhtml" width="255" bodyBorder="1 0 0 0"
				hidePagebar="true">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem xtype="tbtext" text="已授权角色" />
					<aos:dockeditem xtype="tbfill" />
					<aos:triggerfield emptyText="角色名称" name="hotkey" id="_hotkey_role2" onenterkey="_g_role2_query"
						trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_role2_query" width="130" />
				</aos:docked>
				<aos:menu>
					<aos:menuitem onclick="_user_role_cancel" text="撤消授权" icon="del.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="刷新" onclick="#_g_role2_store.reload();" icon="refresh.png" />
				</aos:menu>
				<aos:selmodel type="checkbox" mode="simple" />
				<aos:column type="rowno" />
				<aos:column header="授权流水号" dataIndex="user_role_id_" hidden="true" />
				<aos:column header="角色名称" dataIndex="name_" flex="1" />
				<aos:column header="创建人" dataIndex="creater_name_" width="80" hidden="true" />
			</aos:gridpanel>
		</aos:panel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="#_w_user_role.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_user_cmp" title="用户页面元素授权" width="900" height="-10" layout="border" onshow="_w_user_cmp_onshow">
		<aos:treepanel id="_t_module_cmp" region="west" singleClick="false" width="260" bodyBorder="0 1 0 0"
			url="${cxt}/system/page/listModuleTree4ElementGrant.jhtml" nodeParam="parent_id_" rootId="${rootDto_.rootId}"
			rootVisible="true" rootExpanded="false" rootText="${rootDto_.rootText}" rootIcon="${rootDto_.rootIcon}"
			onitemclick="_g_cmp_query">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="功能模块树" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="_t_module_cmp_load" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_cmp" region="center" bodyBorder="1 0 0 0" forceFit="false"
			url="${cxt}/system/page/listEelments4Grant.jhtml" hidePagebar="true">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="请授权" />
				<aos:dockeditem xtype="tbfill" />
				<aos:triggerfield emptyText="DOM标识或名称" name="hotkey" id="_hotkey_cmp" onenterkey="_hotkey_cmp_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_hotkey_cmp_query" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="_g_cmp_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:plugins>
				<aos:editing clicksToEdit="1" onedit="_user_cmp_save" autoCancel="false" />
			</aos:plugins>
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="所属模块流水号" dataIndex="module_id_" hidden="true" />
			<aos:column header="授权流水号" dataIndex="element_grant_id_" hidden="true" />
			<aos:column header="授权" dataIndex="grant_type_" rendererField="cmp_grant_type_" width="80">
				<aos:combobox dicField="cmp_grant_type_" dicFilter="!1" />
			</aos:column>
			<aos:column header="DOM标识" dataIndex="dom_id_" width="120" />
			<aos:column header="所属页面" dataIndex="page_name_" width="150" celltip="true" />
			<aos:column header="所属模块" dataIndex="module_name_" width="150" celltip="true" />
			<aos:column header="元素名称" dataIndex="name_" flex="1" celltip="true" />
		</aos:gridpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="#_w_user_cmp.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_preview" title="用户权限预览" width="600" height="-1" layout="accordion" onshow="_w_preview_onshow">
		<aos:panel id="_p_modules" title="功能菜单权限">
			<aos:layout type="hbox" align="stretch" />
			<aos:treepanel id="_t_biz" bodyBorder="0 0 0 0" url="getBizModulesOfUser.jhtml" singleClick="false" rootId="p"
				rootExpanded="false" rootText="已授权[经办权限]" width="300">
				<aos:menu>
					<aos:menuitem text="刷新" onclick="_t_biz_load" icon="refresh.png" />
				</aos:menu>
			</aos:treepanel>
			<aos:treepanel id="_t_admin" bodyBorder="0 0 0 1" url="getAdminModulesOfUser.jhtml" singleClick="false" rootId="p"
				rootExpanded="false" rootText="已授权[管理权限]" width="300">
				<aos:menu>
					<aos:menuitem text="刷新" onclick="_t_admin_load" icon="refresh.png" />
				</aos:menu>
			</aos:treepanel>
		</aos:panel>
		<aos:gridpanel id="_g_cmpofuser" title="页面元素权限" url="getElementsOfUser.jhtml" hidePagebar="true"
			onexpand="_g_cmpofuser_onexpand">
			<aos:menu>
				<aos:menuitem text="刷新" onclick="_g_cmpofuser_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:column type="rowno" />
			<aos:column header="权限" dataIndex="grant_type_" rendererField="cmp_grant_type_" width="80" />
			<aos:column header="DOM标识" dataIndex="dom_id_" width="120" celltip="true" />
			<aos:column header="元素名称" dataIndex="name_" width="150" celltip="true" />
			<aos:column header="所属页面" dataIndex="page_name_" width="150" celltip="true" />
			<aos:column header="所属模块" dataIndex="module_name_" width="150" celltip="true" />
		</aos:gridpanel>
		<aos:panel title="数据权限" html="数据权限">
		</aos:panel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbtext" iconVec="fa-hand-o-right " text=" 提示：权限预览展示的数据为经过用户角色岗位三权合并计算后的结果。" />
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="#_w_preview.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<script type="text/javascript">

            //弹出用户权限预览窗口
            function _w_preview_show() {
                var rows = AOS.rows(_g_user);
                if (rows === 0) {
                    AOS.tip('请先选择要操作的人员。');
                    return;
                } else if (rows > 1) {
                    AOS.tip('只能对单个人员进行操作。');
                    return;
                }
                _w_preview.show();
            }

            var _g_cmpofuser_load_first = true;
            //用户组件授权预览列表展开
            function _g_cmpofuser_onexpand() {
                if (_g_cmpofuser_load_first) {
                    _g_cmpofuser_load();
                }
            }

            //查询用户组件授权预览列表
            function _g_cmpofuser_load() {
                var params = {
                    user_id_: AOS.selectone(_g_user).data.id_
                };
                _g_cmpofuser_store.getProxy().extraParams = params;
                _g_cmpofuser_store.loadPage();
                _g_cmpofuser_load_first = false;
            }

            //保存组件授权数据
            function _user_cmp_save(editor, e) {
                var record = e.record;
                if (AOS.empty(record.data.grant_type_)) {
                    record.data.grant_type_ = '1';
                    e.record.commit();
                    return;
                }
                record.data.user_id_ = AOS.selectone(_g_user).data.id_;
                AOS.ajax({
                    params: record.data,
                    url: '${cxt}/system/page/saveElementGrantInfo.jhtml',
                    ok: function (data) {
                        _g_cmp_store.reload();
                        AOS.tip(data.appmsg);
                    }
                });
            }

            //刷新页面元素授权菜单树
            function _t_module_cmp_load() {
                var refreshnode = _t_module_cmp.getRootNode();
                _t_module_cmp_store.load({
                    node: refreshnode,
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                    }
                });
            }

            //弹出用户页面元素授权窗口
            function _w_user_cmp_show() {
                var rows = AOS.rows(_g_user);
                if (rows === 0) {
                    AOS.tip('请先选择要操作的人员。');
                    return;
                } else if (rows > 1) {
                    AOS.tip('只能对单个人员进行授权操作。');
                    return;
                }
                _w_user_cmp.show();
            }

            //监听用户页面元素授权窗口弹出事件
            function _w_user_cmp_onshow() {
                var record = AOS.selectone(_g_user);
                var title = AOS.merge('用户页面元素授权 [当前用户：{0}]', record.data.name_);
                _w_user_cmp.setTitle(AOS.title(title));
                _t_module_cmp_load();
                _g_cmp_store.removeAll();
            }

            //页面元素授权列表快捷搜索
            function _hotkey_cmp_query() {
                _g_cmp_query(1);
            }

            //查询用户页面元素授权窗口页面元素列表
            function _g_cmp_query(flag) {
                var record = AOS.selectone(_t_module_cmp);
                if (!record || !record.data.leaf) {
                    AOS.tip('请选择叶子节点');
                    _g_cmp_store.removeAll();
                    return;
                }
                var params = {
                    user_id_: AOS.selectone(_g_user).data.id_,
                    hotkey: _hotkey_cmp.getValue()
                };
                if (record) {
                    params.module_id_ = record.raw.id;
                }
                _g_cmp_store.getProxy().extraParams = params;
                _g_cmp_store.loadPage(1,{
                    callback: function (records) {
                        if (records.length === 0) {
                            if (flag !== 1) AOS.tip('此功能模块没有绑定的页面元素，不能进行页面元素授权。');
                        }
                    }
                });
            }

            //权限预览弹出窗口监听
            function _w_preview_onshow() {
                var record = AOS.selectone(_g_user);
                var title = AOS.merge('用户权限预览 [当前用户：{0}]', record.data.name_);
                _w_preview.setTitle(AOS.title(title));
                if (_p_modules.collapsed === false) {
                    _t_biz_load(true);
                } else {
                    _p_modules.expand();
                    AOS.job(function () {
                        _t_biz_load(true);
                    }, 200);
                }
                _g_cmpofuser_load_first = true;
            }

            //权限预览(菜单经办权限)
            function _t_biz_load(flag) {
                refreshnode = _t_biz.getRootNode();
                var record = AOS.selectone(_g_user);
                var params = {
                    user_id_: record.data.id_
                };
                _t_biz_store.getProxy().extraParams = params;
                _t_biz_store.load({
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                        if (flag) _t_admin_load();
                    }
                });
            }

            //权限预览(菜单管理权限)
            function _t_admin_load() {
                refreshnode = _t_admin.getRootNode();
                var record = AOS.selectone(_g_user);
                var params = {
                    user_id_: record.data.id_
                };
                _t_admin_store.getProxy().extraParams = params;
                _t_admin_store.load({
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                    }
                });
            }

            //弹出选择所属组织窗口
            function _w_org_find_show() {
                _w_org_find.show();
            }
            //监听所属组织选择窗口弹出事件
            function _w_org_find_onshow() {
                _t_org_find_refresh();
            }

            //刷新所属组织树
            function _t_org_find_refresh() {
                var refreshnode = AOS.selectone(_t_org_find);
                if (!refreshnode) {
                    refreshnode = _t_org_find.getRootNode();
                }
                if (refreshnode.isLeaf()) {
                    refreshnode = refreshnode.parentNode;
                }
                _t_org_find_store.load({
                    node: refreshnode,
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                    }
                });
            }

            //所属组织树节点双击事件
            function _t_org_find_select() {
                var record = AOS.selectone(_t_org_find);
                if (_w_user.isVisible()) {
                    //新增窗口
                    _f_user.down('[name=org_id_]').setValue(record.raw.id);
                    _f_user.down('[name=org_name_]').setValue(record.raw.text);
                } else if (_w_user_u.isVisible()) {
                    //修改
                    _f_user_u.down('[name=org_id_]').setValue(record.raw.id);
                    _f_user_u.down('[name=org_name_]').setValue(record.raw.text);
                } else {
                    //批量修改
                    _f_userorg.down('[name=org_id_]').setValue(record.raw.id);
                    _f_userorg.down('[name=org_name_]').setValue(record.raw.text);
                }
                _w_org_find.hide();
            }

            var _grant_type_ = 1;
            var _tabs_1_actived = false;
            var aos_rows__t_module_init;
            var aos_rows__t_module_2_init;

            //监听Tab激活事件
            function _tabs_onactivate1() {
                _grant_type_ = 1;
            }

            //监听Tab激活事件
            function _tabs_onactivate2() {
                _grant_type_ = 2;
                if (!_tabs_1_actived) {
                    //防止在回调中渲染的树显示上有迟钝感。所以先收缩起来。
                    _t_module_3.collapseAll();
                    _t_module_2_load(true);
                }
            }

            //查询用户列表
            function _g_user_query() {
                var params = {
                    hotkey: _hotkey.getValue(),
                    cascade: _cascade.getValue()
                };
                var record = AOS.selectone(_t_org);
                if (!AOS.empty(record)) {
                    params.org_id_ = record.raw.id;
                } else {
                    params.org_id_ = '${dept_.id_}';
                }
                _g_user_store.getProxy().extraParams = params;
                _g_user_store.loadPage(1);
            }

            //刷新组织树
            function _t_org_refresh() {
                var refreshnode = AOS.selectone(_t_org);
                if (!refreshnode) {
                    refreshnode = _t_org.getRootNode();
                }
                if (refreshnode.isLeaf()) {
                    refreshnode = refreshnode.parentNode;
                }
                _t_org_store.load({
                    node: refreshnode,
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                    }
                });
            }

            //弹出新增用户窗口
            function _w_user_show() {
                AOS.reset(_f_user);
                var record = AOS.selectone(_t_org);
                if (!AOS.empty(record)) {
                    _f_user.down('[name=org_id_]').setValue(record.raw.id);
                    _f_user.down('[name=org_name_]').setValue(record.raw.text);
                }
                _w_user.show();
            }

            //新增用户保存
            function _f_user_save() {
                AOS.ajax({
                    forms: _f_user,
                    url: 'saveUser.jhtml',
                    ok: function (data) {
                        if (data.appcode === -1) {
                            AOS.err(data.appmsg);
                        } else {
                            _w_user.hide();
                            _g_user_store.reload();
                            AOS.tip(data.appmsg);
                        }
                    }
                });
            }

            //弹出修改用户窗口
            function _w_user_u_show() {
                AOS.reset(_f_user_u);
    			if(AOS.selectone(_g_user)){
    				_w_user_u.show();
    	     	}
            }

            //监听弹出修改用户窗口事件
            function _w_user_u_onshow() {
                var record = AOS.selectone(_g_user);
                AOS.ajax({
                    params: {id_: record.data.id_},
                    url: 'getUser.jhtml',
                    ok: function (data) {
                        _f_user_u.form.setValues(data);
                        _f_user_u.down('[name=old_org_id_]').setValue(record.data.org_id_);
                        _f_user_u.down('[name=org_id_]').setValue(record.data.org_id_);
                        _f_user_u.down('[name=org_name_]').setValue(record.data.org_name_);
                        if(AOS.empty(data.bytearray_id_)) {
                            Ext.get('_img_photo').dom.src = '${cxt}/static/image/empty_head_photo.png';
                        }else {
                            Ext.get('_img_photo').dom.src = '${cxt}/system/byteObj/viewByteObj.jhtml?id_=' + data.bytearray_id_;
                        }
                    }
                });
            }

            //修改用户保存
            function _f_user_u_save() {
                var org_id_ = _f_user_u.down('[name=org_id_]').getValue();
                var old_org_id_ = _f_user_u.down('[name=old_org_id_]').getValue();
                if (org_id_ != old_org_id_) {
                    AOS.confirm('提示：所属组织被修改，继续保存将清除当前用户和岗位的授权关系。<br>继续保存吗？', function (btn) {
                        if (btn === 'cancel') {
                            AOS.tip('用户修改操作被取消。');
                        } else {
                            _f_user_u_save2();
                        }
                    });
                } else {
                    _f_user_u_save2();
                }
            }

            //修改用户保存
            function _f_user_u_save2() {
                AOS.ajax({
                    forms: _f_user_u,
                    url: 'updateUser.jhtml',
                    ok: function (data) {
                        if (data.appcode === -1) {
                            AOS.err(data.appmsg);
                            return;
                        }
                        _w_user_u.hide();
                        _g_user_store.reload();
                        AOS.tip(data.appmsg);
                    }
                });
            }

            //删除用户
            function _g_user_del() {
                var selection = AOS.selection(_g_user, 'id_');
                if (AOS.empty(selection)) {
                    AOS.tip('删除前请先选中数据。');
                    return;
                }
                var msg = AOS.merge('确认要删除选中的[{0}]个用户数据吗？', AOS.rows(_g_user));
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('删除操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        url: 'deleteUser.jhtml',
                        params: {
                            aos_rows_: selection
                        },
                        ok: function (data) {
                            AOS.tip(data.appmsg);
                            _g_user_store.reload();
                        }
                    });
                });
            }

            //弹出密码重置窗口
            function _w_pwd_show() {
                AOS.reset(_f_pwd);
                var selection = AOS.selection(_g_user, 'id_');
                if (AOS.empty(selection)) {
                    AOS.tip('请先选中需要充值密码的用户数据。');
                    return;
                }
                _f_pwd.down('[name=aos_rows_]').setValue(selection);
                _w_pwd.show();
            }

            //密码重置
            function _f_pwd_save() {
                var password_ = _f_pwd.down('[name=password_]').getValue();
                var password_b = _f_pwd.down('[name=password_b]').getValue();
                if (password_b !== password_) {
                    _f_pwd.down('[name=password_b]').markInvalid('两次输入密码不一致, 请重新输入。');
                    return;
                }
                var msg = AOS.merge('确认要重置选中的[{0}]个用户的密码吗？', AOS.rows(_g_user));
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('重置密码操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        forms: _f_pwd,
                        url: 'updatePwd.jhtml',
                        ok: function (data) {
                            _w_pwd.hide();
                            AOS.tip(data.appmsg);
                        }
                    });
                });
            }

            //批量更新用户状态
            function _fn_updateStatus(status_) {
                var rows = AOS.rows(_g_user);
                if (rows === 0) {
                    AOS.tip('请先选择要操作的用户数据。');
                    return;
                }
                var msg = AOS.merge('确认要解封/启用选中的[{0}]个用户吗？', rows);
                if (status_ === 2) {
                    msg = AOS.merge('确认要停用选中的[{0}]个用户吗？', rows);
                }
                if (status_ === 3) {
                    msg = AOS.merge('确认要封锁选中的[{0}]个用户吗？', rows);
                }
                var selection = AOS.selection(_g_user, 'id_');
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        params: {
                            status_: status_,
                            aos_rows_: selection
                        },
                        url: 'updateStatus.jhtml',
                        ok: function (data) {
                            _g_user_store.reload();
                            AOS.tip(data.appmsg);
                        }
                    });
                });
            }

            //弹出批量修改所属组织窗口
            function _w_userorg_show() {
                AOS.reset(_f_userorg);
                var rows = AOS.rows(_g_user);
                if (rows === 0) {
                    AOS.tip('请先选择要操作的用户数据。');
                    return;
                }
                var selection = AOS.selection(_g_user, 'id_');
                _f_userorg.down('[name=aos_rows_]').setValue(selection);
                _w_userorg.show();
            }

            //批量修改用户所属组织
            function _f_userorg_save() {
                if (!AOS.getValueid(_f_userorg)) return;
                var rows = AOS.rows(_g_user);
                var msg = AOS.merge('提示：修改所属组织将清除所选[{0}]个用户和岗位的授权关系。<br><br>继续保存吗？', rows);
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        forms: _f_userorg,
                        url: 'updateUserOrg.jhtml',
                        ok: function (data) {
                            _w_userorg.hide();
                            _g_user_store.reload();
                            AOS.tip(data.appmsg);
                        }
                    });
                });
            }

            //弹出用户菜单授权窗口
            function _w_user_module_show() {
                var rows = AOS.rows(_g_user);
                if (rows === 0) {
                    AOS.tip('请先选择要操作的用户数据。');
                    return;
                } else if (rows > 1) {
                    AOS.tip('只能对单个用户进行授权操作。');
                    return;
                }
                _w_user_module.show();
            }

            //监听菜单授权窗口弹出事件
            function _w_user_module_onshow() {
                var record = AOS.selectone(_g_user);
                var title = AOS.merge('用户菜单授权 [当前用户：{0}]', record.data.name_);
                _w_user_module.setTitle(AOS.title(title));
                _tabs_1_actived = false;
                _tabs.setActiveTab(0);
                _t_module_load(true);
                //防止在回调中渲染的树显示上有迟钝感。所以先收缩起来。
                _t_module_1.collapseAll();
            }

            //保存用户菜单授权数据
            function _user_module_save() {
                var aos_rows_;
                if (_grant_type_ === 1) {
                    aos_rows_ = AOS.selection(_t_module, 'id');
                    if (aos_rows_ === aos_rows__t_module_init) {
                        AOS.tip('操作被取消，授权数据无变化不需要保存。');
                        return;
                    }
                } else {
                    aos_rows_ = AOS.selection(_t_module_2, 'id');
                    if (aos_rows_ === aos_rows__t_module_2_init) {
                        AOS.tip('操作被取消，授权数据无变化不需要保存。');
                        return;
                    }
                }
                var record = AOS.selectone(_g_user);
                var params = {
                    aos_rows_: aos_rows_,
                    user_id_: record.data.id_,
                    grant_type_: _grant_type_
                };
                AOS.ajax({
                    params: params,
                    url: 'saveUserModuleGrantInfo.jhtml',
                    ok: function (data) {
                        AOS.tip(data.appmsg);
                        if (_grant_type_ === 1) {
                            _t_module_1_load();
                            aos_rows__t_module_init = AOS.selection(_t_module, 'id');
                        } else {
                            _t_module_3_load();
                            aos_rows__t_module_2_init = AOS.selection(_t_module_2, 'id');
                        }
                    }
                });
            }

            //加载业务经办授权菜单树(待选择)
            function _t_module_load(flag) {
                refreshnode = _t_module.getRootNode();
                var record = AOS.selectone(_g_user);
                var params = {
                    user_id_: record.data.id_,
                    grant_type_: '1'
                };
                _t_module_store.getProxy().extraParams = params;
                _t_module_store.load({
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                        //防止两棵树同时渲染出现一些问题
                        if (flag) {
                            _t_module_1_load();
                        }
                        aos_rows__t_module_init = AOS.selection(_t_module, 'id');
                    }
                });
            }

            //加载业务经办授权菜单树(已选择)
            function _t_module_1_load() {
                refreshnode = _t_module_1.getRootNode();
                var record = AOS.selectone(_g_user);
                var params = {
                    user_id_: record.data.id_,
                    grant_type_: '1'
                };
                _t_module_1_store.getProxy().extraParams = params;
                _t_module_1_store.load({
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                    }
                });
            }

            //加载再授权菜单树(待选择)
            function _t_module_2_load(flag) {
                _tabs_1_actived = true;
                refreshnode = _t_module_2.getRootNode();
                var record = AOS.selectone(_g_user);
                var params = {
                    user_id_: record.data.id_,
                    grant_type_: '2'
                };
                _t_module_2_store.getProxy().extraParams = params;
                _t_module_2_store.load({
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                        //防止两棵树同时渲染出现一些问题
                        if (flag) {
                            _t_module_3_load();
                        }
                        aos_rows__t_module_2_init = AOS.selection(_t_module_2, 'id');
                    }
                });
            }

            //加载再授权菜单树(已选择)
            function _t_module_3_load() {
                refreshnode = _t_module_3.getRootNode();
                var record = AOS.selectone(_g_user);
                var params = {
                    user_id_: record.data.id_,
                    grant_type_: '2'
                };
                _t_module_3_store.getProxy().extraParams = params;
                _t_module_3_store.load({
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                    }
                });
            }

            //弹出用户岗位授权窗口
            function _w_user_post_show() {
                var rows = AOS.rows(_g_user);
                if (rows === 0) {
                    AOS.tip('请先选择要操作的用户数据。');
                    return;
                } else if (rows > 1) {
                    AOS.tip('只能对单个用户进行授权操作。');
                    return;
                }
                _w_user_post.show();
            }

            //监听用户岗位授权窗口弹出事件
            function _w_user_post_onshow() {
                var record = AOS.selectone(_g_user);
                var title = AOS.merge('用户岗位授权 [当前用户：{0}]', record.data.name_);
                _w_user_post.setTitle(AOS.title(title));
                _t_org_post.getRootNode().expand();
                _g_post_query();
                _g_post2_query();
            }

            //刷新授权窗口上的组织机构树
            function _t_org_post_load() {
                refreshnode = _t_org_post.getRootNode();
                _t_org_post_store.load({
                    callback: function () {
                        //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                        refreshnode.collapse();
                        refreshnode.expand();
                    }
                });
            }

            //查询用户岗位授权窗口岗位列表
            function _g_post_query() {
                var params = {
                    hotkey: _hotkey_post.getValue(),
                    cascade: _cascade_post.getValue(),
                    user_id_: AOS.selectone(_g_user).data.id_
                };
                var record = AOS.selectone(_t_org_post);
                if (!AOS.empty(record)) {
                    params.org_id_ = record.raw.id;
                } else {
                    params.org_id_ = '${dept_.id_}';
                }
                _g_post_store.getProxy().extraParams = params;
                _g_post_store.loadPage(1);
            }

            //查询用户岗位已授权列表
            function _g_post2_query() {
                var params = {
                    hotkey: _hotkey_post2.getValue(),
                    user_id_: AOS.selectone(_g_user).data.id_
                };
                _g_post2_store.getProxy().extraParams = params;
                _g_post2_store.loadPage(1);
            }

            //保存用户岗位授权信息
            function _user_post_save() {
                var rows = AOS.rows(_g_post);
                if (rows === 0) {
                    AOS.tip('操作被取消，请先选中要授权的岗位。');
                    return;
                }
                var record = AOS.selectone(_g_user);
                var params = {
                    aos_rows_: AOS.selection(_g_post, 'id_'),
                    user_id_: record.data.id_
                };
                AOS.ajax({
                    params: params,
                    url: 'saveUserPostGrantInfo.jhtml',
                    ok: function (data) {
                        AOS.tip(data.appmsg);
                        _g_post_store.reload();
                        _g_post2_query();
                    }
                });
            }

            //取消用户岗位授权
            function _user_post_cancel() {
                var rows = AOS.rows(_g_post2);
                if (rows === 0) {
                    AOS.tip('操作被取消，请先选中要撤消授权的岗位。');
                    return;
                }
                AOS.ajax({
                    url: 'delUserPostGrantInfo.jhtml',
                    params: {
                        aos_rows_: AOS.selection(_g_post2, 'user_post_id_')
                    },
                    ok: function (data) {
                        AOS.tip(data.appmsg);
                        _g_post2_store.reload();
                        _g_post_store.reload();
                    }
                });
            }

            //弹出用户角色授权窗口
            function _w_user_role_show() {
                var rows = AOS.rows(_g_user);
                if (rows === 0) {
                    AOS.tip('请先选择要操作的用户数据。');
                    return;
                } else if (rows > 1) {
                    AOS.tip('只能对单个用户进行授权操作。');
                    return;
                }
                _w_user_role.show();
            }

            //监听用户角色授权窗口弹出事件
            function _w_user_role_onshow() {
                var record = AOS.selectone(_g_user);
                var title = AOS.merge('用户角色授权 [当前用户：{0}]', record.data.name_);
                _w_user_role.setTitle(AOS.title(title));
                _g_role_query();
                _g_role2_query();
            }

            //查询用户角色授权窗口角色列表
            function _g_role_query() {
                var params = {
                    hotkey: _hotkey_role.getValue(),
                    user_id_: AOS.selectone(_g_user).data.id_
                };
                _g_role_store.getProxy().extraParams = params;
                _g_role_store.loadPage(1);
            }

            //查询用户角色授权窗口角色列表(已授权)
            function _g_role2_query() {
                var params = {
                    hotkey: _hotkey_role2.getValue(),
                    user_id_: AOS.selectone(_g_user).data.id_
                };
                _g_role2_store.getProxy().extraParams = params;
                _g_role2_store.loadPage(1);
            }

            //保存用户角色授权信息
            function _user_role_save() {
                var rows = AOS.rows(_g_role);
                if (rows === 0) {
                    AOS.tip('操作被取消，请先选中要授权的角色。');
                    return;
                }
                var record = AOS.selectone(_g_user);
                var params = {
                    aos_rows_: AOS.selection(_g_role, 'id_'),
                    user_id_: record.data.id_
                };
                AOS.ajax({
                    params: params,
                    url: 'saveUserRoleGrantInfo.jhtml',
                    ok: function (data) {
                        AOS.tip(data.appmsg);
                        _g_role_store.reload();
                        _g_role2_query();
                    }
                });
            }

            //取消用户角色授权
            function _user_role_cancel() {
                var rows = AOS.rows(_g_role2);
                if (rows === 0) {
                    AOS.tip('操作被取消，请先选中要撤消授权的角色。');
                    return;
                }
                AOS.ajax({
                    url: 'delUserRoleGrantInfo.jhtml',
                    params: {
                        aos_rows_: AOS.selection(_g_role2, 'user_role_id_')
                    },
                    ok: function (data) {
                        AOS.tip(data.appmsg);
                        _g_role2_store.reload();
                        _g_role_store.reload();
                    }
                });
            }

            Ext.create('Ext.tip.ToolTip', {
                target:Ext.get('_img_photo'),
                html : '上传用户头像'
            });
        </script>
</aos:onready>
</aos:html>
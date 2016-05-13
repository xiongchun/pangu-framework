<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="角色与授权">
	<aos:include lib="ext" />
	<aos:base href="system/role" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_role" url="listRoles.jhtml" onrender="_g_role_query" onitemdblclick="_w_role_u_show">
			<aos:docked>
				<aos:dockeditem text="授权" tooltip="授权" icon="config1.png">
					<aos:menu>
						<aos:menuitem text="角色菜单授权" onclick="_w_role_module_show" icon="icon75.png" />
						<aos:menuitem text="角色用户授权" onclick="_w_role_user_show" icon="user6.png" />
						<aos:menuitem text="角色页面元素授权" onclick="_w_role_cmp_show" icon="page_paint.png" />
					</aos:menu>
				</aos:dockeditem>
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem onclick="_w_role_show" text="新增" icon="add.png" />
				<aos:dockeditem onclick="_w_role_u_show" text="修改" icon="edit.png" />
				<aos:dockeditem onclick="_g_role_del" text="删除" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="角色名称" name="hotkey" id="_hotkey" onenterkey="_g_role_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_role_query" width="180" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="更多操作" tooltip="更多业务操作" icon="icon140.png">
					<aos:menu>
						<aos:menuitem text="角色停用" onclick="_fn_updateStatus(0)" icon="stop.gif" />
						<aos:menuitem text="角色启用" onclick="_fn_updateStatus(1)" icon="go.gif" />
					</aos:menu>
				</aos:dockeditem>
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增" onclick="_w_role_show" icon="add.png" />
				<aos:menuitem text="修改" onclick="_w_role_u_show" icon="edit.png" />
				<aos:menuitem text="删除" onclick="_g_role_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="角色菜单授权" onclick="_w_role_module_show" icon="icon75.png" />
				<aos:menuitem text="角色用户授权" onclick="_w_role_user_show" icon="user6.png" />
				<aos:menuitem text="角色页面元素授权" onclick="_w_role_cmp_show" icon="page_paint.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="角色停用" icon="stop.gif" />
				<aos:menuitem text="角色启用" icon="go.gif" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_role_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="角色流水号" dataIndex="id_" hidden="true" />
			<aos:column header="角色名称" dataIndex="name_" width="200" />
			<aos:column header="当前状态" dataIndex="status_" rendererField="enabled_" width="150" />
			<aos:column header="角色类型" dataIndex="type_" rendererField="role_type_" width="200" />
			<aos:column header="创建人所属组织" dataIndex="creater_org_name_" width="200" />
			<aos:column header="创建人" dataIndex="creater_name_" width="150" />
			<aos:column header="创建时间" dataIndex="create_time_" width="160" />
		</aos:gridpanel>
		<aos:window id="_w_role" title="新增角色">
			<aos:formpanel id="_f_role" width="400" layout="anchor" labelWidth="70">
				<aos:textfield name="name_" fieldLabel="角色名称" allowBlank="false" maxLength="50" />
				<aos:combobox name="type_" fieldLabel="角色类型" allowBlank="false" dicField="role_type_" value="1" readOnly="true" />
				<aos:combobox name="status_" fieldLabel="当前状态" allowBlank="false" dicField="enabled_" value="1" readOnly="true" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="_f_role_save" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#_w_role.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
		<aos:window id="_w_role_u" title="修改角色">
			<aos:formpanel id="_f_role_u" width="400" layout="anchor" labelWidth="70">
				<aos:hiddenfield name="id_" />
				<aos:textfield name="name_" fieldLabel="角色名称" allowBlank="false" maxLength="50" />
				<aos:combobox name="type_" fieldLabel="角色类型" allowBlank="false" dicField="role_type_" value="1" />
				<aos:combobox name="status_" fieldLabel="当前状态" allowBlank="false" dicField="enabled_" value="1" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="_f_role_u_save" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#_w_role_u.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

		<aos:window id="_w_role_module" title="角色菜单授权" width="620" height="-10" layout="fit" onshow="_w_role_module_onshow">
			<aos:tabpanel id="_tabs" plain="false">
				<aos:tab title="经办权限" border="false" layout="border" onactivate="_tabs_onactivate1">
					<aos:treepanel id="_t_module" bodyBorder="0 1 0 0" url="getModuleTree4Select.jhtml" singleClick="false"
						cascade="true" rootId="p" rootExpanded="false" rootText="请授权[经办权限]" region="center">
						<aos:menu>
							<aos:menuitem text="刷新" onclick="_t_module_load" icon="refresh.png" />
						</aos:menu>
					</aos:treepanel>
					<aos:treepanel id="_t_module_1" bodyBorder="0 0 0 0" url="getModuleTree4Selected.jhtml" singleClick="false"
						rootId="p" rootExpanded="false" rootText="已授权限[经办权限]" width="300" region="east">
						<aos:menu>
							<aos:menuitem text="刷新" onclick="_t_module_1_load" icon="refresh.png" />
						</aos:menu>
					</aos:treepanel>
				</aos:tab>
				<aos:tab title="管理权限" border="false" width="620" layout="border" onactivate="_tabs_onactivate2">
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
				<aos:dockeditem onclick="_role_module_save" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#_w_role_module.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

		<aos:window id="_w_role_user" title="角色用户授权" width="960" height="-10" layout="border" onshow="_w_role_user_onshow">
			<aos:treepanel id="_t_org_role" region="west" bodyBorder="0 1 0 0" width="230" singleClick="false"
				onitemclick="_g_user_query" url="${cxt}/system/listOrgTree.jhtml" nodeParam="parent_id_" rootId="${dept_.id_}"
				rootText="${dept_.name_}" rootVisible="true" rootIcon="${dept_.icon_name_}" rootExpanded="false">
				<aos:docked forceBoder="0 1 1 0">
					<aos:dockeditem xtype="tbtext" text="组织架构树" />
					<aos:dockeditem xtype="tbfill" />
					<aos:checkbox boxLabel="级联显示用户" id="_cascade_user" name="cascade" onchang="_g_user_query" checked="true" />
				</aos:docked>
				<aos:menu>
					<aos:menuitem text="刷新" onclick="_t_org_role_load" icon="refresh.png" />
				</aos:menu>
			</aos:treepanel>
			<aos:gridpanel id="_g_user" region="center" bodyBorder="1 0 0 0" forceFit="false" url="listUsers.jhtml"
				hidePagebar="true">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem xtype="tbtext" text="请授权" />
					<aos:dockeditem xtype="tbfill" />
					<aos:triggerfield emptyText="姓名或登录帐号" name="hotkey" id="_hotkey_user" onenterkey="_g_user_query"
						trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_user_query" width="180" />
				</aos:docked>
				<aos:menu>
					<aos:menuitem onclick="_role_user_save" text="选中授权" icon="ok1.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="刷新" onclick="_g_user_store.reload();" icon="refresh.png" />
				</aos:menu>
				<aos:selmodel type="checkbox" mode="simple" />
				<aos:column type="rowno" />
				<aos:column header="用户流水号" dataIndex="id_" hidden="true" />
				<aos:column header="姓名" dataIndex="name_" width="80" />
				<aos:column header="登录帐号" dataIndex="account_" width="120" />
				<aos:column header="所属组织" dataIndex="org_name_" flex="1" />
			</aos:gridpanel>
			<aos:panel region="east" width="320">
				<aos:layout type="hbox" align="stretch" />
				<aos:panel bodyBorder="0 1 0 1" bodyPadding="3" width="65">
					<aos:layout type="vbox" align="center" pack="center" />
					<aos:button onclick="_role_user_save" text="选中" tooltip="选中授权" iconVec="fa-angle-double-right" iconVecAlign="right"
						iconVecSize="16" />
					<aos:button onclick="_role_user_cancel" margin="20 0 0 0" text="撤消" tooltip="撤消授权" iconVec="fa-angle-double-left"
						iconVecSize="16" />
				</aos:panel>
				<aos:gridpanel id="_g_user2" forceFit="false" url="listUsers2.jhtml" width="255" bodyBorder="1 0 0 0"
					hidePagebar="true">
					<aos:docked forceBoder="0 0 1 0">
						<aos:dockeditem xtype="tbtext" text="已授权用户" />
						<aos:dockeditem xtype="tbfill" />
						<aos:triggerfield emptyText="姓名或登录帐号" name="hotkey" id="_hotkey_user2" onenterkey="_g_user2_query"
							trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_user2_query" width="130" />
					</aos:docked>
					<aos:menu>
						<aos:menuitem onclick="_role_user_cancel" text="撤消授权" icon="del.png" />
						<aos:menuitem xtype="menuseparator" />
						<aos:menuitem text="刷新" onclick="#_g_user2_store.reload();" icon="refresh.png" />
					</aos:menu>
					<aos:selmodel type="checkbox" mode="simple" />
					<aos:column type="rowno" />
					<aos:column header="授权流水号" dataIndex="user_role_id_" hidden="true" />
					<aos:column header="姓名" dataIndex="name_" width="80" />
					<aos:column header="登录帐号" dataIndex="account_" width="120" />
				</aos:gridpanel>
			</aos:panel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#_w_role_user.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

		<aos:window id="_w_role_cmp" title="角色页面元素授权" width="900" height="-10" layout="border" onshow="_w_role_cmp_onshow">
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
					<aos:editing clicksToEdit="1" onedit="_role_cmp_save" autoCancel="false" />
				</aos:plugins>
				<aos:column type="rowno" />
				<aos:column header="流水号" dataIndex="id_" hidden="true" />
				<aos:column header="授权流水号" dataIndex="element_grant_id_" hidden="true" />
				<aos:column header="所属模块流水号" dataIndex="module_id_" hidden="true" />
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
				<aos:dockeditem onclick="#_w_role_cmp.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

	</aos:viewport>
	<script type="text/javascript">
		
		var _grant_type_ = 1;
		var _tabs_1_actived = false;
    	var aos_rows__t_module_init;
    	var aos_rows__t_module_2_init;
    	
	    //保存组件授权数据
		function _role_cmp_save(editor, e){ 
			var record = e.record;
			if(AOS.empty(record.data.grant_type_)){
				record.data.grant_type_ = '1';
				e.record.commit();
				return ;
			}
 			record.data.role_id_ = AOS.selectone(_g_role).data.id_;
			AOS.ajax({
  				params:record.data,
  				url : '${cxt}/system/page/saveElementGrantInfo.jhtml',
  				ok : function(data) {
  					_g_cmp_store.reload();
  					AOS.tip(data.appmsg);	
  				 }
	  		}); 
		 }
	    
	    //刷新页面元素授权菜单树
		function _t_module_cmp_load() {
			var refreshnode = _t_module_cmp.getRootNode();
			_t_module_cmp_store.load({
				node : refreshnode,
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
	    }
	    
		//弹出角色页面元素授权窗口
		function _w_role_cmp_show(){
    		var rows = AOS.rows(_g_role);
	        if(rows === 0){
	        	AOS.tip('请先选择要操作的角色。');
				return;
	        }else if(rows > 1){
	        	AOS.tip('只能对单个角色进行授权操作。');
				return;
	        }			
	        _w_role_cmp.show();
		}
	    
		//监听角色页面元素授权窗口弹出事件
		function _w_role_cmp_onshow(){
			var record = AOS.selectone(_g_role);
			var title = AOS.merge('角色页面元素授权 [当前角色：{0}]', record.data.name_);
			_w_role_cmp.setTitle(AOS.title(title));
			_t_module_cmp_load();
			_g_cmp_store.removeAll();
		}
		
		//页面元素授权列表快捷搜索
		function _hotkey_cmp_query(){
			_g_cmp_query(1);
		}
		
		//查询页面元素授权窗口页面元素列表
		function _g_cmp_query(flag) {
			var record = AOS.selectone(_t_module_cmp);
			if(!record || !record.data.leaf){
				AOS.tip('请选择叶子节点');
				_g_cmp_store.removeAll();
				return;
			}
	    	var params = {
	    			role_id_ : AOS.selectone(_g_role).data.id_,
	    			hotkey : _hotkey_cmp.getValue()
	  			};
	    	if(record){
	    		params.module_id_  = record.raw.id;
	    	}
	    	_g_cmp_store.getProxy().extraParams = params;
	    	_g_cmp_store.loadPage(1,{
				callback : function(records) {
					if(records.length === 0){
						if(flag !== 1) AOS.tip('此功能模块没有绑定的页面元素，不能进行页面元素授权。');
					}
				}
	    	});
		}
		
		//弹出角色用户授权窗口
		function _w_role_user_show(){
    		var rows = AOS.rows(_g_role);
	        if(rows === 0){
	        	AOS.tip('请先选择要操作的角色。');
				return;
	        }else if(rows > 1){
	        	AOS.tip('只能对单个角色进行授权操作。');
				return;
	        }			
			_w_role_user.show();
		}
		
		//监听角色用户授权窗口
		function _w_role_user_onshow(){
    		var record = AOS.selectone(_g_role);
    		var title = AOS.merge('角色用户授权 [当前角色：{0}]', record.data.name_);
    		_w_role_user.setTitle(AOS.title(title));
    		_t_org_role.getRootNode().expand();
    		_g_user_query();
    		_g_user2_query();
		}
		
		//查询角色用户授权窗口用户列表
		function _g_user_query() {
	    	var params = {
	    			role_id_ : AOS.selectone(_g_role).data.id_,
	  				hotkey : _hotkey_user.getValue(),
	  				cascade : _cascade_user.getValue()
	  			};
	    	var record = AOS.selectone(_t_org_role);
			if(!AOS.empty(record)){
				params.org_id_ = record.raw.id;
			}else{
				params.org_id_ = '${dept_.id_}';
			}
			_g_user_store.getProxy().extraParams = params;
			_g_user_store.loadPage(1);
		}
		
		//查询角色用户授权窗口已授权用户列表
		function _g_user2_query() {
	    	var params = {
    			role_id_ : AOS.selectone(_g_role).data.id_,
  				hotkey : _hotkey_user2.getValue()
	  		};
			_g_user2_store.getProxy().extraParams = params;
			_g_user2_store.loadPage(1);
		}
		
		//保存角色用户授权信息
		function _role_user_save(){
			var rows = AOS.rows(_g_user);
			if(rows === 0){
				AOS.tip('操作被取消，请先选中要授权的用户。');
				return;
			}
			var record = AOS.selectone(_g_role);
			var params = {
				aos_rows_ : AOS.selection(_g_user, 'id_'),
				role_id_ : record.data.id_
			};
			AOS.ajax({
  				params:params,
  				url : 'saveRoleUserGrantInfo.jhtml',
  				ok : function(data) {
  					AOS.tip(data.appmsg);
  					_g_user_store.reload();
  					_g_user2_query();
  				 }
	  		});
		}
		
		//取消角色用户授权
	 	function _role_user_cancel(){
 				var rows = AOS.rows(_g_user2);
 				if(rows === 0){
 					AOS.tip('操作被取消，请先选中要撤消授权的用户。');
 					return;
 				}
				AOS.ajax({
					url : 'delRoleUserGrantInfo.jhtml',
					params:{
						aos_rows_: AOS.selection(_g_user2, 'user_role_id_')
					},
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_user2_store.reload();
						_g_user_store.reload();
					}
				});
	 		}
		
		//监听Tab激活事件
		function _tabs_onactivate1(){	
			_grant_type_ = 1;
		}
		
    	//弹出用户菜单授权窗口
    	function _w_role_module_show(){
    		var rows = AOS.rows(_g_role);
	        if(rows === 0){
	        	AOS.tip('请先选择要操作的角色。');
				return;
	        }else if(rows > 1){
	        	AOS.tip('只能对单个角色进行授权操作，批量处理请选择其它相关功能。');
				return;
	        }
    		_w_role_module.show();
    	}
    	
    	//监听菜单授权窗口弹出事件
    	function _w_role_module_onshow(){
    		var record = AOS.selectone(_g_role);
    		var title = AOS.merge('角色菜单授权 [当前角色：{0}]', record.data.name_);
    		_w_role_module.setTitle(AOS.title(title));
    		_tabs_1_actived = false;
    		_tabs.setActiveTab(0);
    		_t_module_load(true);
    		//防止在回调中渲染的树显示上有迟钝感。所以先收缩起来。
    		_t_module_1.collapseAll(); 
    	}
    	
		//加载业务经办授权菜单树(待选择)
		function _t_module_load(flag) {
			refreshnode = _t_module.getRootNode();
			var record = AOS.selectone(_g_role);
			var params = {
					role_id_ : record.data.id_,
					grant_type_ : '1'
			};
			_t_module_store.getProxy().extraParams = params;
			_t_module_store.load({
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
					//防止两棵树同时渲染出现一些问题
					if(flag){
						_t_module_1_load();
					}
					aos_rows__t_module_init = AOS.selection(_t_module, 'id');
				}
			});
		}
		
		//加载业务经办授权菜单树(已选择)
		function _t_module_1_load() {
			refreshnode = _t_module_1.getRootNode();
			var record = AOS.selectone(_g_role);
			var params = {
					role_id_ : record.data.id_,
					grant_type_ : '1'
			};
			_t_module_1_store.getProxy().extraParams = params;
			_t_module_1_store.load({
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
		}
		
		//监听Tab激活事件
		function _tabs_onactivate2(){
			_grant_type_ = 2;
			if(!_tabs_1_actived){
				//防止在回调中渲染的树显示上有迟钝感。所以先收缩起来。
				_t_module_3.collapseAll();
				_t_module_2_load(true);
			}
		}
		
		//加载再授权菜单树(待选择)
		function _t_module_2_load(flag) {
			_tabs_1_actived = true;
			refreshnode = _t_module_2.getRootNode();
			var record = AOS.selectone(_g_role);
			var params = {
					role_id_ : record.data.id_,
					grant_type_ : '2'
			};
			_t_module_2_store.getProxy().extraParams = params;
			_t_module_2_store.load({
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
					//防止两棵树同时渲染出现一些问题
					if(flag){
						_t_module_3_load();
					}
					aos_rows__t_module_2_init = AOS.selection(_t_module_2, 'id');
				}
			});
		}
		
		//加载再授权菜单树(已选择)
		function _t_module_3_load() {
			refreshnode = _t_module_3.getRootNode();
			var record = AOS.selectone(_g_role);
			var params = {
					role_id_ : record.data.id_,
					grant_type_ : '2'
			};
			_t_module_3_store.getProxy().extraParams = params;
			_t_module_3_store.load({
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
		}
		
    	//保存角色菜单授权数据
    	function _role_module_save(){
    	   var aos_rows_;
		   if(_grant_type_ === 1){
				aos_rows_ = AOS.selection(_t_module, 'id');
		  		if(aos_rows_ === aos_rows__t_module_init){
					AOS.tip('操作被取消，授权数据无变化不需要保存。');
					return;
				}
			}else{
			    aos_rows_ = AOS.selection(_t_module_2, 'id');
		  		if(aos_rows_ === aos_rows__t_module_2_init){
					AOS.tip('操作被取消，授权数据无变化不需要保存。');
					return;
				}
			}
		  var record = AOS.selectone(_g_role);
		  var params = {
				aos_rows_ : aos_rows_,
				grant_type_ : _grant_type_,
				role_id_ : record.data.id_
				};
			AOS.ajax({
  				params:params,
  				url : 'saveRoleModuleGrantInfo.jhtml',
  				ok : function(data) {
  					AOS.tip(data.appmsg);	
  					if(_grant_type_ === 1){
  						_t_module_1_load();
  						aos_rows__t_module_init = AOS.selection(_t_module, 'id');
  					}else{
  						_t_module_3_load();
  						aos_rows__t_module_2_init = AOS.selection(_t_module_2, 'id');
  					}
  				 }
	  		});
		}
		
        //查询角色列表
		function _g_role_query(){
			var params = {
					hotkey : _hotkey.getValue()
			};
			_g_role_store.getProxy().extraParams = params;
			_g_role_store.loadPage(1);
		 }
        
        //弹出新增角色窗口
        function _w_role_show(){
        	AOS.reset(_f_role);
        	_w_role.show();
        }
        
        //保存角色
		function _f_role_save(){
				AOS.ajax({
				forms : _f_role,
				url : 'saveRole.jhtml',
				ok : function(data) {
					_w_role.hide();
					_g_role_store.reload();
					AOS.tip(data.appmsg);
				}
			}); 
		 }
        
		//弹出修改角色窗口
		function _w_role_u_show(){
			AOS.reset(_f_role_u);
			var record = AOS.selectone(_g_role);
			if(record){
				_w_role_u.show();
				_f_role_u.loadRecord(record);
	     	}
		}        
        
        //修改角色
		function _f_role_u_save(){
				AOS.ajax({
				forms : _f_role_u,
				url : 'updateRole.jhtml',
				ok : function(data) {
					_w_role_u.hide();
					_g_role_store.reload();
					AOS.tip(data.appmsg);
				}
			}); 
		}
        
        //删除角色
		function _g_role_del(){
        	var rows = AOS.rows(_g_role);
			if(rows === 0){
				AOS.tip('删除前请先选中数据。');
				return;
			}
			var msg =  AOS.merge('确认要删除选中的[{0}]条数据吗？', rows);
			AOS.confirm(msg, function(btn){
				if(btn === 'cancel'){
					AOS.tip('删除操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'deleteRole.jhtml',
					params:{
						aos_rows_: AOS.selection(_g_role, 'id_')
					},
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_role_store.reload();
					}
				});
			});
		}
        
    	//批量更新角色当前状态
    	function _fn_updateStatus(status_){
 		        var rows = AOS.rows(_g_role);
 		        if(rows === 0){
 		        	AOS.tip('请先选择要操作的角色。');
	 				return;
 		        }
 				var msg =  AOS.merge('确认要停用选中的[{0}]个角色吗？', rows);
 				if(status_ === 1){
 					msg =  AOS.merge('确认要启用选中的[{0}]个角色吗？', rows);
 				}
 				AOS.confirm(msg, function(btn){
	 					if(btn === 'cancel'){
	 						AOS.tip('操作被取消。');
	 						return;
	 					}
	 	 				AOS.ajax({
	 	  				params:{
	 	  					status_:status_,
	 	  					aos_rows_: AOS.selection(_g_role, 'id_')
	 	  				},
	 	  				url : 'updateStatus.jhtml',
	 	  				ok : function(data) {
	 	  					_g_role_store.reload();
	 	  					AOS.tip(data.appmsg);							
	 	  				 }
	 	  			     });
 				});   		
    	}
		</script>
</aos:onready>
</aos:html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="岗位与授权">
	<aos:include lib="ext" />
	<aos:base href="system/post" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_org" region="west" bodyBorder="0 1 0 0" width="260" singleClick="false"
			onitemclick="_g_post_query" url="${cxt}/system/listOrgTree.jhtml" nodeParam="parent_id_" rootId="${dept_.id_}"
			rootText="${dept_.name_}" rootVisible="true" rootIcon="${dept_.icon_name_}">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="组织架构树" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="级联显示岗位" id="_cascade" name="cascade" onchang="_g_post_query" checked="true" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增岗位" onclick="_w_post_show" icon="add.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新树" onclick="_t_org_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_post" region="center" onrender="_g_post_query" url="listPosts.jhtml" bodyBorder="1 0 1 0"
			forceFit="false" onitemdblclick="_w_post_u_show">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="授权" tooltip="授权" icon="config1.png">
					<aos:menu>
						<aos:menuitem text="岗位菜单授权" onclick="_w_post_module_show" icon="icon75.png" />
						<aos:menuitem text="岗位用户授权" onclick="_w_post_user_show" icon="user6.png" />
						<aos:menuitem text="岗位页面元素授权" onclick="_w_post_cmp_show" icon="page_paint.png" />
					</aos:menu>
				</aos:dockeditem>
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="新增" tooltip="新增岗位" onclick="_w_post_show" icon="add.png" />
				<aos:dockeditem text="修改" tooltip="修改岗位" onclick="_w_post_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" tooltip="删除岗位" onclick="_g_post_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="岗位名称" name="hotkey" id="_hotkey" onenterkey="_g_post_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_post_query" width="180" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="更多操作" tooltip="更多业务操作" icon="icon140.png">
					<aos:menu>
						<aos:menuitem text="岗位停用" onclick="_fn_updateStatus(0)" icon="stop.gif" />
						<aos:menuitem text="岗位启用" onclick="_fn_updateStatus(1)" icon="go.gif" />
						<aos:menuitem text="批量修改所属组织" onclick="_w_postorg_show" icon="icon87.png" />
					</aos:menu>
				</aos:dockeditem>
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增岗位" onclick="_w_post_show" icon="add.png" />
				<aos:menuitem text="修改岗位" onclick="_w_post_u_show" icon="edit.png" />
				<aos:menuitem text="删除岗位" onclick="_g_post_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="岗位菜单授权" onclick="_w_post_module_show" icon="icon75.png" />
				<aos:menuitem text="岗位用户授权" onclick="_w_post_user_show" icon="user6.png" />
				<aos:menuitem text="岗位页面元素授权" onclick="_w_post_cmp_show" icon="page_paint.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="岗位停用" onclick="_fn_updateStatus(0)" icon="stop.gif" />
				<aos:menuitem text="岗位启用" onclick="_fn_updateStatus(1)" icon="go.gif" />
				<aos:menuitem text="批量修改所属组织" onclick="_w_postorg_show" icon="icon87.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_post_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="岗位流水号" dataIndex="id_" hidden="true" />
			<aos:column header="所属组织流水号" dataIndex="org_id_" hidden="true" />
			<aos:column header="岗位名称" dataIndex="name_" width="250" />
			<aos:column header="当前状态" dataIndex="status_" rendererField="enabled_" />
			<aos:column header="岗位类型" dataIndex="type_" rendererField="post_type_" />
			<aos:column header="所属组织" dataIndex="org_name_" width="200" flex="1" />
			<aos:column header="创建人" dataIndex="creater_name_" />
			<aos:column header="创建时间" dataIndex="create_time_" width="160" />
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
	<aos:window id="_w_post" title="新增岗位">
		<aos:formpanel id="_f_post" width="400" layout="anchor" labelWidth="70">
			<aos:hiddenfield name="org_id_" value="${dept_.id_}" />
			<aos:triggerfield fieldLabel="所属组织" name="org_name_" value="${dept_.name_}" allowBlank="false" editable="false"
				onfocus="_w_org_find_show" trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_org_find_show" />
			<aos:textfield name="name_" fieldLabel="岗位名称" allowBlank="false" maxLength="50" />
			<aos:combobox name="type_" fieldLabel="岗位类型" allowBlank="false" dicField="post_type_" value="1" />
			<aos:combobox name="status_" fieldLabel="当前状态" allowBlank="false" dicField="enabled_" value="1" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_post_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_post.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_post_u" title="修改岗位">
		<aos:formpanel id="_f_post_u" width="400" layout="anchor" labelWidth="70">
			<aos:hiddenfield fieldLabel="岗位流水号" name="id_" />
			<aos:hiddenfield fieldLabel="所属组织流水号" name="old_org_id_" />
			<aos:hiddenfield name="org_id_" />
			<aos:triggerfield fieldLabel="所属组织" name="org_name_" allowBlank="false" editable="false" onfocus="_w_org_find_show"
				trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_org_find_show" />
			<aos:textfield name="name_" fieldLabel="岗位名称" allowBlank="false" maxLength="50" />
			<aos:combobox name="type_" fieldLabel="岗位类型" allowBlank="false" dicField="post_type_" />
			<aos:combobox name="status_" fieldLabel="当前状态" allowBlank="false" dicField="enabled_" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_post_u_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_post_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_postorg" title="批量修改岗位所属组织">
		<aos:formpanel id="_f_postorg" width="400" layout="anchor" labelWidth="70">
			<aos:hiddenfield name="aos_rows_" fieldLabel="已选中的岗位ID集合" />
			<aos:hiddenfield name="org_id_" />
			<aos:triggerfield fieldLabel="所属组织" name="org_name_" allowBlank="false" editable="false" onfocus="_w_org_find_show"
				trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_org_find_show" />
			<aos:displayfield margin="0 0 0 10" value="(提示：修改岗位所属组织将清除当前岗位和用户的关联关系。)" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_postorg_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_postorg.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_post_module" title="岗位菜单授权" width="620" height="-10" layout="border" onshow="_w_post_module_onshow">
		<aos:treepanel id="_t_module" bodyBorder="0 1 0 0" url="getModuleTree4Select.jhtml" singleClick="false" cascade="true"
			rootId="p" rootExpanded="false" rootText="请授权[经办权限]" region="center">
			<aos:menu>
				<aos:menuitem text="刷新" onclick="_t_module_load" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>

		<aos:treepanel id="_t_module_1" bodyBorder="0 0 0 0" url="getModuleTree4Selected.jhtml" singleClick="false" rootId="p"
			rootExpanded="false" rootText="已授权限[经办权限]" region="east" width="300">
			<aos:menu>
				<aos:menuitem text="刷新" onclick="_t_module_1_load" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_post_module_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_post_module.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_post_user" title="岗位用户授权" width="960" height="-10" layout="border" onshow="_w_post_user_onshow">
		<aos:treepanel id="_t_org_post" region="west" bodyBorder="0 1 0 0" width="230" singleClick="false"
			onitemclick="_g_user_query" url="${cxt}/system/listOrgTree.jhtml" nodeParam="parent_id_" rootId="${dept_.id_}"
			rootText="${dept_.name_}" rootVisible="true" rootIcon="${dept_.icon_name_}" rootExpanded="false">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="组织架构树" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="级联显示用户" id="_cascade_user" name="cascade" onchang="_g_user_query" checked="true" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="_t_org_post_load" icon="refresh.png" />
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
				<aos:menuitem text="选中授权" onclick="_post_user_save" icon="ok1.png" />
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
				<aos:button onclick="_post_user_save" text="选中" tooltip="选中授权" iconVec="fa-angle-double-right" iconVecAlign="right"
					iconVecSize="16" />
				<aos:button onclick="_g_user2_del" margin="20 0 0 0" text="撤消" tooltip="撤消授权" iconVec="fa-angle-double-left"
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
					<aos:menuitem text="撤消授权" onclick="_g_user2_del" icon="del.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="刷新" onclick="#_g_user2_store.reload();" icon="refresh.png" />
				</aos:menu>
				<aos:selmodel type="checkbox" mode="simple" />
				<aos:column type="rowno" />
				<aos:column header="岗位用户授权流水号" dataIndex="user_post_id_" hidden="true" />
				<aos:column header="姓名" dataIndex="name_" width="80" />
				<aos:column header="登录帐号" dataIndex="account_" width="120" />
			</aos:gridpanel>
		</aos:panel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="#_w_post_user.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="_w_post_cmp" title="岗位页面元素授权" width="900" height="-10" layout="border" onshow="_w_post_cmp_onshow">
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
				<aos:editing clicksToEdit="1" onedit="_post_cmp_save" autoCancel="false" />
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
			<aos:dockeditem onclick="#_w_post_cmp.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<script type="text/javascript">
		//弹出岗位页面元素授权窗口
		function _w_post_cmp_show(){
			var rows = AOS.rows(_g_post);
	        if(rows === 0){
	        	AOS.tip('请先选择要操作的岗位。');
				return;
	        }else if(rows > 1){
	        	AOS.tip('只能对单个岗位进行授权操作。');
				return;
	        }			
	        _w_post_cmp.show();
		}
	
	    //保存岗位组件授权数据
		function _post_cmp_save(editor, e){ 
			var record = e.record;
			if(AOS.empty(record.data.grant_type_)){
				record.data.grant_type_ = '1';
				e.record.commit();
				return ;
			}
 			record.data.post_id_ = AOS.selectone(_g_post).data.id_;
			AOS.ajax({
  				params:record.data,
  				url : '${cxt}/system/page/saveElementGrantInfo.jhtml',
  				ok : function(data) {
  					//e.record.commit();
  					_g_cmp_store.reload();
  					AOS.tip(data.appmsg);	
  				 }
	  		}); 
		 }
	    
	    //刷新岗位页面元素授权菜单树
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
	    
		//监听岗位页面元素授权窗口弹出事件
		function _w_post_cmp_onshow(){
			var record = AOS.selectone(_g_post);
			var title = AOS.merge('岗位页面元素授权 [当前岗位：{0}]', record.data.name_);
			_w_post_cmp.setTitle(AOS.title(title));
			_t_module_cmp_load();
			_g_cmp_store.removeAll();
		}
		
		//页面元素授权列表快捷搜索
		function _hotkey_cmp_query(){
			_g_cmp_query(1);
		}
		
		//查询岗位页面元素授权窗口页面元素列表
		function _g_cmp_query(flag) {
			var record = AOS.selectone(_t_module_cmp);
			if(!record || !record.data.leaf){
				AOS.tip('请选择叶子节点');
				_g_cmp_store.removeAll();
				return;
			}
	    	var params = {
	    			post_id_ : AOS.selectone(_g_post).data.id_,
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
	
	    //弹出选择所属组织窗口
	    function _w_org_find_show(){
	    	 _w_org_find.show();
	    }
	    //监听所属组织选择窗口弹出事件
	    function _w_org_find_onshow(){
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
				node : refreshnode,
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
	    }
	    
	    //所属组织树节点双击事件
	    function _t_org_find_select(){
	    	var record = AOS.selectone(_t_org_find);
	    	if(_w_post.isVisible()){
	    		//新增窗口
		    	_f_post.down('[name=org_id_]').setValue(record.raw.id); 
		    	_f_post.down('[name=org_name_]').setValue(record.raw.text);
	    	}else if(_w_post_u.isVisible()){
	    		//修改
		    	_f_post_u.down('[name=org_id_]').setValue(record.raw.id); 
		    	_f_post_u.down('[name=org_name_]').setValue(record.raw.text);
	    	}else{
	    		//批量修改
	    		_f_postorg.down('[name=org_id_]').setValue(record.raw.id); 
	    		_f_postorg.down('[name=org_name_]').setValue(record.raw.text);
	    	}
			_w_org_find.hide();
	    }
		
    	//弹出岗位用户授权窗口
    	function _w_post_user_show(){
    		var rows = AOS.rows(_g_post);
	        if(rows === 0){
	        	AOS.tip('请先选择要操作的岗位。');
				return;
	        }else if(rows > 1){
	        	AOS.tip('只能对单个岗位进行授权操作。');
				return;
	        }
    		_w_post_user.show();
    	}
    	
    	//监听岗位用户授权窗口弹出事件
    	function _w_post_user_onshow(){
    		var record = AOS.selectone(_g_post);
    		var title = AOS.merge('岗位用户授权 [当前岗位：{0}]', record.data.name_);
    		_w_post_user.setTitle(AOS.title(title));
    		_t_org_post.getRootNode().expand();
    		_g_user_query();
    		_g_user2_query();
    	}
    	
    	//查询岗位用户授权窗口已授权用户列表
		function _g_user2_query() {
	    	var params = {
	    			post_id_ : AOS.selectone(_g_post).data.id_,
	  				hotkey : _hotkey_user2.getValue()
	  			};
			_g_user2_store.getProxy().extraParams = params;
			_g_user2_store.loadPage(1);
		}
		
		//查询岗位用户授权窗口授权用户列表
		function _g_user_query() {
	    	var params = {
	    			post_id_ : AOS.selectone(_g_post).data.id_,
	  				hotkey : _hotkey_user.getValue(),
	  				cascade : _cascade_user.getValue()
	  			};
	    	var record = AOS.selectone(_t_org_post);
			if(!AOS.empty(record)){
				params.org_id_ = record.raw.id;
			}else{
				params.org_id_ = '${dept_.id_}';
			}
			_g_user_store.getProxy().extraParams = params;
			_g_user_store.loadPage(1);
		}
		
		//保存岗位用户授权信息
		function _post_user_save(){
			var rows = AOS.rows(_g_user);
			if(rows === 0){
				AOS.tip('操作被取消，请先选中要授权的用户。');
				return;
			}
			var record = AOS.selectone(_g_post);
			var params = {
				aos_rows_ : AOS.selection(_g_user, 'id_'),
				post_id_ : record.data.id_
			};
 			AOS.ajax({
					params:params,
					url : 'savePostUserGrantInfo.jhtml',
					ok : function(data) {
						_g_user2_query();
						_g_user_store.reload();
						AOS.tip(data.appmsg);	
					 }
	  		}); 
		}
		
        //取消岗位用户授权
	 	function _g_user2_del(){
 				var rows = AOS.rows(_g_user2);
 				if(rows === 0){
 					AOS.tip('操作被取消，请先选中要撤消授权的用户。');
 					return;
 				}
				AOS.ajax({
					url : 'delPostUserGrantInfo.jhtml',
					params:{
						aos_rows_: AOS.selection(_g_user2, 'user_post_id_')
					},
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_user2_store.reload();
						_g_user_store.reload();
					}
				});
	 		}
    	
    	//刷新岗位用户授权窗口上的组织机构树
		function _t_org_post_load() {
			refreshnode = _t_org_post.getRootNode();
			 _t_org_post_store.load({
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
		}
    	
    	//弹出岗位菜单授权窗口
    	function _w_post_module_show(){
    		var rows = AOS.rows(_g_post);
	        if(rows === 0){
	        	AOS.tip('请先选择要操作的岗位。');
				return;
	        }else if(rows > 1){
	        	AOS.tip('只能对单个岗位进行授权操作。');
				return;
	        }
    		_w_post_module.show();
    	}
    	
    	//监听岗位菜单授权窗口弹出事件
    	function _w_post_module_onshow(){
    		var record = AOS.selectone(_g_post);
    		var title = AOS.merge('岗位菜单授权 [当前岗位：{0}]', record.data.name_);
    		_w_post_module.setTitle(AOS.title(title));
    		//防止在回调中渲染的树显示上有迟钝感。所以先收缩起来。
    		_t_module_1.collapseAll(); 
    		_t_module_load(true);
    	}
    	
    	//这个变量用于在保存岗位菜单授权数据时候做比对数据是否有变更
    	var aos_rows__t_module_init;
		//加载业务经办授权菜单树(待选择)
		function _t_module_load(flag) {
			refreshnode = _t_module.getRootNode();
			var record = AOS.selectone(_g_post);
			var params = {
					post_id_ : record.data.id_
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
			var record = AOS.selectone(_g_post);
			var params = {
					post_id_ : record.data.id_
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
		
    	//保存岗位菜单授权数据
    	function _post_module_save(){
    		var aos_rows_ = AOS.selection(_t_module, 'id');
    		if(aos_rows_ === aos_rows__t_module_init){
    			AOS.tip('操作被取消，授权数据无变化不需要保存。');
    			return;
    		}
			var record = AOS.selectone(_g_post);
			var params = {
					aos_rows_ : aos_rows_,
					post_id_ : record.data.id_
			};
			AOS.ajax({
  				params:params,
  				url : 'savePostModuleGrantInfo.jhtml',
  				ok : function(data) {
  					AOS.tip(data.appmsg);	
  					_t_module_1_load();
  					aos_rows__t_module_init = AOS.selection(_t_module, 'id');
  				 }
	  		});
		}
		
		//查询岗位列表
		function _g_post_query() {
	    	var params = {
	    			hotkey : _hotkey.getValue(),
	  				cascade : _cascade.getValue()
	  			};
	    	var record = AOS.selectone(_t_org);
			if(!AOS.empty(record)){
				params.org_id_ = record.raw.id;
			}else{
				params.org_id_ = '${dept_.id_}';
			}
			_g_post_store.getProxy().extraParams = params;
			_g_post_store.loadPage(1);
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
				node : refreshnode,
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
		}
		
	    //弹出新增岗位窗口
		function _w_post_show(){
			AOS.reset(_f_post);
			var record = AOS.selectone(_t_org);
			if(!AOS.empty(record)){
		    	_f_post.down('[name=org_id_]').setValue(record.raw.id); 
		    	_f_post.down('[name=org_name_]').setValue(record.raw.text);
			} 
			_w_post.show();
		}
	    
		//新增岗位保存
		function _f_post_save(){
				AOS.ajax({
				forms : _f_post,
				url : 'savePost.jhtml',
				ok : function(data) {
					_w_post.hide();
					_g_post_store.reload();
					AOS.tip(data.appmsg);	
				}
			});
		}	
		
	    //弹出修改岗位窗口
		function _w_post_u_show(){
			AOS.reset(_f_post_u);
			var record = AOS.selectone(_g_post);
			if(record){
				_w_post_u.show();
				_f_post_u.loadRecord(record);
				_f_post_u.down('[name=org_id_]').setValue(record.data.org_id_);
				_f_post_u.down('[name=org_name_]').setValue(record.data.org_name_);
				_f_post_u.down('[name=old_org_id_]').setValue(record.data.org_id_); 
	     	}
		}
	    
	   //修改岗位保存
		function _f_post_u_save(){
			    var org_id_ = _f_post_u.down('[name=org_id_]').getValue();
			    var old_org_id_ = _f_post_u.down('[name=old_org_id_]').getValue();
			    if(org_id_ != old_org_id_){
			    	AOS.confirm('提示：修改岗位所属组织将清除岗位和用户的关联关系。<br><br>继续保存吗？', function(btn){
							if(btn === 'cancel'){
								AOS.tip('岗位修改操作被取消。');
							}else{
								_f_post_u_save2();
							}
						});
			    	}else{
			    		_f_post_u_save2();
			    	}
		}
	   
	   //修改岗位保存
	   function _f_post_u_save2(){
				AOS.ajax({
					forms : _f_post_u,
					url : 'updatePost.jhtml',
					ok : function(data) {
						_w_post_u.hide();
						_g_post_store.reload();
						AOS.tip(data.appmsg);							
					}
				}); 
	   }
	   
        //删除岗位
	 	function _g_post_del(){
	 				var selection = AOS.selection(_g_post, 'id_');
	 				if(AOS.empty(selection)){
	 					AOS.tip('删除前请先选中数据。');
	 					return;
	 				}
	 				var rows = AOS.rows(_g_post);
	 				var msg =  AOS.merge('确认要删除选中的[{0}]个岗位吗？', rows);
	 				AOS.confirm(msg, function(btn){
	 					if(btn === 'cancel'){
	 						AOS.tip('删除操作被取消。');
	 						return;
	 					}
	 					AOS.ajax({
	 						url : 'deletePost.jhtml',
	 						params:{
	 							aos_rows_: selection
	 						},
	 						ok : function(data) {
	 							AOS.tip(data.appmsg);
	 							_g_post_store.reload();
	 						}
	 					});
	 				});
	 			}
    	
    	//批量更新岗位当前状态
    	function _fn_updateStatus(status_){
 		        var rows = AOS.rows(_g_post);
 		        if(rows === 0){
 		        	AOS.tip('请先选择要操作的岗位。');
	 				return;
 		        }
 				var msg =  AOS.merge('确认要停用选中的[{0}]个岗位吗？', rows);
 				if(status_ === 1){
 					msg =  AOS.merge('确认要启用选中的[{0}]个岗位吗？', rows);
 				}
 				var selection = AOS.selection(_g_post, 'id_');
 				AOS.confirm(msg, function(btn){
	 					if(btn === 'cancel'){
	 						AOS.tip('操作被取消。');
	 						return;
	 					}
	 	 				AOS.ajax({
	 	  				params:{
	 	  					status_:status_,
	 	  					aos_rows_: selection
	 	  				},
	 	  				url : 'updateStatus.jhtml',
	 	  				ok : function(data) {
	 	  					_g_post_store.reload();
	 	  					AOS.tip(data.appmsg);							
	 	  				 }
	 	  			     });
 				});   		
    	}
    	
    	//弹出批量修改所属组织窗口
    	function _w_postorg_show(){
    		AOS.reset(_f_postorg);
	        var rows = AOS.rows(_g_post);
		        if(rows === 0){
		        	AOS.tip('请先选择要操作的岗位。');
 				return;
		        }
		    var selection = AOS.selection(_g_post, 'id_');
		    _f_postorg.down('[name=aos_rows_]').setValue(selection); 
    		_w_postorg.show();
    	}
    	
    	//批量修改岗位所属组织
    	function _f_postorg_save(){
    		if(!AOS.getValueid(_f_postorg)) return;
    		var rows = AOS.rows(_g_post);
    		var msg =  AOS.merge('提示：修改岗位所属组织将清除所选[{0}]个岗位和用户的关联关系。<br><br>继续保存吗？', rows);
	    	AOS.confirm(msg, function(btn){
				if(btn === 'cancel'){
					AOS.tip('操作被取消。');
					return;
				 }
	             AOS.ajax({
	  				forms : _f_postorg,
	  				url : 'updatePostOrg.jhtml',
	  				ok : function(data) {
	  					_w_postorg.hide();
	  					_g_post_store.reload();
	  					AOS.tip(data.appmsg);							
	  				 }
	  		     });   					
	    	 });   		
    	}
		</script>
</aos:onready>
</aos:html>
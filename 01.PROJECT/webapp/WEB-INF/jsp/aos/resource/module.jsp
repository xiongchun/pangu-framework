<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="功能模块">
	<aos:include lib="ext" />
	<aos:base href="system/module" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_module" region="west" bodyBorder="0 1 0 0" width="260" singleClick="false" rootVisible="false"
			onitemclick="_g_module_query" url="listModuleTree.jhtml" nodeParam="parent_id_" rootId="p">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="功能模块菜单树" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="级联显示菜单" id="_cascade" name="cascade" onchang="_g_module_query" checked="false" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增功能模块" onclick="_w_module_show" icon="add.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="_t_module_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_module" url="listModules.jhtml" region="center" hidePagebar="true" bodyBorder="1 0 0 0"
			forceFit="false" onrender="_g_module_query" onitemdblclick="_w_module_u_show">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="新增" tooltip="新增功能模块" onclick="_w_module_show" icon="add.png" />
				<aos:dockeditem text="修改" tooltip="修改功能模块" onclick="_w_module_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" tooltip="删除功能模块" onclick="_g_module_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="功能模块名称" name="name_" id="_name_" onenterkey="_g_module_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_module_query" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增功能模块" onclick="_w_module_show" icon="add.png" />
				<aos:menuitem text="修改功能模块" onclick="_w_module_u_show" icon="edit.png" />
				<aos:menuitem text="删除功能模块" onclick="_g_module_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_module_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="菜单流水号" dataIndex="id_" hidden="true" />
			<aos:column header="父节点流水号" dataIndex="parent_id_" hidden="true" />
			<aos:column header="节点语义ID" dataIndex="cascade_id_" hidden="true" />
			<aos:column header="功能模块菜单" dataIndex="name_" width="180" celltip="true" />
			<aos:column header="主页面URL" dataIndex="url_" width="250" celltip="true" />
			<aos:column header="自动展开" dataIndex="is_auto_expand_" rendererField="bool_" width="80" />
			<aos:column header="排序号" dataIndex="sort_no_" width="60" />
			<aos:column header="节点图标" dataIndex="icon_name_" width="120" />
			<aos:column header="矢量图标" dataIndex="vector_" width="120" />
			<aos:column header="热键" dataIndex="hotkey_" />
			<aos:column header="叶子节点" dataIndex="is_leaf_" rendererField="bool_" width="80" />
			<aos:column header="当前状态" dataIndex="status_" width="80" rendererField="enabled_" />
			<aos:column header="上级功能模块菜单" dataIndex="parent_name_" width="180" celltip="true" />
		</aos:gridpanel>
	</aos:viewport>
	<aos:window id="_w_module_find" title="上级菜单[双击选择]" height="-10" layout="fit" autoScroll="true"
		onshow="_t_module_find_refresh">
		<aos:treepanel id="_t_module_find" singleClick="false" width="320" bodyBorder="0 0 0 0" url="listModuleTree.jhtml"
			nodeParam="parent_id_" rootId="2a4c060f44d944ea926fe44522ce7b39" rootVisible="true" rootExpanded="false" rootText="${_root.name_}"
			rootIcon="${_root.icon_name_}" onitemdblclick="_t_module_find_select">
			<aos:menu>
				<aos:menuitem text="选择" icon="ok1.png" onclick="_t_module_find_select" />
				<aos:menuitem text="刷新" onclick="_t_module_find_refresh" icon="refresh1.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="关闭" onclick="#_w_module_find.hide();" icon="del.png" />
			</aos:menu>
		</aos:treepanel>
	</aos:window>
	<aos:window id="_w_module" title="新增功能模块菜单">
		<aos:formpanel id="_f_module" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="parent_id_" />
			<aos:triggerfield fieldLabel="上级菜单" name="parent_id_desc" allowBlank="false" editable="false"
				onfocus="_w_module_find_show" trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_module_find_show" />
			<aos:textfield name="name_" fieldLabel="菜单名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="hotkey_" fieldLabel="热键" maxLength="50" />
			<aos:textfield name="url_" fieldLabel="主页面URL" maxLength="100" />
			<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" allowBlank="false" value="0" dicField="bool_" />
			<aos:combobox name="status_" fieldLabel="当前状态" allowBlank="false" value="1" dicField="enabled_" />
			<aos:textfield name="icon_name_" fieldLabel="节点图标" maxLength="50" />
			<aos:textfield name="vector_" fieldLabel="矢量图标" maxLength="50" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minWidth="0" maxValue="99999999" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_module_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_module.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_module_u" title="修改功能模块菜单">
		<aos:formpanel id="_f_module_u" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="id_" fieldLabel="菜单流水号" />
			<aos:hiddenfield name="parent_id_" />
			<aos:triggerfield fieldLabel="上级菜单" name="parent_id_desc" allowBlank="false" editable="false"
				onfocus="_w_module_find_show" trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_module_find_show" />
			<aos:textfield name="name_" fieldLabel="菜单名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="hotkey_" fieldLabel="热键" maxLength="50" />
			<aos:textfield name="url_" fieldLabel="主页面URL" maxLength="100" />
			<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" allowBlank="false" value="0" dicField="bool_" />
			<aos:combobox name="status_" fieldLabel="当前状态" allowBlank="false" value="1" dicField="enabled_" />
			<aos:textfield name="icon_name_" fieldLabel="节点图标" maxLength="50" />
			<aos:textfield name="vector_" fieldLabel="矢量图标" maxLength="50" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minWidth="0" maxValue="99999999" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_module_u_update" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_module_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">
			//弹出选择上级菜单窗口：新增
			function _w_module_find_show(){
				_w_module_find.show();
			}
		    
		    //刷新上级组织树
		    function _t_module_find_refresh(){
				var refreshnode = AOS.selectone(_t_module_find);
				if (!refreshnode) {
					refreshnode = _t_module_find.getRootNode();
				}
				if (refreshnode.isLeaf()) {
					refreshnode = refreshnode.parentNode;
				}
				_t_module_find_store.load({
					node : refreshnode,
					callback : function() {
						//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
						refreshnode.collapse();
						refreshnode.expand();
					}
				});
		    }
		    
		    //上级菜单节点选择事件
		    function _t_module_find_select(){
		    	var record = AOS.selectone(_t_module_find);
		    	if(_w_module.isVisible()){
		    		//新增窗口
					_f_module.down('[name=parent_id_]').setValue(record.raw.id); 
					_f_module.down('[name=parent_id_desc]').setValue(record.raw.text);
		    	}else{
		    		//修改窗口
		    		_f_module_u.down('[name=parent_id_]').setValue(record.raw.id); 
		    		_f_module_u.down('[name=parent_id_desc]').setValue(record.raw.text);
		    	}
				_w_module_find.hide();
		    }
			
			//查询菜单树列表
			function _g_module_query() {
				var params = {
					name_ : _name_.getValue(),
					cascade : _cascade.getValue()
				};
				var record = AOS.selectone(_t_module);
				if(!AOS.empty(record)){
					params.id_ = record.raw.id;
					params.cascade_id_ = record.raw.cascade_id_;
				}else{
					//页面初始化第一次查询
					params.cascade = 'true';
				}
				_g_module_store.getProxy().extraParams = params;
				_g_module_store.loadPage(1,{
				    callback : function(a) {
				    	if(!AOS.empty(record)){
				    		   var g_record = _g_module_store.find('id_', record.data.id);
								_g_module.getSelectionModel().select(g_record);
							}
			           }
				});
			}
			
			//刷新菜单树
			function _t_module_refresh(root) {
				var refreshnode = AOS.selectone(_t_module);
				if (!refreshnode) {
					refreshnode = _t_module.getRootNode();
				}
				if (refreshnode.isLeaf()) {
					refreshnode = refreshnode.parentNode;
				}
				if(root){
					refreshnode = _t_module.getRootNode();
				}
				var params = {
				};
				_t_module_store.getProxy().extraParams = params;
				_t_module_store.load({
					node : refreshnode,
					callback : function() {
						//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
						refreshnode.collapse();
						refreshnode.expand();
						//如果刷新节点的子节点为空，则矫正节点再刷新其父节点
						if(!refreshnode.hasChildNodes()){
							_t_module_refresh2(refreshnode.parentNode);
						}
					}
				});
			}
			
			//刷新菜单树供回调使用
			function _t_module_refresh2(refreshnode) {
				_t_module_store.load({
					node : refreshnode,
					callback : function() {
						refreshnode.collapse();
						refreshnode.expand();
					}
				});
			}
			
			//弹出新增功能模块菜单
			function _w_module_show(){
				AOS.reset(_f_module);
 				var record = AOS.selectone(_t_module);
				if(!AOS.empty(record)){
					_f_module.down('[name=parent_id_]').setValue(record.raw.id); 
 					_f_module.down('[name=parent_id_desc]').setValue(record.raw.text);
				} 
				_w_module.show();
			}
			
		    //弹出修改功能模块菜单窗口
			function _w_module_u_show(){
				AOS.reset(_f_module_u);
 				var record = AOS.selectone(_g_module);
 				if(record){
 					_w_module_u.show();
 	 				_f_module_u.loadRecord(record);
 	 				_f_module_u.down('[name=parent_id_]').setValue(record.data.parent_id_);
 	 				_f_module_u.down('[name=parent_id_desc]').setValue(record.data.parent_name_);
 	 			    //根节点不允许修改上级节点字段
 	 				if(record.data.cascade_id_ === '0'){
 	 					AOS.reads(_f_module_u, 'parent_id_');
 	 				}else{
 	 					AOS.edits(_f_module_u, 'parent_id_');
 	 				}
				}
			}
			
			//新增功能模块保存
			function _f_module_save(){
 				AOS.ajax({
					forms : _f_module,
					url : 'saveModule.jhtml',
					ok : function(data) {
						_w_module.hide();
						_g_module_store.reload();
						_t_module_refresh();
						AOS.tip(data.appmsg);	
					}
				});
			}
			
		   //修改功能模块保存
			function _f_module_u_update(){
 				AOS.ajax({
					forms : _f_module_u,
					url : 'updateModule.jhtml',
					ok : function(data) {
						AOS.tip(data.appmsg);	
						_w_module_u.hide();
						_t_module_refresh();
						_g_module_store.reload();
					}
				});
			}
		   
	    //删除功能模块菜单
		function _g_module_del(){
			var rows = AOS.rows(_g_module);
			if(rows === 0){
				AOS.tip('删除前请先选中数据。');
				return;
			}
			var msg =  AOS.merge('确认要删除选中的[{0}]个功能模块菜单数据吗？', rows);
			AOS.confirm(msg, function(btn){
				if(btn === 'cancel'){
					AOS.tip('删除操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'deleteModule.jhtml',
					params:{
						aos_rows_:  AOS.selection(_g_module, 'id_')
					},
					ok : function(data) {
						if(data.appcode === -1){
							AOS.err(data.appmsg);
							return ;
						}
						AOS.tip(data.appmsg);
						_g_module_store.reload();
						_t_module_refresh();
					}
				});
			});
			}
    </script>
</aos:onready>
</aos:html>
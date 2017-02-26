<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="资源管理" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_module" region="west" bodyBorder="0 1 0 0" width="250" rootText="${rootPO.name_}"
			singleClick="false" url="moduleService.getTreeData" nodeParam="parent_id_" rootId="${rootPO.id_}"
			onitemclick="_g_module_query" rootIcon="${rootPO.icon_name_}" rootAttribute="a:'${rootPO.cascade_id_}'">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="功能模块树" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="级联显示" id="id_cascade" onchang="_g_module_query" checked="false" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增模块" onclick="_w_module_show" icon="add.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="_t_module_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_module" url="moduleService.listModules" region="center" onitemdblclick="_w_module_u_show"
			onrender="_g_module_query" bodyBorder="1 0 1 0">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="新增" onclick="_w_module_show" icon="add.png" />
				<aos:dockeditem text="修改" onclick="_w_module_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" onclick="_g_module_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="模块名称" id="id_name_" onenterkey="_g_module_query" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="_g_module_query" width="180" />
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
			<aos:column header="流水号" dataIndex="id_" fixedWidth="150" hidden="true" />
			<aos:column header="上级模块流水号" dataIndex="parent_id_" fixedWidth="150" hidden="true" />
			<aos:column header="节点语义ID" dataIndex="cascade_id_" fixedWidth="150" hidden="true" />
			<aos:column header="模块名称" dataIndex="name_" fixedWidth="180" celltip="true" />
			<aos:column header="请求地址" dataIndex="url_" width="250" celltip="true" />
			<aos:column header="排序号" dataIndex="sort_no_" fixedWidth="60" />
			<aos:column header="图标" dataIndex="icon_name_" fixedWidth="120" />
			<aos:column header="矢量图标" dataIndex="vector_" fixedWidth="120" />
			<aos:column header="叶子节点" dataIndex="is_leaf_" rendererField="is_" fixedWidth="80" />
			<aos:column header="自动展开" dataIndex="is_auto_expand_" rendererField="is_" fixedWidth="80" />
			<aos:column header="是否启用" dataIndex="is_enable_" rendererField="is_" fixedWidth="80" />
		</aos:gridpanel>
	</aos:viewport>

	<aos:window id="_w_module" title="新增功能模块">
		<aos:formpanel id="_f_module" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="parent_id_" fieldLabel="上级模块流水号" />
			<aos:textfield name="parent_name_" fieldLabel="上级模块" allowBlank="false" readOnly="true" />
			<aos:textfield name="name_" fieldLabel="模块名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="url_" fieldLabel="请求地址" maxLength="100" />
			<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" allowBlank="false" value="0" dicField="is_" />
			<aos:textfield name="icon_name_" fieldLabel="图标" maxLength="50" />
			<aos:textfield name="vector_" fieldLabel="矢量图标" maxLength="50" />
			<aos:combobox name="is_enable_" fieldLabel="是否启用" allowBlank="false" value="1" dicField="is_" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="10" minWidth="0" maxValue="99999999" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_module_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_module.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_module_u" title="修改功能模块">
		<aos:formpanel id="_f_module_u" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="id_" fieldLabel="模块流水号" />
			<aos:hiddenfield name="parent_id_" fieldLabel="上级模块模块流水号" />
			<aos:textfield name="name_" fieldLabel="模块名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="url_" fieldLabel="请求地址" maxLength="100" />
			<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" allowBlank="false" value="0" dicField="is_" />
			<aos:textfield name="icon_name_" fieldLabel="图标" maxLength="50" />
			<aos:textfield name="vector_" fieldLabel="矢量图标" maxLength="50" />
			<aos:combobox name="is_enable_" fieldLabel="是否启用" allowBlank="false" value="1" dicField="is_" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minWidth="0" maxValue="99999999" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_module_u_update" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_module_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<script type="text/javascript">
	
	    //模块查询
		function _g_module_query() {
			var params = {
				name_ : id_name_.getValue(),
				cascade_ : id_cascade.getValue()
			};
			var record = AOS.selectone(_t_module);
			if(!AOS.empty(record)){
				params.id_ = record.raw.id;
				params.cascade_id_ = record.raw.a;
			}
			_g_module_store.getProxy().extraParams = params;
			_g_module_store.loadPage(1);
		}
		
		//自动选中根节点
		AOS.job(function(){
			_t_module.getSelectionModel().select(_t_module.getRootNode());
			_g_module_query();
		},10);
	
		//弹出新增功能模块菜单
		function _w_module_show(){
			AOS.reset(_f_module);
			var record = AOS.selectone(_t_module);
			if(!AOS.empty(record)){
				AOS.setValue('_f_module.parent_id_',record.raw.id); 
				AOS.setValue('_f_module.parent_name_',record.raw.text); 
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
			   }
		}
	    
		//新增功能模块保存
		function _f_module_save(){
				AOS.ajax({
				forms : _f_module,
				url : 'moduleService.saveModule',
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
				url : 'moduleService.updateModule',
				ok : function(data) {
					AOS.tip(data.appmsg);	
					_w_module_u.hide();
					_t_module_refresh('parent');
					_g_module_store.reload();
					if(AOS.getValue('_f_module_u.parent_id_') == '0'){
						_t_module.getRootNode().set('text',AOS.getValue('_f_module_u.name_'));
					}
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
					url : 'moduleService.deleteModule',
					params:{
						aos_rows_:  AOS.selection(_g_module, 'id_')
					},
					ok : function(data) {
						if(data.appcode == '1'){
							AOS.tip(data.appmsg);
							_g_module_store.reload();
							_t_module_refresh('root');
						}else{
							AOS.err(data.appmsg);
						}
					}
				});
			});
			}
	    
		//刷新菜单树  flag:parent 刷新父节点；root：刷新根节点
		function _t_module_refresh(flag) {
			var refreshnode = AOS.selectone(_t_module);
			if (!refreshnode) {
				refreshnode = _t_module.getRootNode();
			}
			if (refreshnode.isLeaf() || (flag=='parent' && !refreshnode.isRoot())) {
				refreshnode = refreshnode.parentNode;
			}
			//参数标记为刷新根节点
			if(flag == 'root'){
				refreshnode = _t_module.getRootNode();
			}
			_t_module_store.load({
				node : refreshnode,
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
					_t_module.getSelectionModel().select(refreshnode);
				}
			});
		}

	</script>
</aos:onready>

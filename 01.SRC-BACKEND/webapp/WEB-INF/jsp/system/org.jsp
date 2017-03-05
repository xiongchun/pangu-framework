<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="部门管理" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_org" region="west" bodyBorder="0 1 0 0" width="250" singleClick="false"
			onitemclick="_g_org_query" url="orgService.getTreeData" nodeParam="parent_id_" rootId="${rootPO.id_}"
			rootText="${rootPO.name_}" rootVisible="true" rootIcon="${rootPO.icon_name_}"
			rootAttribute="cascade_id_:'${rootPO.cascade_id_}'">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="组织部门树" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="级联显示" id="id_cascade_" onchange="_g_org_query" checked="false" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增部门" onclick="_w_org_show" icon="add.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="_t_org_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_org" url="orgService.listOrgs" region="center" bodyBorder="1 0 1 0"
			onitemdblclick="_w_org_u_show">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="新增" onclick="_w_org_show" icon="add.png" />
				<aos:dockeditem text="修改" onclick="_w_org_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" onclick="_g_org_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="部门名称" id="id_name_" onenterkey="_g_org_query" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="_g_org_query" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="新增部门" onclick="_w_org_show" icon="add.png" />
				<aos:menuitem text="修改部门" onclick="_w_org_u_show" icon="edit.png" />
				<aos:menuitem text="删除部门" onclick="_g_org_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_org_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" fixedWidth="150" hidden="true" />
			<aos:column header="上级部门流水号" dataIndex="parent_id_" fixedWidth="150" hidden="true" />
			<aos:column header="节点语义ID" dataIndex="cascade_id_" fixedWidth="150" hidden="true" />
			<aos:column header="部门名称" dataIndex="name_" fixedWidth="200" />
			<aos:column header="排序号" dataIndex="sort_no_" fixedWidth="60" />
			<aos:column header="图标" dataIndex="icon_name_" fixedWidth="150" />
			<aos:column header="热键" dataIndex="hotkey_" fixedWidth="100" />
			<aos:column header="热键" dataIndex="hotkey_" hidden="true" />
			<aos:column header="自动展开" dataIndex="is_auto_expand_" rendererField="is_" fixedWidth="80" />
			<aos:column header="叶子节点" dataIndex="is_leaf_" rendererField="is_" fixedWidth="80" />
			<aos:column header="部门类型" dataIndex="type_" rendererField="org_type_" fixedWidth="80" />
			<aos:column header="扩展码" dataIndex="biz_code_" fixedWidth="150" />
			<aos:column header="备注" dataIndex="remark_" celltip="true" />
		</aos:gridpanel>
	</aos:viewport>

	<aos:window id="_w_org" title="新增部门">
		<aos:formpanel id="_f_org" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="parent_id_" fieldLabel="上级部门流水号" />
			<aos:textfield name="parent_name_" fieldLabel="上级部门" allowBlank="false" readOnly="true" />
			<aos:textfield name="name_" fieldLabel="部门名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="hotkey_" fieldLabel="热键" maxLength="50" />
			<aos:combobox name="type_" fieldLabel="部门类型" allowBlank="false" dicField="org_type_" value="1" emptyText="请选择..." />
			<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" allowBlank="false" value="0" dicField="is_" />
			<aos:textfield name="icon_name_" fieldLabel="图标" maxLength="50" />
			<aos:textfield name="biz_code_" fieldLabel="扩展码" maxLength="50" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minWidth="0" maxValue="9999" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="500" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_org_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_org.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_org_u" title="修改部门">
		<aos:formpanel id="_f_org_u" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield fieldLabel="部门流水号" name="id_" />
			<aos:hiddenfield fieldLabel="上级部门流水号" name="parent_id_" />
			<aos:textfield name="name_" fieldLabel="部门名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="hotkey_" fieldLabel="热键" maxLength="50" />
			<aos:combobox name="type_" fieldLabel="部门类型" allowBlank="false" dicField="org_type_" value="1" emptyText="请选择..." />
			<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" allowBlank="false" value="0" dicField="is_" />
			<aos:textfield name="icon_name_" fieldLabel="图标" maxLength="50" />
			<aos:textfield name="biz_code_" fieldLabel="业务对照码" maxLength="50" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minWidth="0" maxValue="9999" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="500" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_org_u_update" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_org_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<script type="text/javascript">
	
		//查询部门列表
		function _g_org_query() {
			var params = {
				name_ : id_name_.getValue(),
				cascade_ : id_cascade_.getValue()
			};
			var record = AOS.selectone(_t_org);
			if(!AOS.empty(record)){
				params.id_ = record.raw.id;
				params.cascade_id_ = record.raw.a;
			}
			_g_org_store.getProxy().extraParams = params;
			_g_org_store.loadPage(1);
		}
		
		//自动选中根节点
		AOS.job(function(){
			_t_org.getSelectionModel().select(_t_org.getRootNode());
			_g_org_query();
		},10);
		
		//刷新部门树  flag:parent 刷新父节点；root：刷新根节点
		function _t_org_refresh(flag) {
			var refreshnode = AOS.selectone(_t_org);
			if (!refreshnode) {
				refreshnode = _t_org.getRootNode();
			}
			if (refreshnode.isLeaf() || (flag=='parent' && !refreshnode.isRoot())) {
				refreshnode = refreshnode.parentNode;
			}
			//参数标记为刷新根节点
			if(flag == 'root'){
				refreshnode = _t_org.getRootNode();
			}
			_t_org_store.load({
				node : refreshnode,
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
					_t_org.getSelectionModel().select(refreshnode);
				}
			});
		}

	    //弹出新增部门窗口
		function _w_org_show(){
			AOS.reset(_f_org);
			var record = AOS.selectone(_t_org);
			if(!AOS.empty(record)){
				AOS.setValue('_f_org.parent_id_', record.raw.id); 
				AOS.setValue('_f_org.parent_name_', record.raw.text); 
			} 
			_w_org.show();
		}
	    
		//新增部门保存
		function _f_org_save(){
				AOS.ajax({
					forms : _f_org,
					url : 'orgService.saveOrg',
					ok : function(data) {
						_w_org.hide();
						_g_org_store.reload();
						_t_org_refresh();
						AOS.tip(data.appmsg);	
					}
			});
		}	
	
	    //弹出修改部门窗口
		function _w_org_u_show(){
			AOS.reset(_f_org_u);
			var record = AOS.selectone(_g_org);
			if(record){
				_w_org_u.show();
				_f_org_u.loadRecord(record);
	     	}
		}	
	
		//修改部门保存
		function _f_org_u_update(){
				AOS.ajax({
				forms : _f_org_u,
				url : 'orgService.updateOrg',
				ok : function(data) {
					AOS.tip(data.appmsg);	
					_w_org_u.hide();
					_t_org_refresh('parent');
					_g_org_store.reload();
					if(AOS.getValue('_f_org_u.parent_id_') == '0'){
						_t_org.getRootNode().set('text',AOS.getValue('_f_org_u.name_'));
					}
				}
			});
		}	
	   
        //删除部门
	 	function _g_org_del(){
	 				var selection = AOS.selection(_g_org, 'id_');
	 				if(AOS.empty(selection)){
	 					AOS.tip('删除前请先选中数据。');
	 					return;
	 				}
	 				var rows = AOS.rows(_g_org);
	 				var msg =  AOS.merge('确认要删除选中的{0}个部门及其可能包含的子部门吗？', rows);
	 				AOS.confirm(msg, function(btn){
	 					if(btn === 'cancel'){
	 						AOS.tip('删除操作被取消。');
	 						return;
	 					}
	 					AOS.ajax({
	 						url : 'orgService.deleteOrg',
	 						params:{
	 							aos_rows_: selection
	 						},
	 						ok : function(data) {
	 							if(data.appcode == '1'){
	 								AOS.tip(data.appmsg);
	 								_g_org_store.reload();
	 								_t_org_refresh('root');
	 							}else{
	 								AOS.err(data.appmsg);
	 							}
	 						}
	 					});
	 				});
	 			}
	   
		</script>
</aos:onready>

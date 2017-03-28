<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="部门管理" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="t_org" region="west" bodyBorder="0 1 0 0" width="250" singleClick="false"
			onitemclick="g_org_query" url="orgService.getTreeData" nodeParam="parent_id" rootId="${rootPO.id}"
			rootText="${rootPO.name}" rootVisible="true" rootIcon="${rootPO.icon_name}"
			rootAttribute="a:'${rootPO.cascade_id}'">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="组织部门树" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="级联显示" id="id_cascade" onchange="g_org_query" checked="false" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增部门" onclick="w_org_show" icon="add.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="t_org_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="g_org" url="orgService.listOrgs" region="center" bodyBorder="1 0 1 0"
			onitemdblclick="w_org_u_show">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="新增" onclick="w_org_show" icon="add.png" />
				<aos:dockeditem text="修改" onclick="w_org_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" onclick="g_org_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="部门名称" id="id_name" onenterkey="g_org_query" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="g_org_query" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="新增部门" onclick="w_org_show" icon="add.png" />
				<aos:menuitem text="修改部门" onclick="w_org_u_show" icon="edit.png" />
				<aos:menuitem text="删除部门" onclick="g_org_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#g_org_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id" fixedWidth="150" hidden="true" />
			<aos:column header="上级部门流水号" dataIndex="parent_id" fixedWidth="150" hidden="true" />
			<aos:column header="节点语义ID" dataIndex="cascade_id" fixedWidth="150" hidden="true" />
			<aos:column header="部门名称" dataIndex="name" fixedWidth="200" />
			<aos:column header="排序号" dataIndex="sort_no" fixedWidth="60" />
			<aos:column header="图标" dataIndex="icon_name" fixedWidth="150" />
			<aos:column header="热键" dataIndex="hotkey" hidden="true" />
			<aos:column header="自动展开" dataIndex="is_auto_expand" rendererField="is" fixedWidth="80" />
			<aos:column header="叶子节点" dataIndex="is_leaf" rendererField="is" fixedWidth="80" />
			<aos:column header="部门类型" dataIndex="type" rendererField="org_type" fixedWidth="80" />
			<aos:column header="扩展码" dataIndex="biz_code" fixedWidth="150" />
			<aos:column header="备注" dataIndex="remark" celltip="true" />
		</aos:gridpanel>
	</aos:viewport>

	<aos:window id="w_org" title="新增部门">
		<aos:formpanel id="f_org" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="parent_id" fieldLabel="上级部门流水号" />
			<aos:textfield name="parent_name" fieldLabel="上级部门" allowBlank="false" readOnly="true" />
			<aos:textfield name="name" fieldLabel="部门名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="hotkey" fieldLabel="热键" maxLength="50" />
			<aos:combobox name="type" fieldLabel="部门类型" allowBlank="false" dicField="org_type" value="1" emptyText="请选择..." />
			<aos:combobox name="is_auto_expand" fieldLabel="自动展开" allowBlank="false" value="0" dicField="is" />
			<aos:textfield name="icon_name" fieldLabel="图标" maxLength="50" />
			<aos:textfield name="biz_code" fieldLabel="扩展码" maxLength="50" />
			<aos:numberfield name="sort_no" fieldLabel="排序号" value="1" minWidth="0" maxValue="9999" />
			<aos:textareafield name="remark" fieldLabel="备注" maxLength="500" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="f_org_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#w_org.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="w_org_u" title="修改部门">
		<aos:formpanel id="f_org_u" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield fieldLabel="部门流水号" name="id" />
			<aos:hiddenfield fieldLabel="上级部门流水号" name="parent_id" />
			<aos:textfield name="name" fieldLabel="部门名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="hotkey" fieldLabel="热键" maxLength="50" />
			<aos:combobox name="type" fieldLabel="部门类型" allowBlank="false" dicField="org_type" value="1" emptyText="请选择..." />
			<aos:combobox name="is_auto_expand" fieldLabel="自动展开" allowBlank="false" value="0" dicField="is" />
			<aos:textfield name="icon_name" fieldLabel="图标" maxLength="50" />
			<aos:textfield name="biz_code" fieldLabel="业务对照码" maxLength="50" />
			<aos:numberfield name="sort_no" fieldLabel="排序号" value="1" minWidth="0" maxValue="9999" />
			<aos:textareafield name="remark" fieldLabel="备注" maxLength="500" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="f_org_u_update" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#w_org_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<script type="text/javascript">
	
		//查询部门列表
		function g_org_query() {
			var params = {
				name : id_name.getValue(),
				cascade : id_cascade.getValue()
			};
			var record = AOS.selectone(t_org);
			if(!AOS.empty(record)){
				params.id = record.raw.id;
				params.cascade_id = record.raw.a;
			}
			g_org_store.getProxy().extraParams = params;
			g_org_store.loadPage(1);
		}
		
		//自动选中根节点
		AOS.job(function(){
			t_org.getSelectionModel().select(t_org.getRootNode());
			g_org_query();
		},10);
		
		//刷新部门树  flag:parent 刷新父节点；root：刷新根节点
		function t_org_refresh(flag) {
			var refreshnode = AOS.selectone(t_org);
			if (!refreshnode) {
				refreshnode = t_org.getRootNode();
			}
			if (refreshnode.isLeaf() || (flag=='parent' && !refreshnode.isRoot())) {
				refreshnode = refreshnode.parentNode;
			}
			//参数标记为刷新根节点
			if(flag == 'root'){
				refreshnode = t_org.getRootNode();
			}
			t_org_store.load({
				node : refreshnode,
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
					t_org.getSelectionModel().select(refreshnode);
				}
			});
		}

	    //弹出新增部门窗口
		function w_org_show(){
			AOS.reset(f_org);
			var record = AOS.selectone(t_org);
			if(!AOS.empty(record)){
				AOS.setValue('f_org.parent_id', record.raw.id); 
				AOS.setValue('f_org.parent_name', record.raw.text); 
			} 
			w_org.show();
		}
	    
		//新增部门保存
		function f_org_save(){
				AOS.ajax({
					forms : f_org,
					url : 'orgService.saveOrg',
					ok : function(data) {
						w_org.hide();
						g_org_store.reload();
						t_org_refresh();
						AOS.tip(data.appmsg);	
					}
			});
		}	
	
	    //弹出修改部门窗口
		function w_org_u_show(){
			AOS.reset(f_org_u);
			var record = AOS.selectone(g_org);
			if(record){
				w_org_u.show();
				f_org_u.loadRecord(record);
	     	}
		}	
	
		//修改部门保存
		function f_org_u_update(){
				AOS.ajax({
				forms : f_org_u,
				url : 'orgService.updateOrg',
				ok : function(data) {
					AOS.tip(data.appmsg);	
					w_org_u.hide();
					t_org_refresh('parent');
					g_org_store.reload();
					if(AOS.getValue('f_org_u.parent_id') == '0'){
						t_org.getRootNode().set('text',AOS.getValue('f_org_u.name'));
					}
				}
			});
		}	
	   
        //删除部门
	 	function g_org_del(){
	 				var selection = AOS.selection(g_org, 'id');
	 				if(AOS.empty(selection)){
	 					AOS.tip('删除前请先选中数据。');
	 					return;
	 				}
	 				var rows = AOS.rows(g_org);
	 				var msg =  AOS.merge('确认要删除选中的{0}个部门及其可能包含的子部门吗？', rows);
	 				AOS.confirm(msg, function(btn){
	 					if(btn === 'cancel'){
	 						AOS.tip('删除操作被取消。');
	 						return;
	 					}
	 					AOS.ajax({
	 						url : 'orgService.deleteOrg',
	 						params:{
	 							aos_rows: selection
	 						},
	 						ok : function(data) {
	 							if(data.appcode == '1'){
	 								AOS.tip(data.appmsg);
	 								g_org_store.reload();
	 								t_org_refresh('root');
	 							}else{
	 								AOS.err(data.appmsg);
	 							}
	 						}
	 					});
	 				});
	 			}
	   
		</script>
</aos:onready>

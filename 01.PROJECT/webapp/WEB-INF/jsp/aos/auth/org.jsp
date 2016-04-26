<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="组织架构">
	<aos:include lib="ext" />
	<aos:base href="system/org" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_org" region="west" bodyBorder="0 1 0 0" width="260" singleClick="false" onitemclick="_g_org_query"
			url="listOrgTree.jhtml" nodeParam="parent_id_" rootId="${dept_.id_}" rootText="${dept_.name_}" rootVisible="true"
			rootIcon="${dept_.icon_name_}" rootAttribute="cascade_id_:'${dept_.cascade_id_}'">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="组织架构树" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="级联显示组织" id="_cascade" name="cascade" onchang="_g_org_query" checked="false"  />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增组织" onclick="_w_org_show" icon="add.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem  text="刷新" onclick="_t_org_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_org" url="listOrgs.jhtml" autoLoad="true" region="center" onrender="_g_org_query" 
			bodyBorder="1 0 1 0" forceFit="false" onitemdblclick="_w_org_u_show" >
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="新增" tooltip="新增组织" onclick="_w_org_show" icon="add.png" />
				<aos:dockeditem text="修改" tooltip="修改组织" onclick="_w_org_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" tooltip="删除组织" onclick="_g_org_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="组织名称" name="name_" id="_name_" onenterkey="_g_org_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_org_query" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="新增组织" onclick="_w_org_show" icon="add.png" />
				<aos:menuitem text="修改组织" onclick="_w_org_u_show" icon="edit.png" />
				<aos:menuitem text="删除组织" onclick="_g_org_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_org_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="组织流水号" dataIndex="id_" hidden="true" />
			<aos:column header="上级组织流水号" dataIndex="parent_id_" hidden="true" />
			<aos:column header="节点语义ID" dataIndex="cascade_id_" hidden="true" />
			<aos:column header="组织名称" dataIndex="name_" width="220" />
			<aos:column header="组织类型" dataIndex="type_" rendererField="org_type_" />
			<aos:column header="排序号" dataIndex="sort_no_" width="60" />
			<aos:column header="上级组织" dataIndex="pareant_name_" celltip="true" width="200" />
			<aos:column header="业务对照码" dataIndex="biz_code_" />
			<aos:column header="热键" dataIndex="hotkey_" hidden="true" />
			<aos:column header="当前状态" dataIndex="status_" rendererField="enabled_" />
			<aos:column header="节点图标" dataIndex="icon_name_" />
			<aos:column header="叶子节点" dataIndex="is_leaf_" rendererField="bool_" width="80" hidden="true" />
			<aos:column header="自动展开" dataIndex="is_auto_expand_" rendererField="bool_" width="80" hidden="true" />
			<aos:column header="自定义扩展码" dataIndex="custom_code_" />
		</aos:gridpanel>
	</aos:viewport>
	<aos:window id="_w_org_find" title="上级组织[双击选择]" height="-10" layout="fit" autoScroll="true" onshow="_w_org_find_onshow">
		<aos:treepanel id="_t_org_find" singleClick="false" width="320" bodyBorder="0 0 0 0" url="listOrgTree.jhtml"
			nodeParam="parent_id_" rootId="${dept_.id_}" rootText="${dept_.name_}" rootVisible="true" rootIcon="${dept_.icon_name_}"
			rootExpanded="false" onitemdblclick="_t_org_find_select" >
			<aos:menu>
				<aos:menuitem text="选择" icon="ok1.png" onclick="_t_org_find_select" />
				<aos:menuitem  text="刷新" onclick="_t_org_find_refresh" icon="refresh1.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="关闭" onclick="#_w_org_find.hide();" icon="del.png" />
			</aos:menu>
		</aos:treepanel>
	</aos:window>
	<aos:window id="_w_org" title="新增组织">
		<aos:formpanel id="_f_org" width="400" layout="anchor" labelWidth="70">
			<aos:hiddenfield name="parent_id_" value="${dept_.id_}" />
			<aos:triggerfield fieldLabel="上级组织" name="parent_id__desc" value="${dept_.name_}" allowBlank="false" editable="false"
				onfocus="_w_org_find_show" trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_org_find_show" />
			<aos:textfield name="name_" fieldLabel="组织名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="hotkey_" fieldLabel="热键" maxLength="50" />
			<aos:textfield name="biz_code_" fieldLabel="业务对照码" maxLength="50" />
			<aos:combobox name="type_" fieldLabel="组织类型" allowBlank="false" dicField="org_type_" value="1" emptyText="请选择..." />
			<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" allowBlank="false" value="0" dicField="bool_" />
			<aos:combobox name="status_" fieldLabel="当前状态" allowBlank="false" value="1" dicField="enabled_" />
			<aos:textfield name="icon_name_" fieldLabel="节点图标" maxLength="50" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minWidth="0" maxValue="99999999" />
			<aos:textareafield name="custom_code_" fieldLabel="扩展码" maxLength="250" height="50" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_org_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_org.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_org_u" title="修改组织">
		<aos:formpanel id="_f_org_u" width="400" layout="anchor" labelWidth="70">
			<aos:hiddenfield fieldLabel="组织流水号" name="id_" />
			<aos:hiddenfield fieldLabel="上级组织流水号" name="parent_id_" />
			<aos:textfield name="pareant_name_" fieldLabel="上级组织" readOnly="true" />
			<aos:textfield name="name_" fieldLabel="组织名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="hotkey_" fieldLabel="热键" maxLength="50" />
			<aos:textfield name="biz_code_" fieldLabel="业务对照码" maxLength="50" />
			<aos:combobox name="type_" fieldLabel="组织类型" allowBlank="false" dicField="org_type_" value="1" emptyText="请选择..." />
			<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" allowBlank="false" value="0" dicField="bool_" />
			<aos:combobox name="status_" fieldLabel="当前状态" allowBlank="false" value="1" dicField="enabled_" />
			<aos:textfield name="icon_name_" fieldLabel="节点图标" maxLength="50" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minWidth="0" maxValue="99999999" />
			<aos:textareafield name="custom_code_" fieldLabel="扩展码" maxLength="250" height="50" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_org_u_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_org_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">
	    //弹出选择上级组织窗口
	    function _w_org_find_show(){
	    	 _w_org_find.show();
	    }
	    //监听上级组织选择窗口弹出事件
	    function _w_org_find_onshow(){
	    	//_t_org_find.getRootNode().expand();
	    	_t_org_find_refresh();
	    }
	    
	    //刷新上级组织树
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
	    
	    //上级组织树节点双击事件
	    function _t_org_find_select(){
	    	var record = AOS.selectone(_t_org_find);
			_f_org.down('[name=parent_id_]').setValue(record.raw.id); 
			_f_org.down('[name=parent_id__desc]').setValue(record.raw.text);
			_w_org_find.hide();
	    }
	    
		//查询组织列表
		function _g_org_query() {
			var params = {
				name_ : _name_.getValue(),
				cascade : _cascade.getValue()
			};
			var record = AOS.selectone(_t_org);
			if(!AOS.empty(record)){
				params.id_ = record.raw.id;
				params.cascade_id_ = record.raw.cascade_id_;
			}else{
				//页面初始化第一次查询
				params.cascade = 'true';
				params.id_ = '${dept_.id_}';
				params.cascade_id_ = '${dept_.cascade_id_}';				
			}
			_g_org_store.getProxy().extraParams = params;
			_g_org_store.loadPage(1,{
		    callback : function(a) {
		    	if(!AOS.empty(record)){
		    		   var g_record = _g_org_store.find('id_', record.data.id);
						_g_org.getSelectionModel().select(g_record);
					}
	           }
		    });
		}
		
	    //刷新组织树
		function _t_org_refresh(root) {
			var refreshnode = AOS.selectone(_t_org);
			if (!refreshnode) {
				refreshnode = _t_org.getRootNode();
			}
			if (refreshnode.isLeaf()) {
				refreshnode = refreshnode.parentNode;
			}
			if(root){
				refreshnode = _t_org.getRootNode();
			}
			var params = {
			};
			_t_org_store.getProxy().extraParams = params;
			_t_org_store.load({
				node : refreshnode,
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
		}
		
	    //弹出新增组织窗口
		function _w_org_show(){
			AOS.reset(_f_org);
			var record = AOS.selectone(_t_org);
			if(!AOS.empty(record)){
				_f_org.down('[name=parent_id_]').setValue(record.raw.id); 
				_f_org.down('[name=parent_id__desc]').setValue(record.raw.text);
			} 
			_w_org.show();
		}
	    
		//新增组织保存
		function _f_org_save(){
				AOS.ajax({
				forms : _f_org,
				url : 'saveOrg.jhtml',
				ok : function(data) {
					_w_org.hide();
					_g_org_store.reload();
					_t_org_refresh();
					AOS.tip(data.appmsg);	
				}
			});
		}	
		
	    //弹出修改组织窗口
		function _w_org_u_show(){
			AOS.reset(_f_org_u);
			var record = AOS.selectone(_g_org);
			if(record){
				_w_org_u.show();
				_f_org_u.loadRecord(record);
				_f_org_u.down('[name=parent_id_]').setValue(record.data.parent_id_);
				_f_org_u.down('[name=pareant_name_]').setRawValue(record.data.pareant_name_);
				//根节点不允许修改上级组织字段
				if(record.data.cascade_id_ === '0'){
						AOS.reads(_f_org_u, 'parent_id_');
				}else{
						AOS.edits(_f_org_u, 'parent_id_');
				}
	     	}
		}
	    
	   //修改组织保存
		function _f_org_u_save(){
			AOS.ajax({
				forms : _f_org_u,
				url : 'updateOrg.jhtml',
				ok : function(data) {
					AOS.tip(data.appmsg);	
					_w_org_u.hide();
					if(data.appcode === 1){
						//如果修改了上级组织，则刷新根节点。
						_t_org_refresh(true);
						var params = {
								cascade : _cascade.getValue(),
								cascade_id_:'0'
						};
						_g_org_store.getProxy().extraParams = params;
						_g_org_store.loadPage(1);
					}else{
						_t_org_refresh();
						_g_org_store.reload();
					}
				}
			}); 
		}
	   
        //删除组织
	 	function _g_org_del(){
	 				var selection = AOS.selection(_g_org, 'id_');
	 				if(AOS.empty(selection)){
	 					AOS.tip('删除前请先选中数据。');
	 					return;
	 				}
	 				var rows = AOS.rows(_g_org);
	 				var msg =  AOS.merge('确认要删除选中的{0}个组织及其可能包含的子组织吗？', rows);
	 				AOS.confirm(msg, function(btn){
	 					if(btn === 'cancel'){
	 						AOS.tip('删除操作被取消。');
	 						return;
	 					}
	 					AOS.ajax({
	 						url : 'deleteOrg.jhtml',
	 						params:{
	 							aos_rows_: selection
	 						},
	 						ok : function(data) {
	 							if(data.appcode === -1){
	 								AOS.err(data.appmsg);
	 								return ;
	 							}
	 							AOS.tip(data.appmsg);
	 							_g_org_store.reload();
	 							var refreshnode = _t_org_store.getById(data.nodeid);
	 							_t_org_store.load({
	 								node : refreshnode,
	 								callback : function() {
	 									//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
	 									refreshnode.collapse();
	 									refreshnode.expand();
	 								}
	 							});
	 						}
	 					});
	 				});
	 			}
	   
		</script>
</aos:onready>
</aos:html>
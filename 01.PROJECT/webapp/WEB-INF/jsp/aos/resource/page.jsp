<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="页面组件">
	<aos:include lib="ext" />
	<aos:base href="system/page" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_module" region="west" bodyBorder="0 1 0 0" width="260" singleClick="false" rootVisible="false"
			url="listModuleTree.jhtml" nodeParam="parent_id_" rootId="p" onitemclick="_t_module_click">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="功能模块菜单树" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增页面" onclick="_w_page_show" icon="add.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="_t_module_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:panel region="center" border="false">
			<aos:layout type="vbox" align="stretch" />
			<aos:gridpanel id="_g_page" url="listPages.jhtml" hidePagebar="true" flex="0.6" onrender="_g_page_query"
				onitemclick="_g_element_query2" onitemdblclick="_w_page_u_show">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem xtype="tbtext" text="页面管理" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:dockeditem text="新增" tooltip="新增页面" onclick="_w_page_show" icon="add.png" />
					<aos:dockeditem text="修改" tooltip="修改页面" onclick="_w_page_u_show" icon="edit.png" />
					<aos:dockeditem text="删除" tooltip="删除页面" onclick="_g_page_del" icon="del.png" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:triggerfield emptyText="名称" name="hotkey_page" id="_hotkey_page" trigger1Cls="x-form-search-trigger"
						onenterkey="_g_page_query" onTrigger1Click="_g_page_query" width="180" />
				</aos:docked>
				<aos:menu>
					<aos:menuitem text="新增页面" onclick="_w_page_show" icon="add.png" />
					<aos:menuitem text="修改页面" onclick="_w_page_u_show" icon="edit.png" />
					<aos:menuitem text="删除页面" onclick="_g_page_del" icon="del.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="刷新" onclick="_g_page_store.reload();" icon="refresh.png" />
				</aos:menu>
				<aos:selmodel type="checkbox" mode="multi" />
				<aos:column type="rowno" />
				<aos:column header="页面流水号" dataIndex="id_" hidden="true" />
				<aos:column header="所属功能模块流水号" dataIndex="module_id_" hidden="true" />
				<aos:column header="所属模块" dataIndex="module_name_" width="130" celltip="true" />
				<aos:column header="页面名称" dataIndex="name_" width="150" celltip="true" />
				<aos:column header="页面URL" dataIndex="url_" width="230" celltip="true" />
				<aos:column header="类型" dataIndex="type_" rendererField="page_type_" width="80" />
				<aos:column header="状态" dataIndex="enabled_" rendererField="enabled_" width="60" />
				<aos:column header="排序号" dataIndex="sort_no_" width="60" />
				<aos:column header="缺省页" dataIndex="is_default_" rendererField="bool_" width="60" />
				<aos:column header="小图标" dataIndex="icon_" celltip="true" />
				<aos:column header="大图标" dataIndex="icon_big_" celltip="true" />
				<aos:column header="矢量图标" dataIndex="vector_" celltip="true" hidden="true" />
			</aos:gridpanel>
			<aos:gridpanel id="_g_element" url="listElements.jhtml" hidePagebar="true" onitemdblclick="_w_element_u_show"
				onrender="_g_element_query" flex="0.4">
				<aos:docked forceBoder="1 0 1 0">
					<aos:dockeditem xtype="tbtext" text="页面元素管理" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:dockeditem text="新增" tooltip="新增页面元素" onclick="_w_element_show" icon="add.png" />
					<aos:dockeditem text="修改" tooltip="修改页面元素" onclick="_w_element_u_show" icon="edit.png" />
					<aos:dockeditem text="删除" tooltip="删除页面元素" onclick="_g_element_del" icon="del.png" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:triggerfield emptyText="名称或DOM标识" name="hotkey" id="_hotkey" onenterkey="_hotkey_query"
						trigger1Cls="x-form-search-trigger" onTrigger1Click="_hotkey_query" width="180" />
				</aos:docked>
				<aos:menu>
					<aos:menuitem text="新增页面元素" onclick="_w_element_show" icon="add.png" />
					<aos:menuitem text="修改页面元素" onclick="_w_element_u_show" icon="edit.png" />
					<aos:menuitem text="删除页面元素" onclick="_g_element_del" icon="del.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="刷新" onclick="_g_element_store.reload();" icon="refresh.png" />
				</aos:menu>
				<aos:selmodel type="checkbox" mode="multi" />
				<aos:column type="rowno" />
				<aos:column header="页面元素流水号" dataIndex="id_" hidden="true" />
				<aos:column header="所属功能模块流水号" dataIndex="module_id_" hidden="true" />
				<aos:column header="所属页面流水号" dataIndex="page_id_" hidden="true" />
				<aos:column header="所属模块" dataIndex="module_name_" minWidth="130" celltip="true" />
				<aos:column header="所属页面" dataIndex="page_name_" minWidth="150" celltip="true" />
				<aos:column header="页面元素DOM标识" dataIndex="dom_id_" celltip="true" width="150" />
				<aos:column header="页面元素名称" dataIndex="name_" width="200" celltip="true" />
				<aos:column header="页面元素类型" dataIndex="type_" rendererField="page_el_type_" width="280" celltip="true" />
				<aos:column header="备注" dataIndex="remark_" hidden="true" />
			</aos:gridpanel>
		</aos:panel>
	</aos:viewport>
	<aos:window id="_w_module_find" title="所属模块[双击选择]" height="-10" layout="fit" autoScroll="true"
		onshow="_t_module_find_refresh">
		<aos:treepanel id="_t_module_find" singleClick="false" width="320" bodyBorder="0 0 0 0" url="listModuleTree.jhtml"
			nodeParam="parent_id_" rootId="2a4c060f44d944ea926fe44522ce7b39" rootVisible="true" rootExpanded="false" rootText="${root_.name_}"
			rootIcon="${root_.icon_name_}" onitemdblclick="_t_module_find_select">
			<aos:menu>
				<aos:menuitem text="选择" icon="ok1.png" onclick="_t_module_find_select" />
				<aos:menuitem text="刷新" onclick="_t_module_find_refresh" icon="refresh1.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="关闭" onclick="#_w_module_find.hide();" icon="del.png" />
			</aos:menu>
		</aos:treepanel>
	</aos:window>
	<aos:window id="_w_page" title="新增页面">
		<aos:formpanel id="_f_page" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="module_id_" />
			<aos:triggerfield fieldLabel="所属模块" name="module_name_" allowBlank="false" editable="false"
				onfocus="_w_module_find_show" trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_module_find_show" />
			<aos:textfield name="name_" fieldLabel="页面名称" allowBlank="false" maxLength="100" />
			<aos:textfield name="url_" fieldLabel="页面URL" maxLength="200" />
			<aos:combobox name="type_" fieldLabel="类型" allowBlank="false" value="2" dicField="page_type_" dicFilter="!1"
				onselect="fn_type_onselect" />
			<aos:combobox name="enabled_" fieldLabel="状态" allowBlank="false" value="1" dicField="enabled_" />
			<aos:combobox name="is_default_" fieldLabel="缺省页" allowBlank="false" value="0" dicField="bool_" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minValue="1" maxValue="9999" />
			<aos:textfield name="icon_" fieldLabel="小图标" maxLength="100" />
			<aos:textfield name="icon_big_" fieldLabel="大图标" maxLength="100" />
			<aos:textfield name="vector_" fieldLabel="矢量图标" maxLength="100" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_page_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_page.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_page_u" title="修改页面">
		<aos:formpanel id="_f_page_u" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="id_" />
			<aos:hiddenfield name="module_id_" />
			<aos:textfield name="module_name_" fieldLabel="所属模块" readOnly="true" allowBlank="false" />
			<aos:textfield name="name_" fieldLabel="页面名称" allowBlank="false" maxLength="100" />
			<aos:textfield name="url_" fieldLabel="页面URL" maxLength="200" />
			<aos:combobox name="type_" fieldLabel="类型" allowBlank="false" dicField="page_type_" readOnly="true" />
			<aos:combobox name="enabled_" fieldLabel="状态" allowBlank="false" value="1" dicField="enabled_" />
			<aos:combobox name="is_default_" fieldLabel="缺省页" allowBlank="false" value="1" dicField="bool_" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minValue="1" maxValue="9999" />
			<aos:textfield name="icon_" fieldLabel="小图标" maxLength="100" />
			<aos:textfield name="icon_big_" fieldLabel="大图标" maxLength="100" />
			<aos:textfield name="vector_" fieldLabel="矢量图标" maxLength="100" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_page_u_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_page_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_page_view" title="修改页面">
		<aos:formpanel id="_f_page_view" width="400" layout="anchor" labelWidth="65">
			<aos:textfield name="module_name_" fieldLabel="所属模块" readOnly="true" />
			<aos:textfield name="name_" fieldLabel="页面名称" readOnly="true" />
			<aos:textfield name="url_" fieldLabel="页面URL" maxLength="200" readOnly="true" />
			<aos:combobox name="type_" fieldLabel="类型" dicField="page_type_" readOnly="true" />
			<aos:combobox name="enabled_" fieldLabel="状态" dicField="enabled_" readOnly="true" />
			<aos:combobox name="is_default_" fieldLabel="缺省页" dicField="bool_" readOnly="true" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" readOnly="true" />
			<aos:textfield name="icon_" fieldLabel="小图标" maxLength="100" readOnly="true" />
			<aos:textfield name="icon_big_" fieldLabel="大图标" maxLength="100" readOnly="true" />
			<aos:textfield name="vector_" fieldLabel="矢量图标" maxLength="100" readOnly="true" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbtext" text="提示：主页面请通过 [功能模块]菜单进行管理。" iconVec="fa-hand-o-right" />
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="#_w_page_view.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_element" title="新增页面元素">
		<aos:formpanel id="_f_element" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="module_id_" />
			<aos:hiddenfield name="page_id_" />
			<aos:textfield name="module_name_" fieldLabel="所属模块" allowBlank="false" readOnly="true" />
			<aos:textfield name="page_name_" fieldLabel="所属页面" allowBlank="false" readOnly="true" />
			<aos:textfield name="dom_id_" fieldLabel="Dom标识" allowBlank="false" maxLength="50" />
			<aos:textfield name="name_" fieldLabel="元素名称" allowBlank="false" maxLength="100" />
			<aos:combobox name="type_" fieldLabel="元素类型" allowBlank="false" emptyText="请选择..." dicField="page_el_type_" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="200" height="80" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_element_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_element.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_element_u" title="修改页面元素">
		<aos:formpanel id="_f_element_u" width="400" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="id_" />
			<aos:textfield name="module_name_" fieldLabel="所属模块" allowBlank="false" readOnly="true" />
			<aos:textfield name="page_name_" fieldLabel="所属页面" allowBlank="false" readOnly="true" />
			<aos:textfield name="dom_id_" fieldLabel="Dom标识" allowBlank="false" maxLength="50" />
			<aos:textfield name="name_" fieldLabel="元素名称" allowBlank="false" maxLength="100" />
			<aos:combobox name="type_" fieldLabel="元素类型" allowBlank="false" emptyText="请选择..." dicField="page_el_type_" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="200" height="80" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_element_u_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_element_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">
		    //弹出页面元素新增窗口
		    function _w_page_show(){
		    	var record = AOS.selectone(_t_module);
		    	if(AOS.empty(record)){
			    	AOS.reset(_f_page);
			    	_w_page.show();
		    	}else{
		    		if(record.data.leaf){
		    			AOS.reset(_f_page);
		    			_f_page.down('[name=module_id_]').setValue(record.data.id);
		    			_f_page.down('[name=module_name_]').setValue(record.data.text);
				    	_w_page.show();
		    		}else{
		    			AOS.tip('操作被取消。只能在叶子节点上做新增页面操作，请重新选择。');
		    		}
		    	}
		    }
		    
		  //新增页面保存
		  function _f_page_save(){
 				AOS.ajax({
					forms : _f_page,
					url : 'savePage.jhtml',
					ok : function(data) {
						if(data.appcode === 1){
							_w_page.hide();
							_g_page_store.reload();
						}
						AOS.tip(data.appmsg);	
					}
				});
			}
		  
		    //弹出修改页面窗口
			function _w_page_u_show(){
					AOS.reset(_f_page_u);
	 				var record = AOS.selectone(_g_page);
	 				if(record.data.type_ === '1'){
	 					_w_page_view.show();
	 					_f_page_view.loadRecord(record);
					}else{
	 					_w_page_u.show();
	 					_f_page_u.loadRecord(record);
	 					if(record.data.type_ === '2'){
	 						AOS.edits(_f_page_u, 'enabled_,is_default_');
	 					}else if(record.data.type_ === '3'){
	 						AOS.reads(_f_page_u, 'enabled_,is_default_');
	 					}
					}
				}
		    
		    //状态变化
		    function fn_type_onselect(obj){
		    	if(obj.getValue() === '3' || obj.getValue() === '4'){
						AOS.reads(_f_page, 'enabled_,is_default_');
						_f_page.down('[name=enabled_]').setValue('1');
						_f_page.down('[name=is_default_]').setValue('0');
					}else{
						AOS.edits(_f_page, 'enabled_,is_default_');
					}
		    }
		    
		     //修改页面信息
			 function _f_page_u_save(){
					AOS.ajax({
						forms : _f_page_u,
						url : 'updatePage.jhtml',
						ok : function(data) {
							if(data.appcode === 1){
								_w_page_u.hide();
								_g_page_store.reload();
							}
							AOS.tip(data.appmsg);	
						}
					});
				}
		  
		  //删除页面组件
			function _g_page_del(){
				var rows = AOS.rows(_g_page);
				if(rows === 0){
					AOS.tip('删除前请先选中页面数据。');
					return;
				}
				var msg =  AOS.merge('确认要删除选中的[{0}]条页面记录吗？', rows);
				AOS.confirm(msg, function(btn){
					if(btn === 'cancel'){
						AOS.tip('删除操作被取消。');
						return;
					}
					AOS.ajax({
						url : 'deletePage.jhtml',
						params:{
							aos_rows_: AOS.selection(_g_page, 'id_')
						},
						ok : function(data) {
							AOS.tip(data.appmsg);
							_g_page_store.reload();
							_g_element_store.reload();
						}
					});
				});
			}
    
		    //查询页面列表
			function _g_page_query() {
				var params = {
						hotkey : _hotkey_page.getValue()
				};
				var record = AOS.selectone(_t_module);
				if(!AOS.empty(record) && record.data.id != '0'){
					params.module_id_ = record.data.id;
				}
				_g_page_store.getProxy().extraParams = params;
				_g_page_store.loadPage(1);
			}
    
			//弹出选择所属模块窗口：新增
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
		    
		    //所属模块节点选择事件
		    function _t_module_find_select(){
		    	var record = AOS.selectone(_t_module_find);
		    	if(!record.data.leaf){
		    		AOS.tip('操作被取消。只能选择叶子节点，请重新选择。');
		    		return;
		    	}
	    		//新增页面窗口
	    		_f_page.down('[name=module_id_]').setValue(record.raw.id); 
	    		_f_page.down('[name=module_name_]').setValue(record.raw.text);
				_w_module_find.hide();
		    }
		    
		    //关键字查询
		    function _hotkey_query(){
		    	var record = AOS.selectone(_t_module);
		    	if(record){
			    	if(!record.data.leaf){
			    		AOS.tip('查询被取消，请选择叶子节点。');
			    		return;
			    	}
		    	}
		    	_g_element_query();
		    }
		    
		    //树点击事件
		    function _t_module_click(){
		    	var record = AOS.selectone(_t_module);
		    	if(!record.data.leaf && record.data.id !== '0'){
		    		AOS.tip('请选择叶子节点。');
		    		_g_element_store.removeAll();
		    		_g_page_store.removeAll();
		    		return;
		    	}
	    		_g_element_query();
	    		_g_page_query();
		    }
			
		    //查询页面元素列表
			function _g_element_query() {
				var params = {
						hotkey : _hotkey.getValue()
				};
				var record = AOS.selectone(_t_module);
				if(!AOS.empty(record) && record.data.id != '0'){
					params.module_id_ = record.data.id;
				}
				_g_element_store.getProxy().extraParams = params;
				_g_element_store.loadPage(1);
			}
		    
		    //查询页面元素列表
			function _g_element_query2() {
				var params = {
						hotkey : _hotkey.getValue()
				};
				var record_page_ = AOS.selectone(_g_page, true);
				params.page_id_ = record_page_.data.id_;
				params.module_id_ = record_page_.data.module_id_;
				_g_element_store.getProxy().extraParams = params;
				_g_element_store.loadPage(1);
			}
			
			//刷新菜单树
			function _t_module_refresh() {
				var refreshnode = AOS.selectone(_t_module);
				if (!refreshnode) {
					refreshnode = _t_module.getRootNode();
				}
				if (refreshnode.isLeaf()) {
					refreshnode = refreshnode.parentNode;
				}
				_t_module_store.load({
					node : refreshnode,
					callback : function() {
						//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
						refreshnode.collapse();
						refreshnode.expand();
					}
				});
			}

		//新增页面元素保存
		 function _f_element_save(){
 				AOS.ajax({
					forms : _f_element,
					url : 'saveElement.jhtml',
					ok : function(data) {
						if(data.appcode === 1){
							_w_element.hide();
							_g_element_store.reload();
						}
						AOS.tip(data.appmsg);	
					}
				});
			}
		   
	    //弹出页面元素新增窗口
	    function _w_element_show(){
	    	AOS.reset(_f_element);
	    	var rows = AOS.rows(_g_page);
	    	if(rows === 1){
		    	_w_element.show();
		    	var record = AOS.selectone(_g_page,true);
		    	_f_element.down('[name=module_id_]').setValue(record.data.module_id_);
		    	_f_element.down('[name=module_name_]').setValue(record.data.module_name_);
		    	_f_element.down('[name=page_id_]').setValue(record.data.id_);
		    	_f_element.down('[name=page_name_]').setValue(record.data.name_);
	    	}else{
	    		AOS.tip('操作被取消，请先选择一条页面记录。');
	    	}
	    }
	    
	    //弹出修改页面元素窗口
		function _w_element_u_show(){
				AOS.reset(_f_element_u);
 				var record = AOS.selectone(_g_element);
 				if(record){
 					_w_element_u.show();
 	 				_f_element_u.loadRecord(record);
				}
			}
	    
	     //修改页面元素信息
		 function _f_element_u_save(){
				AOS.ajax({
					forms : _f_element_u,
					url : 'updateElement.jhtml',
					ok : function(data) {
						if(data.appcode === 1){
							_w_element_u.hide();
							_g_element_store.reload();
						}
						AOS.tip(data.appmsg);	
					}
				});
			}
	     
		    //删除页面元素组件
			function _g_element_del(){
				var rows = AOS.rows(_g_element);
				if(rows === 0){
					AOS.tip('删除前请先选中页面数据。');
					return;
				}
				var msg =  AOS.merge('确认要删除选中的[{0}]条页面元素记录吗？', rows);
				AOS.confirm(msg, function(btn){
					if(btn === 'cancel'){
						AOS.tip('删除操作被取消。');
						return;
					}
					AOS.ajax({
						url : 'deleteElement.jhtml',
						params:{
							aos_rows_: AOS.selection(_g_element, 'id_')
						},
						ok : function(data) {
							AOS.tip(data.appmsg);
							_g_element_store.reload();
						}
					});
				});
			}
		</script>
</aos:onready>
</aos:html>
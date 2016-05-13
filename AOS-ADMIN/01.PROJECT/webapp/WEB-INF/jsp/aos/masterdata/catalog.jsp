<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="分类科目">
	<aos:include lib="ext" />
	<aos:base href="system/catalog" />
	<style>
		.x-tree-node-text{
		  cursor:default;
		}
	</style>
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:treepanel id="_t_catalog" url="listCatalogs.jhtml" nodeParam="parent_id_" animate="true" singleClick="false"
			columnLines="true" rootVisible="false" >
			<aos:menu>
				<aos:menuitem text="新增" onclick="_w_catalog_show" icon="add.png" />
				<aos:menuitem text="修改" onclick="_w_catalog_u_show" icon="edit.png" />
				<aos:menuitem text="删除" onclick="_t_catalog_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新选中" onclick="fnrefresh" icon="refresh.png" />
				<aos:menuitem text="刷新全部" onclick="fnrefresh_root" icon="refresh.png" />
			</aos:menu>
			<aos:docked>
				<aos:button text="新增" icon="add.png">
					<aos:menu>
						<aos:menuitem text="新增分类" icon="icon75.png" onclick="_w_catalog_show" />
						<aos:menuitem xtype="menuseparator" />
						<aos:menuitem text="新增科目(一级分类)" icon="book.png" onclick="_w_catalog_show('1')" />
					</aos:menu>
				</aos:button>
				<aos:dockeditem onclick="_w_catalog_u_show" text="修改" icon="edit.png" />
				<aos:dockeditem onclick="_t_catalog_del" text="删除" icon="del.png" />
			</aos:docked>
			<%-- <aos:column type="rowno" /> 自分类的编号顺序有点问题，直接隐藏编号列 --%> 
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="节点语义ID" dataIndex="cascade_id_" hidden="true" />
			<aos:column type="tree" header="分类名称" dataIndex="name_" flex="1" minWidth="250" maxWidth="800" />
			<aos:column header="叶子节点" dataIndex="is_leaf_" rendererField="bool_" width="70" />
			<aos:column header="自动展开" dataIndex="is_auto_expand_" rendererField="bool_" width="70" />
			<aos:column header="排序号" dataIndex="sort_no_" width="60" />
			<aos:column header="所属科目标识键" dataIndex="root_key_" width="180" />
			<aos:column header="所属科目名称" dataIndex="root_name_"  width="200"/>
			<aos:column header="节点图标文件" dataIndex="icon_name_" sortable="false" width="120" />
			<aos:column header="热键" dataIndex="hotkey_" />
		</aos:treepanel>
		<aos:window id="_w_catalog" title="新增科目">
			<aos:formpanel id="_f_catalog" width="400" layout="anchor" labelWidth="75">
				<aos:hiddenfield name="flag" fieldLabel="区分新增科目|分类" />
				<aos:textfield name="root_key_" fieldLabel="科目标识键" allowBlank="false" />
				<aos:textfield name="root_name_" fieldLabel="科目名称" allowBlank="false" />
				<aos:treepicker fieldLabel="上级分类" name="parent_id_" allowBlank="false" emptyText="请选择..." rootId="0"
					url="${cxt}/system/listCatalogs.jhtml" nodeParam="parent_id_" />
				<aos:textfield name="name_" fieldLabel="分类名称" allowBlank="false" maxLength="50" />
				<aos:textfield name="hotkey_" fieldLabel="热键" maxLength="50" />
				<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" value="0" editable="false" dicField="bool_" />
				<aos:textfield name="icon_name_" fieldLabel="节点图标" maxLength="50" />
				<aos:numberfield name="sort_no_" fieldLabel="排序号" value="0" minValue="0" maxValue="999999" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="_f_catalog_submit" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#_w_catalog.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
		<aos:window id="_w_catalog_u" title="修改科目">
			<aos:formpanel id="_f_catalog_u" width="400" layout="anchor" labelWidth="75">
				<aos:hiddenfield name="id_" fieldLabel="流水号" />
				<aos:textfield name="name_" fieldLabel="分类名称" allowBlank="false" maxLength="50" />
				<aos:textfield name="hotkey_" fieldLabel="热键" maxLength="50" />
				<aos:combobox name="is_auto_expand_" fieldLabel="自动展开" value="0" editable="false" dicField="bool_" />
				<aos:textfield name="icon_name_" fieldLabel="节点图标" maxLength="50" />
				<aos:numberfield name="sort_no_" fieldLabel="排序号" value="0" minValue="0" maxValue="999999" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="_f_catalog_u_submit" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#_w_catalog_u.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
	</aos:viewport>

	<script type="text/javascript">
		    //新增窗口
			function _w_catalog_show(flag){
				AOS.reset(_f_catalog);
				var record = AOS.selectone(_t_catalog);
				_f_catalog.form.findField('flag').setValue(flag);
				if(flag === '1'){
					//新增科目
					_w_catalog.show();
					AOS.hides(_f_catalog, 'parent_id_,name_');
					AOS.disables(_f_catalog, 'parent_id_,name_');
					AOS.edits(_f_catalog, 'root_key_,root_name_');
				}else{
					//新增分类
					if(AOS.empty(record)){
						AOS.tip('操作被取消，新增分类前请先选中一个父分类。')
						return;
					}
					_w_catalog.show();
					_w_catalog.setTitle(AOS.title('新增分类'));
					AOS.shows(_f_catalog, 'parent_id_,name_');
					AOS.enables(_f_catalog, 'parent_id_,name_');
					_f_catalog.form.findField('root_key_').setValue(record.raw.root_key_);
					_f_catalog.form.findField('root_name_').setValue(record.raw.root_name_);
					_f_catalog.form.findField('parent_id_').setValue(record.raw.id_); 
					_f_catalog.form.findField('parent_id_').setRawValue(record.raw.name_); 
					AOS.reads(_f_catalog, 'parent_id_,root_name_,root_key_');
				}
			}
		    
		    //新增/修改
		    function _f_catalog_submit(){
	 				AOS.ajax({
						forms : _f_catalog,
						url : 'saveCatalog.jhtml',
						ok : function(data) {
							if(data.appcode !== -1){
								_w_catalog.hide();
								if(data.flag === "1"){
									//新增科目刷新根节点
									_t_catalog_refresh(_t_catalog.getRootNode());
								}else{
									//新增分类/修改 如果当前节点是树枝节点则刷新当前节点，否则刷新父节点
									var refreshnode = AOS.selectone(_t_catalog);
									if(refreshnode.isLeaf()){
										refreshnode = refreshnode.parentNode;
									}
									_t_catalog_refresh(refreshnode);
								}
								AOS.tip(data.appmsg);
							}else{
								//业务错误
								AOS.tip(data.appmsg);
							}
						}
					}); 
		    }
		    
		   //修改窗口
		   function _w_catalog_u_show(){
		  	 record = AOS.selectone(_t_catalog);
		  	 if(record){
			  	 _w_catalog_u.show();
			  	 _f_catalog_u.loadRecord(record);
		  	 }
	     	}
		   
		   //修改
		   function _f_catalog_u_submit(){
 				AOS.ajax({
					forms : _f_catalog_u,
					url : 'updateCatalog.jhtml',
					ok : function(data) {
						_w_catalog_u.hide();
					   //如果当前节点是树枝节点则刷新当前节点，否则刷新父节点
						var refreshnode = AOS.selectone(_t_catalog);
						if(refreshnode.isLeaf()){
							refreshnode = refreshnode.parentNode;
						}
						_t_catalog_refresh(refreshnode);
						AOS.tip(data.appmsg);
					}
				}); 
		   }
		   
		   //删除
		   function _t_catalog_del(){
				var record = AOS.selectone(_t_catalog);
				if(AOS.empty(record)){
					AOS.tip('删除前请先选中数据。');
					return;
				}
				AOS.confirm('删除分类会导致和分类所属数据失去关联，请保证该分类下没有业务数据。<br><br>请谨慎操作，确认要删除吗？', function(btn){
					if(btn === 'cancel'){
						AOS.tip('删除操作被取消。');
						return;
					}
					AOS.ajax({
						url : 'deleteCatalog.jhtml',
						params:{
							id_: record.raw.id_,
							parent_id_: record.raw.parent_id_
						},
						ok : function(data) {
							var refreshnode = AOS.selectone(_t_catalog);
							refreshnode = refreshnode.parentNode;
							if(data.appcode === 1){
							    //此种情况前端要刷新删除节点的父节点的父节点
								refreshnode = refreshnode.parentNode;
							}
							_t_catalog_refresh(refreshnode);
							AOS.tip(data.appmsg);
						}
					});
				});		  	 
		   }
		    
		    //刷新指定树节点
		    function _t_catalog_refresh(refreshnode){
				_t_catalog_store.load({
					node : refreshnode,
					callback:function(){
						refreshnode.collapse();
						AOS.job(function(){
							refreshnode.expand();
						},300);
					}
				});
		    }
		    
		    //刷新
		    function fnrefresh(){
		    	var node = AOS.selectone(_t_catalog);
		    	if(node.isLeaf()){
		    		AOS.tip('操作被取消，叶子节点不能刷新。');
		    		return;
		    	}
		    	_t_catalog_refresh(node);
		    }
		    
		   //刷新根节点
		    function fnrefresh_root(){
		    	var node = _t_catalog.getRootNode();
		    	_t_catalog_refresh(node);
		    }
		   
		</script>
</aos:onready>
</aos:html>
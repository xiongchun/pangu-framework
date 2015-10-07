<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="自定义菜单">
	<aos:include lib="ext" />
	<aos:base href="system/preference" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:layout type="hbox" align="stretch" />
		<aos:panel flex="0.6" bodyBorder="0 1 0 0">
			<aos:layout type="hbox" align="stretch" />
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="自定义快捷菜单" />
			</aos:docked>
			<aos:treepanel id="_t_quick" bodyBorder="0 0 0 0" url="getModuleCheckTree4QuickMenu.jhtml" singleClick="false"
				rootId="p" cascade="true" rootText="请选择[自定义]" flex="0.5">
				<aos:menu>
					<aos:menuitem text="刷新" onclick="_t_quick_load" icon="refresh.png" />
				</aos:menu>
				<aos:docked dock="bottom" forceBoder="1 0 0 0">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem onclick="_t_quick_save" text="保存" icon="ok.png" />
					<aos:dockeditem onclick="_t_quick_load" text="刷新" icon="refresh.png" />
				</aos:docked>
			</aos:treepanel>
			<aos:treepanel id="_t_checked" bodyBorder="0 0 0 1" url="getModuleTree4QuickMenu.jhtml" singleClick="false"
				rootId="p" rootText="已选择[预览]" flex="0.5">
				<aos:menu>
					<aos:menuitem text="刷新" onclick="_t_checked_load" icon="refresh.png" />
				</aos:menu>
				<aos:docked dock="bottom" forceBoder="1 0 0 1">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem onclick="#_w_module_sort.show()" text="排序号管理" icon="icon146.png" />
					<aos:dockeditem onclick="_t_checked_load" text="刷新" icon="refresh.png" />
				</aos:docked>
			</aos:treepanel>
		</aos:panel>
		<aos:gridpanel id="_g_nav" url="listFloatModules.jhtml" flex="0.4" pageSize="1000" hidePagebar="true"
			onrender="_g_nav_query" onitemdblclick="_w_module_u_show">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="自定义欢迎页浮动菜单" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="新增" tooltip="新增浮动菜单" onclick="_w_module_show" icon="add.png" />
				<aos:dockeditem text="修改" tooltip="修改浮动菜单" onclick="_w_module_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" tooltip="删除浮动菜单" onclick="_g_nav_del" icon="del.png" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新增浮动菜单" onclick="_w_module_show" icon="add.png" />
				<aos:menuitem text="修改浮动菜单" onclick="_w_module_u_show" icon="edit.png" />
				<aos:menuitem text="删除浮动菜单" onclick="_g_nav_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_nav_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="功能模块流水号" dataIndex="module_id_" hidden="true" />
			<aos:column header="浮动菜单" dataIndex="module_name_" width="160" celltip="true" />
			<aos:column header="浮动图标" dataIndex="nav_icon_" celltip="true" />
			<aos:column header="排序号" dataIndex="sort_no_" width="60" />
		</aos:gridpanel>
		<aos:window id="_w_module_find" title="选择浮动菜单[双击选择]" height="-10" layout="fit" autoScroll="true"
			onshow="_t_module_find_refresh">
			<aos:treepanel id="_t_module_find" singleClick="false" width="320" bodyBorder="0 0 0 0" url="listModuleTree.jhtml"
				nodeParam="parent_id_" rootId="${root_.id_}" rootVisible="true" rootExpanded="false" rootText="${root_.name_}"
				rootIcon="${root_.icon_name_}" onitemdblclick="_t_module_find_select">
				<aos:menu>
					<aos:menuitem text="选择" icon="ok1.png" onclick="_t_module_find_select" />
					<aos:menuitem text="刷新" onclick="_t_module_find_refresh" icon="refresh1.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="关闭" onclick="#_w_module_find.hide();" icon="del.png" />
				</aos:menu>
			</aos:treepanel>
		</aos:window>
		<aos:window id="_w_module" title="新增浮动菜单">
			<aos:formpanel id="_f_module" width="400" layout="anchor" labelWidth="65">
				<aos:hiddenfield name="module_id_" />
				<aos:triggerfield fieldLabel="浮动菜单" name="module_name_" allowBlank="false" editable="false"
					onfocus="_w_module_find_show" trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_module_find_show" />
				<aos:textfield name="nav_icon_" allowBlank="false" fieldLabel="浮动图标" maxLength="50" />
				<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minWidth="0" maxValue="99999999" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="_f_module_save" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#_w_module.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
		<aos:window id="_w_module_u" title="修改浮动菜单">
			<aos:formpanel id="_f_module_u" width="400" layout="anchor" labelWidth="65">
				<aos:hiddenfield name="id_" />
				<aos:hiddenfield name="module_id_" />
				<aos:triggerfield fieldLabel="浮动菜单" name="module_name_" allowBlank="false" editable="false"
					onfocus="_w_module_find_show" trigger1Cls="x-form-search-trigger" onTrigger1Click="_w_module_find_show" />
				<aos:textfield name="nav_icon_" allowBlank="false" fieldLabel="浮动图标" maxLength="50" />
				<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minWidth="0" maxValue="99999999" />
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="_f_module_update" text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#_w_module_u.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
		<aos:window id="_w_module_sort" title="快捷菜单排序号管理[平铺布局]" height="-20" onshow="_w_module_sort_onshow" layout="fit">
			<aos:gridpanel id="_g_module_sort"  bodyBorder="1 0 0 0" url="listQuickMenu4Sort.jhtml"
				hidePagebar="true" width="400" >
				<aos:menu>
					<aos:menuitem text="刷新" onclick="#_g_module_sort_store.reload()" icon="refresh1.png" />
				</aos:menu>
				<aos:plugins>
					<aos:editing clicksToEdit="1" onedit="_g_module_sort_save" autoCancel="false" />
				</aos:plugins>
				<aos:column type="rowno" />
				<aos:column header="流水号" dataIndex="id_" hidden="true" />
				<aos:column header="菜单名称" dataIndex="name_" flex="1" />
				<aos:column header="排序号" dataIndex="sort_no_" width="100">
					<aos:numberfield name="sort_no_" minValue="0" maxValue="999" />
				</aos:column>
			</aos:gridpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbtext" iconVec="fa-hand-o-right " text=" 提示：自定义快捷菜单在平铺布局下的排序。" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#_w_module_sort.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
	</aos:viewport>
	<script type="text/javascript">
	
	 //刷新浮动菜单表达树
    function _t_module_find_refresh(){
		var refreshnode =  _t_module_find.getRootNode();
		_t_module_find_store.load({
			node : refreshnode,
			callback : function() {
				//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
				refreshnode.collapse();
				refreshnode.expand();
			}
		});
    }
	 
    //功能模块树节点选择事件
    function _t_module_find_select(){
    	var record = AOS.selectone(_t_module_find);
    	if(_w_module.isVisible()){
    		//新增浮动菜单窗口
			_f_module.down('[name=module_id_]').setValue(record.raw.id); 
			_f_module.down('[name=module_name_]').setValue(record.raw.text);
    	}else{
    		//修改浮动菜单窗口
    		_f_module_u.down('[name=module_id_]').setValue(record.raw.id); 
			_f_module_u.down('[name=module_name_]').setValue(record.raw.text);
    	}
		_w_module_find.hide();
    }
    
	//弹出选择上级菜单窗口：新增
	function _w_module_find_show(){
		_w_module_find.show();
	}
	
	//弹出新增浮动菜单窗口
	function _w_module_show(){
		AOS.reset(_f_module);
		_w_module.show();
	}
	
    //查询浮动菜单菜单列表
    function _g_nav_query() {
        var params = {
        };
        _g_nav_store.getProxy().extraParams = params;
        _g_nav_store.load();
    }
	
	//保存浮动菜单信息
    function _f_module_save() {
        AOS.ajax({
            forms: _f_module,
            url: 'saveFloatModuleInfo.jhtml',
            ok: function (data) {
                AOS.tip(data.appmsg);
                if(data.appcode === 1){
                    _w_module.hide();
                    _g_nav_store.reload();                	
                }
            }
        });
    }
	
    //弹出修改浮动菜单窗口
	function _w_module_u_show(){
		var record = AOS.selectone(_g_nav);
		if(record){
			_w_module_u.show();
			_f_module_u.loadRecord(record);
		}
	}
    
	//修改浮动菜单信息
    function _f_module_update() {
        AOS.ajax({
            forms: _f_module_u,
            url: 'updateFloatModuleInfo.jhtml',
            ok: function (data) {
                AOS.tip(data.appmsg);
                if(data.appcode === 1){
                    _w_module_u.hide();
                    _g_nav_store.reload();                	
                }
            }
        });
    }
	
    //删除浮动菜单
	function _g_nav_del(){
		var rows = AOS.rows(_g_nav);
		if(rows === 0){
			AOS.tip('删除前请先选中数据。');
			return;
		}
		var msg =  AOS.merge('确认要删除选中的[{0}]条浮动菜单数据吗？', rows);
		AOS.confirm(msg, function(btn){
			if(btn === 'cancel'){
				AOS.tip('删除操作被取消。');
				return;
			}
			AOS.ajax({
				url : 'delFloatModules.jhtml',
				params:{
					aos_rows_:  AOS.selection(_g_nav, 'id_')
				},
				ok : function(data) {
					AOS.tip(data.appmsg);
					_g_nav_store.reload();
				}
			});
		});
		}
    
	 //刷新快捷菜单  待选
    function _t_quick_load() {
        refreshnode = _t_quick.getRootNode();
        _t_quick_store.load({
            callback: function () {
                //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                refreshnode.collapse();
                refreshnode.expand();
            }
        });
    }
	 
	 //刷新快捷菜单树 已选
    function _t_checked_load() {
        refreshnode = _t_checked.getRootNode();
        _t_checked_store.load({
            callback: function () {
                //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                refreshnode.collapse();
                refreshnode.expand();
            }
        });
    }
	 
    //保存自定义快捷菜单
    var aos_rows__t_quick_init;
	AOS.job(function() {
		aos_rows__t_quick_init = AOS.selection(_t_quick, 'id');
	}, 1000);
    function _t_quick_save() {
        var aos_rows_;
        aos_rows_ = AOS.selection(_t_quick, 'id');
        if (aos_rows_ === aos_rows__t_quick_init) {
            AOS.tip('操作被取消，数据无变化不需要保存。');
            return;
        }
        var params = {
            aos_rows_: aos_rows_
        };
        AOS.ajax({
            params: params,
            url: 'saveQuickModuleInfo.jhtml',
            ok: function (data) {
                AOS.tip(data.appmsg);
                aos_rows__t_quick_init = AOS.selection(_t_quick, 'id');
                _t_checked_load();
            }
        });
    }
    
    //查询快捷菜单(排序号管理)
    function _w_module_sort_onshow(){
    	var params = {
        };
    	_g_module_sort_store.getProxy().extraParams = params;
    	_g_module_sort_store.load();
    }
    
    //保存快捷菜单排序号
    function _g_module_sort_save(editor, e) {
        var record = e.record;
        if (AOS.empty(record.data.sort_no_)) {
            e.record.commit();
            return;
        }
        AOS.ajax({
            params: record.data,
            url: 'saveQuickMenuSortNo.jhtml',
            ok: function (data) {
            	_g_module_sort_store.reload();
                AOS.tip(data.appmsg);
            }
        });
    }
	 
	</script>
</aos:onready>
</aos:html>
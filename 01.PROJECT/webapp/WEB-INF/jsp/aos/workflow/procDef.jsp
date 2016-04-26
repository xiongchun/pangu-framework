<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="流程配置与管理">
	<aos:include lib="ext" />
	<aos:base href="workflow/procDef" />
</aos:head>
<aos:body>
	<div id="_div_diagram" class="x-hidden" align="center">
		<img id="_img_diagram" style="vertical-align: middle;" />
	</div>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_catalog" width="180" region="west" url="${cxt}/system/listCatalogs.jhtml" singleClick="false"
			useArrows="false" rootVisible="true" rootText="全部分类" nodeParam="parent_id_" bodyBorder="0 1 0 0"
			headerBorder="0 1 0 0" rootId="1689">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="流程分类科目" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新分类" onclick="_t_catalog_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_procdef" url="listProcdefs.jhtml" region="center" onrender="_g_procdef_query">
			<aos:docked forceBoder="0 0 1 0">
			    <aos:dockeditem text="流程图" onclick="_w_diagram_show" icon="sitemap.png" />
			    <aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="启动流程实例" icon="go.png" onclick="_fn_startProc"  tooltip="启动一个新的流程实例" />
				<aos:dockeditem text="挂起流程" icon="stop2.png" onclick="_fn_suspendProcDef" />
				<aos:dockeditem text="激活流程" icon="go1.png" onclick="_fn_activateProcDef" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="修改" onclick="_w_proc_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" icon="del.png">
					<aos:menu>
						<aos:menuitem text="删除" onclick="_g_procdef_del" tooltip="删除流程相关数据" icon="del_page.png" />
						<aos:menuitem text="级联删除" onclick="_g_procdef_del('1')" tooltip="删除流程相关数据及其运行实例的数据" icon="del_folder.png" />
					</aos:menu>
				</aos:dockeditem>
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="流程名称" name="name_" id="procdef_name_" onenterkey="_g_procdef_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_procdef_query" width="200" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="#_g_procdef_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流程定义扩展流水号" dataIndex="id_" hidden="true" />
			<aos:column header="模型ID" dataIndex="model_id_" hidden="true" />
			<aos:column header="流程定义ID" dataIndex="proc_def_id_" width="150"/>
			<aos:column header="流程KEY" dataIndex="key_" width="120" celltip="true" />
			<aos:column header="流程名称" dataIndex="name_" width="200" celltip="true" />
			<aos:column header="活动状态" dataIndex="suspension_state_" rendererField="suspension_state_" dataType="number" width="80" />
			<aos:column header="版本号" dataIndex="version_" width="80" />
			<aos:column header="部署时间" dataIndex="deploy_time_" width="160" />
			<aos:column header="部署人" dataIndex="deploy_user_" width="80" />
			<aos:column header="流程描述" dataIndex="description_" flex="1" minWidth="250" celltip="true" />
		</aos:gridpanel>
	</aos:viewport>

	<aos:window id="_w_proc_u" title="修改流程">
		<aos:formpanel id="_f_proc_u" width="500" layout="column" labelWidth="65">
			<aos:hiddenfield name="id_" />
			<aos:textfield name="proc_def_id_" fieldLabel="流程ID" readOnly="true" columnWidth="0.5" />
			<aos:textfield name="key_" fieldLabel="流程Key" readOnly="true" columnWidth="0.5" />
			<aos:combobox name="suspension_state_" fieldLabel="流程状态" readOnly="true" dicField="suspension_state_"
				dicDataType="number" columnWidth="0.5" />
			<aos:textfield name="version_" fieldLabel="版本号" readOnly="true" columnWidth="0.5" />
			<aos:textfield name="deploy_time_" fieldLabel="部署时间" readOnly="true" columnWidth="0.5" />
			<aos:textfield name="deploy_user_" fieldLabel="部署人" readOnly="true" columnWidth="0.5" />
			<aos:textfield name="name_" fieldLabel="流程名称" allowBlank="false" columnWidth="1" />
			<aos:textareafield name="description_" fieldLabel="描述" columnWidth="1" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_proc_u_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_proc_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_diagram" title="流程图" autoScroll="true" maximizable="true" onshow="_w_diagram_onshow"
		contentEl="_div_diagram" width="500" height="250">
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_w_diagram_hide" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<script type="text/javascript">
	//弹出修改流程窗口
	function _w_proc_u_show(){
		   var record = AOS.selectone(_g_procdef);
           if (record) {
        	   _w_proc_u.show();
               AOS.reset(_f_proc_u);
               _f_proc_u.loadRecord(record);
           }
	}
	
	//更新流程基本属性
    function _f_proc_u_save() {
        AOS.ajax({
            url: 'updateProcProps.jhtml',
            forms: _f_proc_u,
            ok: function (data) {
            	_w_proc_u.hide();
                AOS.tip(data.appmsg);
                _g_procdef_store.reload();
            }
        });
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
    }

           //关闭流程图窗口
           function _w_diagram_hide() {
               _w_diagram.hide();
               _w_diagram.center();
           }

           //显示流程图窗口
           function _w_diagram_show() {
               if (AOS.selectone(_g_procdef)) {
                   _w_diagram.show();
               }
           }

           //监听流程图弹出窗口
           function _w_diagram_onshow() {
           	AOS.mask(null,_w_diagram);
           	   var record = AOS.selectone(_g_procdef);
               document.getElementById('_img_diagram').src = "${cxt}/bpm/graphModelByProcdefID.jhtml?proc_def_id_=" + record.data.proc_def_id_;
               var imgObj = document.getElementById('_img_diagram');
               //图像数据加载完毕
               if(imgObj.complete){
               	AOS.unmask();
               }
               imgObj.onload = function(){
               	AOS.unmask();
                   var width = Ext.get('_img_diagram').getWidth() + 100;
                   var height = Ext.get('_img_diagram').getHeight() + 65;
                   var viewWidth = Ext.getBody().getViewSize().width;
                   var viewHeight = Ext.getBody().getViewSize().height;
                   width = width > viewWidth ? viewWidth : width;
                   height = height > viewHeight ? viewHeight : height;
                   var left = (viewWidth - width) / 2;
                   var top = (viewHeight - height) / 2;
                   _w_diagram.animate({
                       to: {
                           width: width,
                           height: height,
                           top: top,
                           left: left
                       }
                   });
               }
           }
           
           //查询流程定义列表
           function _g_procdef_query() {
               var params = {
               	name_: procdef_name_.getValue()
               };
               _g_procdef_store.getProxy().extraParams = params;
               _g_procdef_store.loadPage(1);
           }

           //刷新分类树
           function _t_catalog_refresh() {
               var refreshnode = AOS.selectone(_t_catalog);
               if (refreshnode.isLeaf()) {
                   refreshnode = refreshnode.parentNode;
               }
               _t_catalog_store.load({
                   node: refreshnode,
                   callback: function () {
                       refreshnode.collapse();
                       refreshnode.expand();
                   }
               });
           }
           
           //启动流程实例
           function _fn_startProc() {
               var rec = AOS.selectone(_g_procdef);
               var msg = AOS.merge('确认要启动流程[ID:{0}, 名称:{1}]吗？', rec.data.proc_def_id_,rec.data.name_);
               AOS.confirm(msg, function (btn) {
                   if (btn === 'cancel') {
                       AOS.tip('操作被取消。');
                       return;
                   }
                   AOS.ajax({
                       url: 'startProc.jhtml',
                       params: rec.data,
                       ok: function (data) {
                           AOS.tip(data.appmsg);
                           _g_procdef_store.reload();
                       }
                   });
               });
           }
           
           //挂起流程
           function _fn_suspendProcDef() {
               var rec = AOS.selectone(_g_procdef); //右键菜单
               var msg = AOS.merge('确认要挂起流程[ID:{0}, 名称:{1}]吗？', rec.data.proc_def_id_,rec.data.name_);
               AOS.confirm(msg, function (btn) {
                   if (btn === 'cancel') {
                       AOS.tip('操作被取消。');
                       return;
                   }
                   AOS.ajax({
                       url: 'suspendProcDef.jhtml',
                       params: rec.data,
                       ok: function (data) {
                           AOS.tip(data.appmsg);
                           _g_procdef_store.reload();
                       }
                   });
               });
           }

           //激活流程
           function _fn_activateProcDef() {
               var rec = AOS.selectone(_g_procdef); //右键菜单
               var msg = AOS.merge('确认要激活流程[ID:{0}, 名称:{1}]吗？', rec.data.proc_def_id_,rec.data.name_);
               AOS.confirm(msg, function (btn) {
                   if (btn === 'cancel') {
                       AOS.tip('操作被取消。');
                       return;
                   }
                   AOS.ajax({
                       url: 'activateProcDef.jhtml',
                       params: rec.data,
                       ok: function (data) {
                           AOS.tip(data.appmsg);
                           _g_procdef_store.reload();
                       }
                   });
               });
           }
           
           //删除流程
           function _g_procdef_del(cascade) {
               var rows = AOS.rows(_g_procdef);
               if (rows == 0) {
                   AOS.tip('删除前请先选中数据。');
                   return;
               }
               var msg = AOS.merge('确认要删除选中的[{0}]条流程数据吗？', rows);
               if(cascade === '1'){
            	   msg = AOS.merge('确认要级联删除选中的[{0}]条流程数据吗(含实例数据)？', rows);
               }
               AOS.confirm(msg, function (btn) {
                   if (btn === 'cancel') {
                       AOS.tip('删除操作被取消。');
                       return;
                   }
                   AOS.ajax({
                       url: 'delProcDef.jhtml',
                       params: {
                           aos_rows_: AOS.selection(_g_procdef, 'id_'),
                           cascade: cascade
                       },
                       ok: function (data) {
                           AOS.tip(data.appmsg);
                           _g_procdef_store.reload();
                       }
                   });
               });
           }
        </script>
</aos:onready>
</aos:html>
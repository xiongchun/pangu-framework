<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="流程建模">
	<aos:include lib="ext" />
	<aos:base href="bpm/procModel/" />
</aos:head>
<aos:body>
	<div id="_div_diagram" class="x-hidden" align="center">
		<img id="_img_diagram" style="vertical-align: middle;" />
	</div>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_catalog" width="220" region="west" url="${cxt}/system/listCatalogs.jhtml" singleClick="false"
			useArrows="false" rootVisible="true" rootText="全部分类" nodeParam="parent_id_" bodyBorder="0 1 0 0"
			headerBorder="0 1 0 0" rootId="505">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="流程模型分类科目" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新分类" onclick="_t_catalog_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_model" url="listModels.jhtml" onrender="_g_model_query" region="center">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="流程图" onclick="_w_diagram_show" icon="sitemap.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="流程建模" tooltip="构建流程模型" icon="icon8.png">
					<aos:menu>
						<aos:menuitem text="在线设计" onclick="_fn_initModeler" tooltip="在线设计流程模型" icon="page_paint.png" />
						<aos:menuitem text="在线克隆" tooltip="复制已有流程模型" icon="theme.png" />
						<aos:menuitem text="导入离线文件" onclick="_w_file_show" tooltip="导入离线设计的BPMN文件" icon="icon62.png" />
						<aos:menuitem text="导入离线文本" onclick="_w_text_show" tooltip="导入离线设计的BPMN文本" icon="icon75.png" />
					</aos:menu>
				</aos:dockeditem>
				<aos:dockeditem text="流程部署" onclick="_w_deploy_show" icon="share.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="修改" onclick="_w_props_show" icon="edit.png" />
				<aos:dockeditem text="删除" onclick="_g_model_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="模型名称" name="name_" id="name_" onenterkey="_g_model_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_model_query" width="200" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="#_g_model_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="模型扩展流水号" dataIndex="id_" hidden="true" />
			<aos:column header="模型ID" dataIndex="model_id_" hidden="true" />
			<aos:column header="模型名称" dataIndex="name_" width="250" celltip="true" />
			<aos:column header="建模方式" dataIndex="create_type_" rendererField="create_type_" />
			<aos:column header="建模时间" dataIndex="create_time_" width="160" />
			<aos:column header="建模人" dataIndex="create_user_" width="80" />
			<aos:column header="备注" dataIndex="remark_" flex="1" minWidth="250" celltip="true" />
		</aos:gridpanel>
	</aos:viewport>

	<aos:window id="_w_file" title="导入离线文件">
		<aos:formpanel id="_f_file" width="500" layout="column" labelWidth="70">
			<aos:combobox name="create_type_" fieldLabel="创建方式" value="3" readOnly="true" dicField="create_type_"
				columnWidth="0.5" />
			<aos:textfield name="name_" fieldLabel="模型名称" allowBlank="false" columnWidth="1" />
			<aos:filefield name="myFile1" fieldLabel="模型文件" buttonText="浏览BPMN文件" allowBlank="false" columnWidth="1"
				emptyText="请选择符合规范的BPMN流程模型文件..." />
			<aos:textareafield name="remark_" fieldLabel="备注" columnWidth="1" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_file_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_file.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_text" title="导入离线文本" height="-10">
		<aos:formpanel id="_f_text" width="800" layout="column" labelWidth="70">
			<aos:combobox name="create_type_" fieldLabel="创建方式" value="4" readOnly="true" dicField="create_type_"
				columnWidth="0.5" />
			<aos:textfield name="name_" fieldLabel="模型名称" allowBlank="false" columnWidth="1" />
			<aos:textareafield name="xmlModelText" fieldLabel="BPMN文本" allowBlank="false" height="-230" columnWidth="1" />
			<aos:textareafield name="remark_" fieldLabel="备注" columnWidth="1" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_text_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_text.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_props" title="修改模型">
		<aos:formpanel id="_f_props" width="500" layout="column" labelWidth="65">
			<aos:hiddenfield name="id_" />
			<aos:textfield name="model_id_" fieldLabel="模型ID" readOnly="true" columnWidth="0.5" />
			<aos:combobox name="create_type_" fieldLabel="建模方式" readOnly="true" dicField="create_type_" columnWidth="0.5" />
			<aos:textfield name="create_time_" fieldLabel="建模时间" readOnly="true" columnWidth="0.5" />
			<aos:textfield name="create_user_" fieldLabel="建模人" readOnly="true" columnWidth="0.5" />
			<aos:textfield name="name_" fieldLabel="模型名称" allowBlank="false" columnWidth="1" />
			<aos:textareafield name="remark_" fieldLabel="备注" columnWidth="1" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_props_save" text="保存" icon="ok.png" tooltip="保存流程属性数据" />
			<aos:dockeditem onclick="_fn_initModeler4Edit" text="修改模型" icon="edit.png" tooltip="在线修改流程模型" />
			<aos:dockeditem onclick="#_w_props.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_deploy" title="部署模型" onshow="_w_deploy_onshow">
		<aos:formpanel id="_f_deploy" width="500" layout="column" labelWidth="65">
			<aos:hiddenfield name="id_" />
			<aos:hiddenfield name="model_id_" />
			<aos:textfield name="create_time_" fieldLabel="建模时间" readOnly="true" columnWidth="0.5" />
			<aos:textfield name="create_user_" fieldLabel="建模人" readOnly="true" columnWidth="0.5" />
			<aos:textfield name="name_" fieldLabel="模型名称" readOnly="true" allowBlank="false" columnWidth="1" />
			<aos:textfield name="procdef_name_" fieldLabel="流程名称" allowBlank="false" columnWidth="1" />
			<aos:textareafield name="description_" fieldLabel="流程描述" columnWidth="1" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_fn_deployModel" text="部署" icon="share.png" tooltip="部署流程模型" />
			<aos:dockeditem onclick="#_w_deploy.hide();" text="关闭" icon="close.png" />
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
	
   //显示部署模型窗口
   function _w_deploy_show(){
	   var record = App.selectone(_g_model);
          if (record) {
              _w_deploy.show();
              App.reset(_f_deploy);
              _f_deploy.loadRecord(record);
          }
   }
   
    //监听部署模型弹出窗口
   function _w_deploy_onshow(){
	   var record = App.selectone(_g_model);
          App.ajax({
              url: '${cxt}/bpm/getMetaInfoFromXML.jhtml',
              params: record.data,
              ok: function (data) {
           	   App.val('_f_deploy.procdef_name_', data.name);
           	   App.val('_f_deploy.description_', data.description);
              }
          });
   }
   
	//树点击事件
    function _t_module_click(){
    	var record = App.selectone(_t_module);
    	if(!record.data.leaf && record.data.id !== '0'){
    		App.tip('请选择叶子节点。');
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
               if (App.selectone(_g_model)) {
                   _w_diagram.show();
               }
           }

           //监听流程图弹出窗口
           function _w_diagram_onshow() {
           	App.mask(null,_w_diagram);
           	   var record = App.selectone(_g_model);
               document.getElementById('_img_diagram').src = "${cxt}/bpm/graphModelByModelID.jhtml?model_id_=" + record.data.model_id_;
               var imgObj = document.getElementById('_img_diagram');
               //图像数据加载完毕
               if(imgObj.complete){
               	App.unmask();
               }
               imgObj.onload = function(){
               	App.unmask();
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
           
           //显示模型属性编辑窗口
           function _w_props_show() {
               var record = App.selectone(_g_model);
               if (record) {
                   _w_props.show();
                   _f_props.loadRecord(record);
               }
           }

           //更新模型基本属性
           function _f_props_save() {
               App.ajax({
                   url: 'updateModelProps.jhtml',
                   forms: _f_props,
                   ok: function (data) {
                       _w_props.hide();
                       App.tip(data.appmsg);
                       _g_model_store.reload();
                   }
               });
           }

           //查询模型列表
           function _g_model_query() {
               var params = {
               	name_: name_.getValue()
               };
               _g_model_store.getProxy().extraParams = params;
               _g_model_store.load();
           }

           //显示导入文件模型窗口
           function _w_file_show() {
               App.reset(_f_file);
               _w_file.show();
           }

           //导入文件模型(注：文件上传操作不能使用App.Ajax()方法，只能使用Form自带的submit()函数)。
           function _f_file_save() {
               var form = _f_file.getForm();
               if (!form.isValid()) {
                   return;
               }
               App.wait();
               form.submit({
                   timeout: 60000, // 60s
                   url: 'importFileModel.jhtml',
                   success: function (form, action) {
                       _w_file.hide();
                       App.hide();
                       App.tip(action.result.appmsg);
                       _g_model_store.load();
                   }
               });
           }

           //显示导入文本模型窗口
           function _w_text_show() {
               //新增
               App.reset(_f_text);
               _w_text.show();
           }

           //导入文本模型
           function _f_text_save() {
               App.ajax({
                   url: 'importTextModel.jhtml',
                   forms: _f_text,
                   ok: function (data) {
                       _w_text.hide();
                       App.tip(data.appmsg);
                       _g_model_store.reload();
                   }
               });
           }

           //删除模型
           function _g_model_del() {
               var rows = App.rows(_g_model);
               if (rows == 0) {
                   App.tip('删除前请先选中数据。');
                   return;
               }
               var msg = App.merge('确认要删除选中的[{0}]条模型数据吗？', rows);
               App.confirm(msg, function (btn) {
                   if (btn === 'cancel') {
                       App.tip('删除操作被取消。');
                       return;
                   }
                   App.ajax({
                       url: 'deleteModel.jhtml',
                       params: {
                           _selection: App.selection(_g_model, 'id_')
                       },
                       ok: function (data) {
                           App.tip(data.appmsg);
                           _g_model_store.reload();
                       }
                   });
               });
           }

           //发布模型为模型定义
           function _fn_deployModel() {
                   App.ajax({
                       url: 'deployModel.jhtml',
                       forms: _f_deploy,
                       ok: function (data) {
                           App.tip(data.appmsg);
                           _w_deploy.hide();
                           _g_procdef_store.reload();
                       }
                   });
           }

           //打开模型设计器-新建模型
           function _fn_initModeler() {
               //参数ID为页面
               parent.fnaddtab('${param.aos_module_id_ }_1', '流程模型设计[新增]', '/bpm/modeler/init.jhtml?id=-1');
           }

           //打开模型设计器-修改模型
           function _fn_initModeler4Edit(grid, rowIndex, colIndex) {
           	var rec;
           	if(grid){
           		rec = grid.getStore().getAt(rowIndex); //图标
           	}else{
           		rec = App.selectone(_g_model); //右键菜单
           	}
               //参数ID为页面
               parent.fnaddtab('${param.aos_module_id_ }' + rec.data.model_id_ , '流程模型设计[修改]', '/bpm/modeler/init.jhtml?id=' + rec.data.model_id_);
           }
           
           //刷新分类树
           function _t_catalog_refresh() {
               var refreshnode = App.selectone(_t_catalog);
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
        </script>
</aos:onready>
</aos:html>
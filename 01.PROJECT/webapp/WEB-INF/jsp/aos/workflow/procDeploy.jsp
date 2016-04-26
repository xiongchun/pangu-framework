<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="流程部署">
	<aos:include lib="ext" />
	<aos:base href="workflow/procDeploy" />
</aos:head>
<aos:body>
	<div id="_div_diagram" class="x-hidden" align="center">
		<img id="_img_diagram" style="vertical-align: middle;" />
	</div>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_proc" onrender="_g_proc_query" pageType="client" onitemdblclick="_w_diagram_show">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem text="流程列表" xtype="tbtext" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="发布流程" tooltip="导入并部署设计器设计的符合BPMN规范的流程模型文件" onclick="_w_deploy_show" icon="add.png" />
				<aos:dockeditem text="删除流程" onclick="_g_proc_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="流程名称" name="name_" id="name_" onenterkey="" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="_g_proc_query" width="200" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="发布流程" onclick="_w_deploy_show" icon="add.png" />
				<aos:menuitem text="删除流程" onclick="_g_proc_del" icon="del.png" />
				<aos:menuitem text="查看流程图" onclick="_w_diagram_show" icon="query.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="_g_proc_query" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流程ID" dataIndex="id_" hidden="true" />
			<aos:column header="流程名称" dataIndex="name_" width="180" celltip="true" />
			<aos:column header="流程KEY" dataIndex="key_" width="160" celltip="true" />
			<aos:column header="版本号" dataIndex="version_" width="60" celltip="true" />
			<aos:column header="资源名称" dataIndex="resource_name_" width="180" celltip="true" />
			<aos:column header="活动状态" dataIndex="suspension_state_" rendererField="procdef_suspension_state_" width="80" />
			<aos:column header="发布时间" dataIndex="deploy_time_" width="120" />
			<aos:column header="流程描述" dataIndex="description_" celltip="true" />
			<aos:column header="操作" rendererFn="fn_status_render" align="center" width="50" minWidth="50" maxWidth="50" />
			<aos:column header="流程图" rendererFn="fn_diagram_render" align="center" width="60" minWidth="60" maxWidth="60" />
		</aos:gridpanel>
	</aos:viewport>

	<aos:window id="_w_deploy" title="发布流程">
		<aos:formpanel id="_f_deploy" width="450" layout="column" labelWidth="70">
			<aos:filefield name="myFile1" fieldLabel="流程模型" buttonText="选择BPMN文件" allowBlank="false" columnWidth="0.99"
				emptyText="请选择符合规范的BPMN文件..." />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_deploy_save" text="发布" icon="ok.png" />
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
	    
	  // 查询流程列表 客户端分页
		function _g_proc_query() {
			var params = {};
			AOS.mask('正在读取数据, 请稍候...', _g_proc);
			AOS.ajax({
				wait : false,
				url : 'listProcs.jhtml',
				params : params,
				ok : function(data) {
					_g_proc_store.proxy.data = data;
					_g_proc_store.loadPage(1,{
						callback : function() {
							AOS.unmask();
						}
					});
				}
			});
		}
	
	   //显示部署窗口
	   function _w_deploy_show(){
		   AOS.reset(_f_deploy);
	       _w_deploy.show();
	   }
	    
	
	   //部署(注：文件上传操作不能使用AOS.Ajax()方法，只能使用Form自带的submit()函数)。
	   function _f_deploy_save() {
	       var form = _f_deploy.getForm();
	       if (!form.isValid()) {
	           return;
	       }
	       AOS.wait();
	       form.submit({
	           url: 'deployProc.jhtml',
	           success: function (form, action) {
	               _w_deploy.hide();
	               AOS.hide();
	               AOS.tip(action.result.appmsg);
	               _g_proc_query();
	           }
	       });
	   }
		
       //关闭流程图窗口
       function _w_diagram_hide() {
           _w_diagram.hide();
           _w_diagram.center();
       }

       //显示流程图窗口
       function _w_diagram_show() {
           if (AOS.selectone(_g_proc)) {
               _w_diagram.show();
           }
       }

       //监听流程图弹出窗口
       function _w_diagram_onshow() {
       	AOS.mask(null,_w_diagram);
       	   var record = AOS.selectone(_g_proc);
           document.getElementById('_img_diagram').src = "${cxt}/workflow/graphByProcdefID.jhtml?proc_def_id_=" + record.data.id_;
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

       //删除模型
       function _g_proc_del() {
           var rows = AOS.rows(_g_proc);
           if (rows == 0) {
               AOS.tip('删除前请先选中数据。');
               return;
           }
           var msg = AOS.merge('确认要删除选中的[{0}]条模型数据吗？', rows);
           AOS.confirm(msg, function (btn) {
               if (btn === 'cancel') {
                   AOS.tip('删除操作被取消。');
                   return;
               }
               AOS.ajax({
                   url: 'delProcDef.jhtml',
                   params: {
                       aos_rows_: AOS.selection(_g_proc, 'id_')
                   },
                   ok: function (data) {
                       AOS.tip(data.appmsg);
                       _g_proc_query();
                   }
               });
           });
       }
       
    //操作按钮列
   	function fn_status_render(value, metaData, record, rowIndex, colIndex, store){
    	var outHtml = '<input type="button" value="挂起" class="cbtn" onclick="fn_update_status();" />';
    	if(record.data.suspension_state_ === '2'){
    		outHtml = '<input type="button" value="激活" class="cbtn" onclick="fn_update_status();" />';
    	}
   		return outHtml;
   	}
       
     //流程图按钮列
	function fn_diagram_render(value, metaData, record, rowIndex, colIndex, store){
		return '<input type="button" value="流程图" class="cbtn" onclick="fn_showDiagramWidow();" />';
	}
 </script>
</aos:onready>
<script type="text/javascript">
    //显示流程图窗口
    function fn_showDiagramWidow(){
    	 Ext.getCmp('_w_diagram').show();
    }
    
    //修改流程定义状态
    function fn_update_status(){
    	var record = AOS.selectone(_g_proc);
    	AOS.ajax({
            url: 'delProcDef.jhtml',
            params: {
                id_:record.data.id_,
                suspension_state_:record.data.suspension_state_
            },
            ok: function (data) {
                AOS.tip(data.appmsg);
                _g_proc_query();
            }
        });
    }
</script>
</aos:html>